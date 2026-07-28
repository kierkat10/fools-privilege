
SMODS.Joker{ --Chocolate Gold Bar
    key = "chocolategoldbar",
    config = {
        extra = {
            cgb_money = 10
        }
    },
    loc_txt = {
        ['name'] = 'Chocolate Gold Bar',
        ['text'] = {
            [1] = '{C:attention}Earn {}{C:money}$#1#{} for',
            [2] = 'each cleared {C:attention}Blind{}.',
            [3] = '{C:money}-$2{} for each',
            [4] = '{C:attention}Boss blind {}{C:red}defeated{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["foolspri_fpv_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.cgb_money}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + card.ability.extra.cgb_money
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.cgb_money), colour = G.C.MONEY})
                    return true
                end
            }
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.cgb_money = math.max(0, (card.ability.extra.cgb_money) - 2)
                    return true
                end
            }
        end
    end
}