
SMODS.Joker{ --Dark Chocolate
    key = "darkchocolate",
    config = {
        extra = {
            dc_mult = 0,
            odds = 7
        }
    },
    loc_txt = {
        ['name'] = 'Dark Chocolate',
        ['text'] = {
            [1] = 'This {C:attention}Joker {}gains {C:red}+1{} Mult when a',
            [2] = 'played card is scored',
            [3] = '{C:green}#2# {}in {C:green}#3# {}chance this card is',
            [4] = 'destroyed at end of round',
            [5] = '(Currently {C:red}#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fpr_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_fpr_darkchocolate') 
        return {vars = {card.ability.extra.dc_mult, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            card.ability.extra.dc_mult = (card.ability.extra.dc_mult) + 1
            return {
                message = "UPGRADE!"
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    mult = card.ability.extra.dc_mult
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_53433959', 1, card.ability.extra.odds, 'j_fpr_darkchocolate', false) then
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
                            
                        end
                        return true
                    end
                }
            end
        end
    end
}