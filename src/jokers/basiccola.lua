
SMODS.Joker { --Basic Cola
    key = "basiccola",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Basic Cola',
        ['text'] = {
            [1] = 'When {C:green}sold {}redeem',
            [2] = 'a random {C:attention}Voucher{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fprvilege_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.selling_self  then
            local voucher_key = pseudorandom_element(G.P_CENTER_POOLS.Voucher, "c031ed3c").key
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
                message = nil
            }
        end
    end
}