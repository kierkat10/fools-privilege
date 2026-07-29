
SMODS.Joker { --Crumbl Cookie
    key = "crumblcookie",
    config = {
        extra = {
            dollars0 = 2,
            dollars = 4
        }
    },
    loc_txt = {
        ['name'] = 'Crumbl Cookie',
        ['text'] = {
            [1] = 'Earn {C:money}$2{} if first',
            [2] = '{C:attention}played {}{C:attention}hand {}is a {C:attention}Three of a Kind{}.',
            [3] = '{C:money}4${} if a {C:attention}Flush {}is played',
            [4] = 'as a first {C:attention}played {}{C:attention}hand{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fprvilege_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if (G.GAME.current_round.hands_played == 0 and context.scoring_name == "Three of a Kind") then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 2
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2), colour = G.C.MONEY})
                        return true
                    end
                }
            elseif (G.GAME.current_round.hands_played == 0 and context.scoring_name == "Flush") then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 4
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(4), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}