
SMODS.Joker { --Mult Matt
    key = "multmatt",
    config = {
        extra = {
            xmult0 = 1.75
        }
    },
    loc_txt = {
        ['name'] = 'Mult Matt',
        ['text'] = {
            [1] = '{C:attention}Mult {}cards give {X:red,C:white}X1.75{}',
            [2] = 'Mult when {C:attention}scored{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 8
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
    pools = { ["fpr_fpv_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_mult"] == true then
                return {
                    Xmult = 1.75
                }
            end
        end
    end
}