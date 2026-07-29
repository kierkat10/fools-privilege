
SMODS.Joker { --Creeper
    key = "creeper",
    config = {
        extra = {
            creeper_var = 0
        }
    },
    loc_txt = {
        ['name'] = 'Creeper',
        ['text'] = {
            [1] = 'At end of {C:attention}round {}{C:red}destroy{}',
            [2] = 'both adjacents {C:attention}Jokers {}and {C:attention}itself{}',
            [3] = 'and earn {X:attention,C:white}X4 {} sell values',
            [4] = 'of the adjacents {C:attention}Jokers{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fprvilege_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.creeper_var}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
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
                end,
                extra = {
                    func = function()
                        local my_pos = nil
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i] == card then
                                my_pos = i
                                break
                            end
                        end
                        local target_joker = nil
                        if my_pos and my_pos < #G.jokers.cards then
                            local joker = G.jokers.cards[my_pos + 1]
                            if not SMODS.is_eternal(joker) and not joker.getting_sliced then
                                target_joker = joker
                            end
                        end
                        
                        if target_joker then
                            local joker_sell_value = target_joker.sell_cost or 0
                            local sell_value_gain = joker_sell_value * 4
                            card.ability.extra.creeper_var = card.ability.extra.creeper_var + sell_value_gain
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:explode({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end,
                    colour = G.C.RED,
                    extra = {
                        func = function()
                            local my_pos = nil
                            for i = 1, #G.jokers.cards do
                                if G.jokers.cards[i] == card then
                                    my_pos = i
                                    break
                                end
                            end
                            local target_joker = nil
                            if my_pos and my_pos > 1 then
                                local joker = G.jokers.cards[my_pos - 1]
                                if not SMODS.is_eternal(joker) and not joker.getting_sliced then
                                    target_joker = joker
                                end
                            end
                            
                            if target_joker then
                                local joker_sell_value = target_joker.sell_cost or 0
                                local sell_value_gain = joker_sell_value * 4
                                card.ability.extra.creeper_var = card.ability.extra.creeper_var + sell_value_gain
                                target_joker.getting_sliced = true
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        target_joker:explode({G.C.RED}, nil, 1.6)
                                        return true
                                    end
                                }))
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                            end
                            return true
                        end,
                        colour = G.C.RED,
                        extra = {
                            
                            func = function()
                                
                                local current_dollars = G.GAME.dollars
                                local target_dollars = G.GAME.dollars + card.ability.extra.creeper_var
                                local dollar_value = target_dollars - current_dollars
                                ease_dollars(dollar_value)
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.creeper_var), colour = G.C.MONEY})
                                return true
                            end,
                            colour = G.C.MONEY
                        }
                    }
                }
            }
        end
    end
}