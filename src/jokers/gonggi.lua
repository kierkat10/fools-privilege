
SMODS.Joker{ --Gonggi
    key = "gonggi",
    config = {
        extra = {
            money_gonggi = 1
        }
    },
    loc_txt = {
        ['name'] = 'Gonggi',
        ['text'] = {
            [1] = 'Earn {C:money}$#1#{} at end of round',
            [2] = 'Payout increases by {C:money}$1{} for',
            [3] = 'every Flush played'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fprvilege_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.money_gonggi}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Flush" then
                card.ability.extra.money_gonggi = (card.ability.extra.money_gonggi) + 1
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + card.ability.extra.money_gonggi
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.money_gonggi), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}