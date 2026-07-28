
SMODS.Joker{ --Dalgona Cookie
    key = "dalgonacookie",
    config = {
        extra = {
            handsremaining = 0,
            currentchiptotal = 0,
            blindchiprequirement = 0,
            hands0 = 1,
            discards0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Dalgona Cookie',
        ['text'] = {
            [1] = 'If last {C:blue}Hand {}of round',
            [2] = 'does not clear{C:attention} Blind{} gain',
            [3] = 'a temporary {C:blue}Hand{} and {C:red}Discard{}',
            [4] = 'then {C:red}self destruct{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["foolspri_foolsprivilege_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {(G.GAME.current_round.hands_left or 0), (G.GAME.chips or 0), (G.GAME and G.GAME.blind and G.GAME.blind.chips or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers  then
            if (to_big(G.GAME.current_round.hands_left) == to_big(0) and to_big(G.GAME.chips) < to_big(G.GAME.blind.chips)) then
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hands", colour = G.C.GREEN})
                        
                        G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 1
                        return true
                    end,
                    extra = {
                        
                        func = function()
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Discards", colour = G.C.GREEN})
                            
                            G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + 1
                            return true
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                                local target_joker = card
                                
                                if target_joker then
                                    target_joker.getting_sliced = true
                                    G.E_MANAGER:add_event(Event({
                                        func = function()
                                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                            return true
                                        end
                                    }))
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                                end
                                return true
                            end,
                            colour = G.C.RED
                        }
                    }
                }
            end
        end
    end
}