
SMODS.Joker { --Red Wine
    key = "redwine",
    config = {
        extra = {
            xmult0 = 2.5,
            odds = 10
        }
    },
    loc_txt = {
        ['name'] = 'Red Wine',
        ['text'] = {
            [1] = '{X:red,C:white}X2.5{} Mult.',
            [2] = '{C:green}#1#{} in {C:green}#2#{} chance of {C:red}destroying {}',
            [3] = 'at the {C:attention}end {}of the {C:attention}round{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fpv_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_fpr_redwine') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 2.5
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_1644b559', 1, card.ability.extra.odds, 'j_fpr_redwine', false) then
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
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed", colour = G.C.RED})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}