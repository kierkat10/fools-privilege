
SMODS.Joker { --Tomato Soup
    key = "tomatosoup",
    config = {
        extra = {
            xmult0 = 2,
            odds = 10
        }
    },
    loc_txt = {
        ['name'] = 'Tomato Soup',
        ['text'] = {
            [1] = '{X:red,C:white}X2{} Mult for each',
            [2] = '{C:attention} hand played{} that',
            [3] = 'contains both {C:red}Red Suits{}',
            [4] = '{C:green}#1#{} in {C:green}#2#{} chance to destroy'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fpv_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_fpr_tomatosoup') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Hearts") then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Diamonds") then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) then
                return {
                    Xmult = 2
                }
            elseif true then
                if SMODS.pseudorandom_probability(card, 'group_0_fd0c875b', 1, card.ability.extra.odds, 'j_fpr_tomatosoup', false) then
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
            end
        end
    end
}