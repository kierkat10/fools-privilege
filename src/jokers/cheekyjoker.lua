
SMODS.Joker{ --Cheeky Joker
    key = "cheekyjoker",
    config = {
        extra = {
            dollars0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Cheeky Joker',
        ['text'] = {
            [1] = '{C:attention}Earn {}{C:money}$1{} if played hand',
            [2] = 'contains a {C:attention}Pair{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
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
    atlas = 'joker',
    pools = { ["fpr_fpr_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Pair"]) then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 1
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}