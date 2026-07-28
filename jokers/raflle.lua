
SMODS.Joker{ --Raflle
    key = "raflle",
    config = {
        extra = {
            levels0 = 1,
            levels = 1
        }
    },
    loc_txt = {
        ['name'] = 'Raflle',
        ['text'] = {
            [1] = 'When {C:attention}Boss blind{}',
            [2] = 'is {C:red}defeated{}, level up {C:attention} {}',
            [3] = 'your most played',
            [4] = '{C:attention}Poker Hand{} by {C:attention}2{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["foolspri_fpv_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            local available_hands = {}
            for hand, value in pairs(G.GAME.hands) do
                if value.visible and value.level >= to_big(1) then
                    table.insert(available_hands, hand)
                end
            end
            local target_hand = #available_hands > 0 and pseudorandom_element(available_hands, pseudoseed('level_up_hand')) or "High Card"
            level_up_hand(card, target_hand, true, 1)
            local available_hands = {}
            for hand, value in pairs(G.GAME.hands) do
                if value.visible and value.level >= to_big(1) then
                    table.insert(available_hands, hand)
                end
            end
            local target_hand2 = #available_hands > 0 and pseudorandom_element(available_hands, pseudoseed('level_up_hand')) or "High Card"
            level_up_hand(card, target_hand2, true, 1)
            return {
                message = localize('k_level_up_ex'),
                extra = {
                    message = localize('k_level_up_ex'),
                    colour = G.C.RED
                }
            }
        end
    end
}