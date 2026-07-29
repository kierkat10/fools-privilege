
SMODS.Joker {
    key = "backroom",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Backroom',
        ['text'] = {
            [1] = 'When selecting a',
            [2] = '{C:attention}Small{}, {C:attention}Big {}or {C:attention}Boss {}{C:attention}Blind{},',
            [3] = 'create a random Negative {C:planet}Planet{}, {C:tarot}',
            [4] = 'Tarot{} or {C:spectral}Spectral{} card respectively'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fprvilege_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if G.GAME.blind:get_type() == 'Small' then
                return {
                    func = function()
                        
                        for i = 1, 1 do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                    end
                                    
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Planet', edition = 'e_negative', })                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet})
                        end
                        return true
                    end
                }
            elseif G.GAME.blind:get_type() == 'Big' then
                return {
                    func = function()
                        
                        for i = 1, 1 do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                    end
                                    
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Tarot', edition = 'e_negative', })                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                        end
                        return true
                    end
                }
            elseif G.GAME.blind.boss then
                return {
                    func = function()
                        
                        for i = 1, 1 do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                    end
                                    
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Spectral', edition = 'e_negative', })                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                        end
                        return true
                    end
                }
            end
        end
    end
}