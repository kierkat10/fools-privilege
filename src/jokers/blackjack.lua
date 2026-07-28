
SMODS.Joker{ --Blackjack
    key = "blackjack",
    config = {
        extra = {
            mult_bj = 0
        }
    },
    loc_txt = {
        ['name'] = 'Blackjack',
        ['text'] = {
            [1] = 'This {C:attention}Joker {}gains {C:red}+21{} Mult if',
            [2] = '{C:attention}scoring {}hand contains',
            [3] = '{C:attention}2 {}face cards and an {C:attention}Ace{}',
            [4] = '(Currently {C:red}#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 3
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
    atlas = 'joker',
    pools = { ["fpr_fprvilege_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.mult_bj}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if true then
                        count = count + 1
                    end
                end
                return count == 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if true then
                        count = count + 1
                    end
                end
                return count == 2
            end)()) then
                card.ability.extra.mult_bj = (card.ability.extra.mult_bj) + 21
                return {
                    message = "UPGRADE!"
                }
            else
                return {
                    mult = card.ability.extra.mult_bj
                }
            end
        end
    end
}