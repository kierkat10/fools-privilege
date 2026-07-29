SMODS.Joker {
    key = "rainbow_end",
    name = "Rainbow End",
    config = { extra = { odds = 10 } },
    pos = { x = 2, y = 1 },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    atlas = "joker",
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "fpr_rainbowend") 
        return {
            vars = {
                numerator, 
                denominator
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and SMODS.pseudorandom_probability(card, "fpr_rainbowend", 1, card.ability.extra.odds) then
            for _, scored_card in ipairs(context.scoring_hand) do
                scored_card:set_edition("e_polychrome")
            end
            return {
                message = "Polychrome!",
                colour = G.C.DARK_EDITION
            }
        end
    end
}