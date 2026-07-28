
SMODS.Joker{ --Shopping Stop
    key = "shoppingstop",
    config = {
        extra = {
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'Shopping Stop',
        ['text'] = {
            [1] = '{C:green}#1# {}in {C:green}#2#{} chance of creating a',
            [2] = '{C:tarot}Tarot{} card when a',
            [3] = '{C:attention}Joker {}is sold'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fprvilege_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_fpr_shoppingstop') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.selling_card  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_2ef25a71', 1, card.ability.extra.odds, 'j_fpr_shoppingstop', false) then
                    SMODS.calculate_effect({func = function()
                        
                        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Tarot', })                            
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
                    end}, card)
                end
            end
        end
    end
}