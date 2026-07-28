
SMODS.Joker{ --Croupier
    key = "croupier",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Croupier',
        ['text'] = {
            [1] = '{C:attention}Swap{} {C:blue}Chips{} with {C:red}Mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 1
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
    pools = { ["fpr_fpr_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            return {
                swap = true
            }
        end
    end
}