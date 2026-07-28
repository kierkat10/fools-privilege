
SMODS.Joker{
    key = "imprudent",
    name = "Imprudent Joker",
    config = { extra = { dollars = 2 } },
    pos = { x = 1, y = 0 },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    atlas = "joker",
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands["Two Pair"]) then
            return {
                dollars = card.ability.extra.dollars
            }
        end
    end
}