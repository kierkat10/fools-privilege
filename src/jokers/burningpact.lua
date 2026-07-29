
SMODS.Joker { --Burning Pact 
    key = "burningpact",
    config = {
        extra = {
            currentmoney = 0,
            thisjokersellvalue = 0
        }
    },
    loc_txt = {
        ['name'] = 'Burning Pact ',
        ['text'] = {
            [1] = 'When sold, sets {C:money}money{}',
            [2] = '{C:red}negative{} and redeems {C:attention}2{}',
            [3] = 'random {C:attention}Vouchers',
            [4] = '{} (EX: {C:money}$13{} {C:blue}->{} {C:red}-$13{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fprvilege_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
    return {vars = {((G.GAME.dollars or 0)) * 2, (function() for _, joker in ipairs(G.jokers and (G.jokers and G.jokers.cards or {}) or {}) do if joker == card then return joker.sell_cost end end end)()}}
    end,
    
    calculate = function(self, card, context)
        if context.selling_self  then
            local voucher_key = pseudorandom_element(G.P_CENTER_POOLS.Voucher, "0a549607").key
            local voucher_card = SMODS.create_card{area = G.play, key = voucher_key}
            voucher_card:start_materialize()
            voucher_card.cost = 0
            G.play:emplace(voucher_card)
            delay(0.8)
            voucher_card:redeem()
            
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.5,
                func = function()
                    voucher_card:start_dissolve()                
                    return true
                end
            }))
            local voucher_key = pseudorandom_element(G.P_CENTER_POOLS.Voucher, "684ae302").key
            local voucher_card = SMODS.create_card{area = G.play, key = voucher_key}
            voucher_card:start_materialize()
            voucher_card.cost = 0
            G.play:emplace(voucher_card)
            delay(0.8)
            voucher_card:redeem()
            
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.5,
                func = function()
                    voucher_card:start_dissolve()                
                    return true
                end
            }))
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars - (G.GAME.dollars) * 2
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring((G.GAME.dollars) * 2), colour = G.C.MONEY})
                    return true
                end,
                extra = {
                    message = nil,
                    colour = G.C.RED,
                    extra = {
                        message = nil,
                        colour = G.C.RED,
                        extra = {
                            
                            func = function()
                                
                                local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars - (function() for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do if joker == card then return joker.sell_cost end end end)()
                                local dollar_value = target_dollars - current_dollars
                                ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring((function() for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do if joker == card then return joker.sell_cost end end end)()), colour = G.C.MONEY})
                                return true
                            end,
                            colour = G.C.MONEY
                        }
                    }
                }
            }
        end
    end
}