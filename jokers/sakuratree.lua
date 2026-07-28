
SMODS.Joker{ --Sakura Tree
    key = "sakuratree",
    config = {
        extra = {
            sakuratree_xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Sakura Tree',
        ['text'] = {
            [1] = '{C:hearts}Hearts{} scored gain {X:red,C:white}X0.1{} Mult.',
            [2] = 'Resets every Ante.',
            [3] = '(Currently {X:mult,C:white}X#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["foolspri_foolsprivilege_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.sakuratree_xmult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Hearts") then
                card.ability.extra.sakuratree_xmult = (card.ability.extra.sakuratree_xmult) + 0.1
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.sakuratree_xmult
            }
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                func = function()
                    card.ability.extra.sakuratree_xmult = 1
                    return true
                end
            }
        end
    end
}