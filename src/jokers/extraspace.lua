
SMODS.Joker{ --Extra Space
    key = "extraspace",
    config = {
        extra = {
            shop_slots_increase = '1'
        }
    },
    loc_txt = {
        ['name'] = 'Extra Space',
        ['text'] = {
            [1] = 'Shop has {C:attention}1 {}',
            [2] = '{C:attention}additional {}card slot'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fpv_jokers"] = true },
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        change_shop_size(1)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        change_shop_size(-1)
    end
}