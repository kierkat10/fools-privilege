
SMODS.Joker {
    key = "basic_cola",
    name = "Basic Cola",
    pos = { x = 7, y = 0 },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = false,
    atlas = "joker",
    calculate = function(self, card, context)
        if context.selling_self then
            local voucher_key = pseudorandom_element(G.P_CENTER_POOLS.Voucher, "fpr_basic_cola").key
            local voucher_card = SMODS.create_card{area = G.play, key = voucher_key}
            voucher_card:start_materialize()
            voucher_card.cost = 0
            G.play:emplace(voucher_card)
            delay(0.8)
            voucher_card:redeem()
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.5,
                func = function()
                    voucher_card:start_dissolve()                
                    return true
                end
            }))
        end
    end
}