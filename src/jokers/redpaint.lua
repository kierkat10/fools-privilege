
SMODS.Joker{ --Red Paint
    key = "redpaint",
    config = {
        extra = {
            redpaint_var = 0
        }
    },
    loc_txt = {
        ['name'] = 'Red Paint',
        ['text'] = {
            [1] = 'This {C:attention}Joker {}gains {C:red}+6{} Mult',
            [2] = 'for each Mult card scored',
            [3] = '(Currently {C:red}#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 6
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
    atlas = 'joker',
    pools = { ["fpr_fprvilege_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.redpaint_var}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_mult"] == true then
                card.ability.extra.redpaint_var = (card.ability.extra.redpaint_var) + 6
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.redpaint_var
            }
        end
    end
}