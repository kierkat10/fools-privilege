
SMODS.Joker{ --Nutella Cookie
    key = "nutellacookie",
    config = {
        extra = {
            nutellacookie_var = 1,
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'Nutella Cookie',
        ['text'] = {
            [1] = '{C:attention}Earn {}{C:money}$#1#{} at end of round',
            [2] = 'Payout {C:attention}increases {}by {C:money}$2{}',
            [3] = 'when {C:attention}Big{} or {C:attention}Boss Blind{} is {C:red}defeated{}',
            [4] = '{C:green}#2#{} in {C:green}#3#{} chance this card is',
            [5] = 'eaten at the end of the Boss Blind'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["foolspri_fpv_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_foolspri_nutellacookie') 
        return {vars = {card.ability.extra.nutellacookie_var, new_numerator, new_denominator}}
    end, 
    
    calc_dollar_bonus = function(card)
        local blind_reward = 0
        blind_reward = blind_reward + math.max(card.config.extra.nutellacookie_var, 0)
        if blind_reward > 0 then
            return blind_reward
        end
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            if true then
                return {
                    func = function()
                        card.ability.extra.nutellacookie_var = (card.ability.extra.nutellacookie_var) + 2
                        return true
                    end
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_1ee2838d', 1, card.ability.extra.odds, 'j_foolspri_nutellacookie', false) then
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
                        return true
                    end
                }
            end
        end
    end
}