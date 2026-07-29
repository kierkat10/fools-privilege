
SMODS.Joker {
    key = "grape_cola",
    name = "Grape Cola",
    pos = { x = 9, y = 0 },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    atlas = "joker",
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_TAGS.tag_negative
    end,
    calculate = function(self, card, context)
        if context.selling_self then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag({ key = "tag_negative" })
                    play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
                    play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
                    return true
                end)
            }))
            return nil, true
        end
    end
}