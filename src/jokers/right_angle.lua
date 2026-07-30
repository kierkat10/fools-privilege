SMODS.Joker {
    key = "rightangle",
    config = {
        extra = {
            chips_mod = 20,
            chips_mod_2 = 5,
            chips = 0
        }
    },
    pos = { x = 8, y = 1 },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    atlas = 'joker',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips_mod,
                card.ability.extra.chips_mod_2,
                card.ability.extra.chips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before then
            if next(context.poker_hands["Three of a Kind"]) then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "chips",
                    scalar_value = "chips_mod",
                    message_colour = G.C.CHIPS
                })
            elseif card.ability.extra.chips ~= 0 then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "chips",
                    scalar_value = "chips_mod_2",
                    message_colour = G.C.CHIPS,
                    operation = function(ref_table, ref_value, initial, change)
                        ref_table[ref_value] = math.max(0, ref_table[ref_value] - change)
                    end
                })
            end
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}