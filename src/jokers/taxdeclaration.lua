
SMODS.Joker { --Tax Declaration
    key = "taxdeclaration",
    config = {
        extra = {
            dollars0_min = NaN,
            dollars0_max = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Tax Declaration',
        ['text'] = {
            [1] = 'At end of {C:attention}round{}',
            [2] = 'gives anywhere from',
            [3] = '{X:money,C:white}X0.95{} to {X:money,C:white}X1.5{} {C:money}Dollars{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fprvilege_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars * pseudorandom('RANGE:0.95|1.5', 0.95, 1.5)
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(pseudorandom('RANGE:0.95|1.5', 0.95, 1.5)), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}