
SMODS.Joker{ --Stardust Joker
    key = "stardustjoker",
    config = {
        extra = {
            xmult_sj = 1
        }
    },
    loc_txt = {
        ['name'] = 'Stardust Joker',
        ['text'] = {
            [1] = 'This {C:attention}Joker {}gains {X:red,C:white}X0.05{} Mult',
            [2] = 'per card {C:red}discarded {}',
            [3] = 'in a {C:attention}Boss Blind{}',
            [4] = '(Currently {X:mult,C:white}X#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
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
        
        return {vars = {card.ability.extra.xmult_sj}}
    end,
    
    calculate = function(self, card, context)
        if context.discard  and not context.blueprint then
            if G.GAME.blind.boss then
                return {
                    func = function()
                        card.ability.extra.xmult_sj = (card.ability.extra.xmult_sj) + 0.05
                        return true
                    end,
                    message = "UPGRADE!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.xmult_sj
            }
        end
    end
}