SMODS.Joker {
    key = "blue_cola",
    config = { extra = { cards = 2 } },
    pos = { x = 0, y = 1 },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = false,
    atlas = 'joker',
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards } }
    end,
    calculate = function(self, card, context)
        if context.selling_self then
            for i = 1, card.ability.extra.cards do
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        func = function()
                            play_sound("timpani")
                            SMODS.add_card({
                                set = "Spectral",
                                key_append = "fpr_blue_cola"
                            })
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
            end
        end
    end
}