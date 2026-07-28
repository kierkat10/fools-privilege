
SMODS.Joker{ --Draw 4
    key = "draw4",
    config = {
        extra = {
            hands0 = 2,
            card_draw0 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Draw 4',
        ['text'] = {
            [1] = 'At the {C:attention}start {}of the round',
            [2] = 'draw {C:attention}4 {}additional cards {C:red}',
            [3] = '-1{} {C:attention}hand{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fprvilege_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.first_hand_drawn  and not context.blueprint then
            if G.hand and #G.hand.cards > 0 then
                SMODS.draw_cards(4)
            end
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(2).." Hands", colour = G.C.RED})
                    G.GAME.current_round.hands_left = G.GAME.current_round.hands_left - 2
                    return true
                end,
                extra = {
                    message = "+"..tostring(4).." Cards Drawn",
                    colour = G.C.BLUE
                }
            }
        end
    end
}