
SMODS.Joker{ --Sashimi
    key = "sashimi",
    config = {
        extra = {
            sashimi_chips = 0,
            odds = 7
        }
    },
    loc_txt = {
        ['name'] = 'Sashimi',
        ['text'] = {
            [1] = 'This {C:attention}Joker {}gains {C:blue}+2{} Chips',
            [2] = 'when a card is scored',
            [3] = '{C:green}1{} in {C:green}7{} chance to',
            [4] = 'consume on {C:red}discard{}',
            [5] = '(Currently {C:blue}+#1#{} Chips)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fpv_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_fpr_sashimi') 
        return {vars = {card.ability.extra.sashimi_chips, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            card.ability.extra.sashimi_chips = (card.ability.extra.sashimi_chips) + 2
            return {
                message = "!Upgrade"
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.sashimi_chips
            }
        end
        if context.pre_discard  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_6069a3fb', 1, card.ability.extra.odds, 'j_fpr_sashimi', true) then
                    SMODS.calculate_effect({func = function()
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
                    end}, card)
                end
            end
        end
    end
}