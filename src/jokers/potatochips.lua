
SMODS.Joker { --Potato Chips
    key = "potatochips",
    config = {
        extra = {
            potatochip_var = 4
        }
    },
    loc_txt = {
        ['name'] = 'Potato Chips',
        ['text'] = {
            [1] = 'When held gain a {C:attention}+1{} Joker slot.',
            [2] = 'Last {C:attention}4 {}rounds',
            [3] = '(#1#/4)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fprvilege_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.potatochip_var}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if to_big(card.ability.extra.potatochip_var) > to_big(1) then
                return {
                    func = function()
                        card.ability.extra.potatochip_var = math.max(0, (card.ability.extra.potatochip_var) - 1)
                        return true
                    end,
                    message = "MUNCH!"
                }
            elseif to_big(card.ability.extra.potatochip_var) == to_big(1) then
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
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Munch!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            end
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 2
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 2
    end
}