
SMODS.Joker { --Blueberry Porridge
    key = "blueberryporridge",
    config = {
        extra = {
            mult0 = 4,
            odds = 5,
            dollars0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Blueberry Porridge',
        ['text'] = {
            [1] = 'Scored {C:clubs}Clubs{} give {C:red}+4{} Mult',
            [2] = '{C:green}#1#{} in {C:green}#2#{} chance this card is',
            [3] = 'eaten at the end of round',
            [4] = '{C:attention}Gain {}{C:money}+$2{} when {C:red}destroyed{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 9
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_fpr_blueberryporridge') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Clubs") then
                return {
                    mult = 4
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_7d190449', 1, card.ability.extra.odds, 'j_fpr_blueberryporridge', false) then
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
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + 2
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2), colour = G.C.MONEY})
                            return true
                        end}, card)
                    end
                end
            end
        end
    }