
SMODS.Joker {
    key = "stardust",
    name = "Stardust Joker",
    config = {
        extra = {
            xmult_mod = 0.05,
            xmult = 1
        }
    },
    pos = { x = 0, y = 2 },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    atlas = "joker",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_mod,
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.discard and not context.blueprint then
            if G.GAME.blind.boss then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "xmult",
                    scalar_value = "xmult_mod",
                    scaling_message = {
                        message = "X" .. (card.ability.extra.xmult + card.ability.extra.xmult_mod) .. " Mult",
                        colour = G.C.MULT,
                        delay = 0.2
                    }
                })
            end
        end
        if context.joker_main then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
    end
}