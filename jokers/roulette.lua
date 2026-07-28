
SMODS.Joker{ --Roulette
    key = "roulette",
    config = {
        extra = {
            roulette_xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Roulette',
        ['text'] = {
            [1] = 'If {C:attention}played hand {}contains',
            [2] = 'both and only {C:attention}Black {}suits or both and only {C:attention}Red {}suits',
            [3] = 'this {C:attention}Joker {}gains {X:red,C:white}X0.2{} Mult',
            [4] = '(Black: Spades/Clubs, Red: Hearts/Diamonds)',
            [5] = '(Currently {X:mult,C:white}X#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["foolspri_foolsprivilege_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.roulette_xmult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Spades") then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Clubs") then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Hearts") or playing_card:is_suit("Diamonds") then
                        count = count + 1
                    end
                end
                return count == 0
            end)()) then
                card.ability.extra.roulette_xmult = (card.ability.extra.roulette_xmult) + 0.2
                return {
                    message = "UPGRADE!",
                    extra = {
                        Xmult = card.ability.extra.roulette_xmult
                    }
                }
            elseif ((function()
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
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Spades") or playing_card:is_suit("Clubs") then
                        count = count + 1
                    end
                end
                return count == 0
            end)()) then
                card.ability.extra.roulette_xmult = (card.ability.extra.roulette_xmult) + 0.2
                return {
                    message = "UPGRADE!",
                    extra = {
                        Xmult = card.ability.extra.roulette_xmult
                    }
                }
            else
                return {
                    Xmult = card.ability.extra.roulette_xmult
                }
            end
        end
    end
}