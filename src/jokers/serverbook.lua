
SMODS.Joker { --Server Book
    key = "serverbook",
    config = {
        extra = {
            serverbook_var = 2
        }
    },
    loc_txt = {
        ['name'] = 'Server Book',
        ['text'] = {
            [1] = 'When {C:attention}skipping {}a {C:attention}blind {}gain {C:money}+$#1#{}',
            [2] = '{C:attention}Increased {}by {C:money}$2{} for each',
            [3] = 'new skipped {C:attention}Blind {}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 9
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
    pools = { ["fpr_fpv_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.serverbook_var}}
    end,
    
    calculate = function(self, card, context)
        if context.skip_blind  then
            local serverbook_var_value = card.ability.extra.serverbook_var
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + serverbook_var_value
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(serverbook_var_value), colour = G.C.MONEY})
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.serverbook_var = (card.ability.extra.serverbook_var) + 2
                        return true
                    end,
                    colour = G.C.GREEN
                }
            }
        end
    end
}