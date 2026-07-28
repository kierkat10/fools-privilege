
SMODS.Joker{
    key = "approve",
    name = "Approve!",
    config = { extra = { cards = 1 } },
    pos = { x = 0, y = 9 },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    atlas = "joker",
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards } }
    end,
    calculate = function(self, card, context)
        if context.after and G.GAME.current_round.hands_played == 0 and #context.scoring_hand == card.ability.extra.cards then
            for _, scored_card in ipairs(G.play.cards) do
                scored_card:set_seal(SMODS.poll_seal({
                    guaranteed = true,
                    type_key = "fpr_approve"
                }))
            end
            return {
                message = localize("k_fpr_approved")
            }
        end
    end
}