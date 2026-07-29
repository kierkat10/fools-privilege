
SMODS.Joker { --Notebook
    key = "notebook",
    config = {
        extra = {
            notebook_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Notebook',
        ['text'] = {
            [1] = 'This {C:attention}Joker {}gains {C:red}+1{} Mult if',
            [2] = 'played{C:attention} Poker Hand{} has',
            [3] = 'not already been played this {C:attention}Round{}',
            [4] = '(Currently {C:red}#1#{} mult)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
        
        return {vars = {card.ability.extra.notebook_mult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if not (G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round > 1) then
                card.ability.extra.notebook_mult = (card.ability.extra.notebook_mult) + 1
                return {
                    message = "UPGRADE!"
                }
            else
                return {
                    mult = card.ability.extra.notebook_mult
                }
            end
        end
    end
}