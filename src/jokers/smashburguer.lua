
SMODS.Joker{ --Smash Burguer
    key = "smashburguer",
    config = {
        extra = {
            smashburguer_var = 2,
            sb_var = 8
        }
    },
    loc_txt = {
        ['name'] = 'Smash Burguer',
        ['text'] = {
            [1] = '{C:attention}Played {}hands apply',
            [2] = '{X:red,C:white}X#1#{} Mult and {C:money}-#2#${}.',
            [3] = 'when the round ends,',
            [4] = '{C:red}decrease {}money {C:red}loss {}',
            [5] = 'by {C:money}$1{} and Mult by {X:mult,C:white}X0.5{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fpv_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.smashburguer_var, card.ability.extra.sb_var}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.smashburguer_var,
                extra = {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + card.ability.extra.sb_var
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.sb_var), colour = G.C.MONEY})
                        return true
                    end,
                    colour = G.C.MONEY
                }
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if to_big((card.ability.extra.smashburguer_var or 0)) ~= to_big(0) then
                return {
                    func = function()
                        card.ability.extra.smashburguer_var = math.max(0, (card.ability.extra.smashburguer_var) - 0.5)
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.sb_var = math.max(0, (card.ability.extra.sb_var) - 2)
                            return true
                        end,
                        colour = G.C.RED
                    }
                }
            elseif to_big((card.ability.extra.smashburguer_var or 0)) == to_big(0) then
                return {
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
                    end
                }
            end
        end
    end
}