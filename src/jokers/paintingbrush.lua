
SMODS.Joker { --Painting Brush
    key = "paintingbrush",
    config = {
        extra = {
            pb_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Painting Brush',
        ['text'] = {
            [1] = 'This {C:attention}Joker {}gains {C:red}+5{} Mult',
            [2] = 'if the played hand',
            [3] = 'contains a {C:attention}Flush{}',
            [4] = '(Currently {C:red}+#1#{} mult)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fprvilege_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.pb_mult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Flush"]) then
                card.ability.extra.pb_mult = (card.ability.extra.pb_mult) + 5
                return {
                    message = "UPGRADE!"
                }
            else
                return {
                    mult = card.ability.extra.pb_mult
                }
            end
        end
    end
}