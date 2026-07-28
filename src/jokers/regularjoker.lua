
SMODS.Joker{ --Regular Joker
    key = "regular",
    config = { extra = { chips = 40 } },
    loc_txt = {
        ['name'] = 'Regular',
        ['text'] = {
            '{C:blue}+#1#{} Chips'
        }
    },
    pos = { x = 9, y = 1 },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    atlas = 'joker',
    pools = { ["fpr_fpv_jokers"] = true },
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}