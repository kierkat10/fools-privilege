
SMODS.Joker {
    key = "regular",
    name = "Regular Joker",
    config = { extra = { chips = 40 } },
    pos = { x = 9, y = 1 },
    cost = 2,
    rarity = 1,
    blueprint_compat = true,
    atlas = "joker",
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}