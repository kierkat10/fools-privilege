
SMODS.Joker {
    key = "schrodinger",
    name = "Schrödinger",
    config = {
        extra = {
            odds = 2,
            xmult = 2.5
        }
    },
    pos = { x = 3, y = 1 },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    unlocked = false,
    atlas = "joker",
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "fpr_schrodinger", nil, true) 
        return {
            vars = {
                numerator, 
                denominator,
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and SMODS.pseudorandom_probability(card, "fpr_schrodinger", 1, card.ability.extra.odds, nil, true) then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}