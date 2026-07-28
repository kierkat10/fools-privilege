
SMODS.Joker{ --Raffle
    key = "raffle",
    config = { extra = { levels = 2 } },
    loc_txt = {
        ['name'] = 'Raffle',
        ['text'] = {
            'When {C:attention}Boss Blind{} is',
            'defeated, level up most',
            'played {C:attention}poker hand{} by {C:attention}2'
        },
    },
    pos = { x = 4, y = 7 },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    atlas = 'joker',
    pools = { ["fpr_fpv_jokers"] = true },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.levels } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            local most_played = 0
            local most_played_hand = "High Card"
            for hand, data in pairs(G.GAME.hands) do
                if data.played > most_played then
                    most_played = data.played
                    most_played_hand = hand
                end
            end
            SMODS.upgrade_poker_hands({
                hands = most_played_hand,
                level_up = card.ability.extra.levels,
                from = card
            })
        end
    end
}