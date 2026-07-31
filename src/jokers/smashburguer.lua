
SMODS.Joker {
    key = "burger",
    config = {
        extra = {
            xmult = 2,
            dollars = 4,
            xmult_mod = 0.25,
            dollars_mod = 1
        }
    },
    pos = { x = 1, y = 2 },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    atlas = 'joker',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult, 
                card.ability.extra.dollars,
                card.ability.extra.xmult_mod,
                card.ability.extra.dollars_mod
            }
        }
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
                dollars = -card.ability.extra.dollars
            }
        end
        if context.end_of_round and context.main_eval and not context.blueprint then
            if
                (
                    (card.ability.extra.xmult - card.ability.extra.xmult_mod) <= 0 or
                    (card.ability.extra.dollars - card.ability.extra.dollars_mod) <= 0
                )
            then
                SMODS.destroy_cards(card, { pinch_anim = true })
                return {
                    message = localize("k_eaten_ex")
                }
            else
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "xmult",
                    scalar_value = "xmult_mod",
                    operation = "-",
                    scaling_message = {
                        message = "-X" .. card.ability.extra.xmult_mod .. " Mult" .. (card.ability.extra.xmult_mod > 1 and "s" or ""),
                        colour = G.C.MULT
                    }
                })
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "dollars",
                    scalar_value = "dollars_mod",
                    operation = "-",
                    scaling_message = {
                        message = "-$" .. card.ability.extra.dollars_mod,
                        colour = G.C.MONEY
                    }
                })
            end
        end
    end
}