
SMODS.Joker {
    key = "sugar_free_cola",
    name = "Sugar-Free Cola",
    config = { extra = { tags = 3 } },
    pos = { x = 8, y = 0 },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    atlas = "joker",
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tags } }
    end,
    calculate = function(self, card, context)
        if context.selling_self then
            for i = 1, card.ability.extra.tags do
                local selected_tag = pseudorandom_element(G.P_TAGS, pseudoseed("fpr_sugar_free_cola")).key
                local tag = Tag(selected_tag)
                if tag.name == "Orbital Tag" then
                    local _poker_hands = {}
                    for k, v in pairs(G.GAME.hands) do
                        if v.visible then
                            _poker_hands[#_poker_hands + 1] = k
                        end
                    end
                    tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "fpr_sugar_free_cola")
                end
                tag:set_ability()
                add_tag(tag)
                play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
                play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
            end
        end
    end
}