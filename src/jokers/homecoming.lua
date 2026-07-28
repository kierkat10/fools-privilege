
SMODS.Joker{ --Homecoming
    key = "homecoming",
    config = {
        extra = {
            xmult_hc = 1
        }
    },
    loc_txt = {
        ['name'] = 'Homecoming',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X0.2{} Mult',
            [2] = 'when a {C:attention}Full House{} is played',
            [3] = '(Currently {X:mult,C:white}X#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 3
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xmult_hc}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Full House" then
                card.ability.extra.xmult_hc = (card.ability.extra.xmult_hc) + 0.2
                return {
                    message = "UPGRADE!"
                }
            else
                return {
                    Xmult = card.ability.extra.xmult_hc
                }
            end
        end
    end
}