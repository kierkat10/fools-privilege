SMODS.Joker {
    key = "dalgona",
    name = "Dalgona Cookie",
    config = {
        extra = {
            hands = 1,
            discards = 1
        }
    },
    pos = { x = 6, y = 0 },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    atlas = "joker",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hands,
                card.ability.extra.discards
            }
        }
    end,
    calculate = function(self, card, context)
        if context.fpr_emergency then
            ease_hands_played(card.ability.extra.hands)
            ease_discard(card.ability.extra.discards)
            SMODS.destroy_cards(card, { pinch_anim = true })
            return {
                message = "+" .. card.ability.extra.hands .. " Hand" .. (card.ability.extra.hands == 1 and "" or "s"),
                colour = G.C.BLUE,
                extra = {
                    message = "+" .. card.ability.extra.discards .. " Discard" .. (card.ability.extra.discards == 1 and "" or "s"),
                    colour = G.C.RED
                }
            }
        end
    end
}