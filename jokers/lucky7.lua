
SMODS.Joker{ --Lucky 7
    key = "lucky7",
    config = {
        extra = {
            odds = 5,
            odds2 = 20,
            mult0 = 20,
            dollars0 = 20
        }
    },
    loc_txt = {
        ['name'] = 'Lucky 7',
        ['text'] = {
            [1] = 'If scored hand has',
            [2] = 'at least two 7s,',
            [3] = 'all scored cards',
            [4] = 'are considered {C:attention}Lucky{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["foolspri_foolspri_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_lucky"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_lucky\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_foolspri_lucky7')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_foolspri_lucky7')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 7 then
                        count = count + 1
                    end
                end
                return count >= 2
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_0f5d8c45', 1, card.ability.extra.odds, 'j_foolspri_lucky7', false) then
                    SMODS.calculate_effect({mult = 20}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_98270862', 1, card.ability.extra.odds2, 'j_foolspri_lucky7', false) then
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + 20
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(20), colour = G.C.MONEY})
                            return true
                        end}, card)
                    end
                end
            end
        end
    }