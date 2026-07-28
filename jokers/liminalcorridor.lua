
SMODS.Joker{ --Liminal Corridor
    key = "liminalcorridor",
    config = {
        extra = {
            pattern_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Liminal Corridor',
        ['text'] = {
            [1] = 'This {C:attention}Joker {}gains {C:red}+7{} Mult',
            [2] = 'if the {C:attention}played hand{}',
            [3] = 'is the same type as',
            [4] = 'the previously {C:attention}played hand{}.',
            [5] = '{C:attention}Resets {}every {C:attention}ante{}.',
            [6] = '(Currently {C:red}+#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["foolspri_fpv_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.pattern_mult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round > 1 then
                card.ability.extra.pattern_mult = (card.ability.extra.pattern_mult) + 2
                return {
                    message = "UPGRADE!"
                }
            else
                return {
                    mult = card.ability.extra.pattern_mult
                }
            end
        end
        if context.ante_change  then
            return {
                func = function()
                    card.ability.extra.pattern_mult = 0
                    return true
                end
            }
        end
    end
}