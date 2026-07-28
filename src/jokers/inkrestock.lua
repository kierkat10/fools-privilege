
SMODS.Joker{ --Ink Restock
    key = "inkrestock",
    config = {
        extra = {
            ink_chips = 0,
            ink_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Ink Restock',
        ['text'] = {
            [1] = 'This {C:attention}Joker {}gains {C:blue}2{} Chips',
            [2] = 'and {C:red}0.5{} mult',
            [3] = 'for each {C:attention}Black suit{} card scored',
            [4] = '{s:0.9}(Black: Spades/Clubs){}',
            [5] = '(Currently {C:blue}+#1#{} Chips, {C:red}#2#{} mult)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 5
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
        
        return {vars = {card.ability.extra.ink_chips, card.ability.extra.ink_mult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if (context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs")) then
                card.ability.extra.ink_chips = (card.ability.extra.ink_chips) + 2
                card.ability.extra.ink_mult = (card.ability.extra.ink_mult) + 0.5
                return {
                    message = "UPGRADE!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.ink_chips,
                extra = {
                    mult = card.ability.extra.ink_mult
                }
            }
        end
    end
}