
SMODS.Joker { --He is a 10 but...
    key = "heisa10but",
    config = {
        extra = {
            hiatb_mult = 10
        }
    },
    loc_txt = {
        ['name'] = 'He is a 10 but...',
        ['text'] = {
            [1] = 'Base {C:red}+10{} mult,',
            [2] = '{C:red}-1{} Mult for each',
            [3] = 'card {C:red}discarded{}.',
            [4] = 'Resets every round',
            [5] = '(Currently {C:red}#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fpv_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.hiatb_mult}}
    end,
    
    calculate = function(self, card, context)
        if context.discard  then
            return {
                func = function()
                    card.ability.extra.hiatb_mult = math.max(0, (card.ability.extra.hiatb_mult) - 1)
                    return true
                end,
                message = "DECREASED!"
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.hiatb_mult
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.hiatb_mult = 10
                    return true
                end
            }
        end
    end
}