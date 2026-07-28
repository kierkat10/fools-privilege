
SMODS.Joker{ --Shopping Spree
    key = "shoppingspree",
    config = {
        extra = {
            voucher_slots_increase = '1',
            booster_slots_increase = '1'
        }
    },
    loc_txt = {
        ['name'] = 'Shopping Spree',
        ['text'] = {
            [1] = 'Shop have',
            [2] = '{C:attention}+1{} additional Voucher slot',
            [3] = 'and {C:attention}+1{} additional Bufoon pack'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fprvilege_jokers"] = true },
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_voucher_limit(1)
        SMODS.change_booster_limit(1)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_voucher_limit(-1)
        SMODS.change_booster_limit(-1)
    end
}