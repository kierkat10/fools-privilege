
SMODS.Joker {
    key = "croupier",
    name = "Croupier",
    pos = { x = 6, y = 1 },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    atlas = "joker",
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                swap = true
            }
        end
    end
}