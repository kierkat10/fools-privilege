
SMODS.Joker{ --Sushi Serving
    key = "sushiserving",
    config = {
        extra = {
            xchips_sushiserving = 2.5
        }
    },
    loc_txt = {
        ['name'] = 'Sushi Serving',
        ['text'] = {
            [1] = '{X:chips,C:white}X2.5{} Chips, loses {X:chips,C:white}X0.25{} Chips',
            [2] = 'at end of round.',
            [3] = '(Currently {X:chips,C:white}X#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 0
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
    pools = { ["foolspri_foolspri_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xchips_sushiserving}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.xchips_sushiserving = math.max(0, (card.ability.extra.xchips_sushiserving) - 0.25)
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.xchips_sushiserving
            }
        end
    end
}