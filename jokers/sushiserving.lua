
SMODS.Joker{ --Sushi Serving
    key = "sushiserving",
    config = {
        extra = {
            xchips = 2.5,
            xchips_mod = 0.25
        }
    },
    loc_txt = {
        ['name'] = 'Sushi Serving',
        ['text'] = {
            '{C:white,X:chips}X#1#{} Chips,',
            'loses {X:chips,C:white}X#2#{} Chips at',
            'end of round'
        }
    },
    pos = { x = 5, y = 0 },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    atlas = 'CustomJokers',
    pools = { ["foolspri_foolspri_jokers"] = true },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.xchips_mod
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xchips = card.ability.extra.xchips
            }
        end
        if context.end_of_round and context.main_eval and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xchips",
                scalar_value = "xchips_mod",
                operation = "-",
                scaling_message = {
                    message = "-X" .. card.ability.extra.xchips_mod .. " Chip" .. (card.ability.extra.xchips_mod == 1 and "" or "s"),
                    colour = G.C.CHIPS
                }
            })
        end
    end
}