
SMODS.Joker { --Triangle Joker
    key = "trianglejoker",
    config = {
        extra = {
            tj_chips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Triangle Joker',
        ['text'] = {
            [1] = 'This {C:attention}Joker {}gains {C:blue}+3{} Chips',
            [2] = 'for each {C:attention}3{}, {C:attention}6 {}or {C:attention}9{}{C:attention} {}{C:attention}scored{}',
            [3] = '(Currently {C:blue}#1#{} chips)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fprvilege_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.tj_chips}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if true then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if true then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if true then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) then
                card.ability.extra.tj_chips = (card.ability.extra.tj_chips) + 3
                return {
                    message = "UPGRADE!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.tj_chips
            }
        end
    end
}