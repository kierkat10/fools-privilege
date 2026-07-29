
SMODS.Joker {
    key = "blue_moon",
    name = "Blue Moon",
    pos = { x = 1, y = 1 },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    atlas = "joker",
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "e_negative_consumable", set = "Edition", config = { extra = 1 } }
    end,
    calculate = function(self, card, context)
        if
            context.using_consumeable and
            context.consumeable and
            not (context.consumeable.edition and context.consumeable.edition.negative) and
            context.consumeable.ability.set == "Planet" and
            #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit
        then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    play_sound("timpani")
                    SMODS.add_card({
                        set = "Planet",
                        edition = "e_negative",
                        key_append = "bof_blue_moon"
                    })
                    G.GAME.consumeable_buffer = 0
                    return true
                end
            }))
            return {
                message = localize("k_plus_planet"),
                colour = G.C.SET.Planet
            }
        end
    end
}