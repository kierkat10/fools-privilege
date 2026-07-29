
SMODS.Joker { --Scraping tool
    key = "scrapingtool",
    config = {
        extra = {
            dollars0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Scraping tool',
        ['text'] = {
            [1] = 'When {C:red}discarding {}an {C:enhanced}Enhanced{} card,',
            [2] = 'remove the {C:enhanced}Enhancement{}',
            [3] = 'and earn {C:money}$2{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fpv_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.discard  then
            if (function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() then
                return {
                    func = function()
                        context.other_card:set_ability(G.P_CENTERS.c_base)
                    end,
                    message = "Card Modified!",
                    extra = {
                        
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + 2
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2), colour = G.C.MONEY})
                            return true
                        end,
                        colour = G.C.MONEY
                    }
                }
            end
        end
    end
}