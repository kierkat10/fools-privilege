
SMODS.Joker {
    key = "spin_wheel",
    name = "Spin the Wheel",
    config = { extra = { dollars = 3 } },
    pos = { x = 5, y = 1 },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    atlas = "joker",
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            local selected_tag = pseudorandom_element(G.P_TAGS, pseudoseed("fpr_spin_wheel")).key
            local tag = Tag(selected_tag)
            if tag.name == "Orbital Tag" then
                local _poker_hands = {}
                for k, v in pairs(G.GAME.hands) do
                    if v.visible then
                        _poker_hands[#_poker_hands + 1] = k
                    end
                end
                tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "fpr_spin_wheel")
            end
            tag:set_ability()
            add_tag(tag)
            play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
            play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
            return {
                dollars = -card.ability.extra.dollars
            }
        end
    end
}