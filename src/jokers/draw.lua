SMODS.Joker {
    key = "draw",
    name = "Draw 4",
    config = {
        extra = {
            cards = 4,
            hands = 1
        }
    },
    pos = { x = 7, y = 1 },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    atlas = "joker",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cards,
                card.ability.extra.hands
            }
        }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
        ease_hands_played(-card.ability.extra.hands)
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            if G.hand and #G.hand.cards > 0 then
                SMODS.draw_cards(card.ability.extra.cards)
            end
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
        ease_hands_played(card.ability.extra.hands)
    end
}