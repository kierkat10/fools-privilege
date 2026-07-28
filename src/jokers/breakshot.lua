
SMODS.Joker{ --Break Shot
    key = "breakshot",
    config = {
        extra = {
            xmult_bs = 0
        }
    },
    loc_txt = {
        ['name'] = 'Break Shot',
        ['text'] = {
            [1] = 'This {C:attention}Joker {}gains {X:red,C:white}X1.2{} Mult',
            [2] = 'if the {C:attention}first hand{} of round',
            [3] = 'contains a {C:attention}scoring {}hand with',
            [4] = 'no {C:attention}Face {}cards, resets when',
            [5] = '{C:attention}Boss Blind{} is {C:red}defeated{}',
            [6] = '(Currently {X:mult,C:white}X#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 4
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
        
        return {vars = {card.ability.extra.xmult_bs}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (G.GAME.current_round.hands_played == 0 and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_face() then
                        count = count + 1
                    end
                end
                return count == 0
            end)()) then
                card.ability.extra.xmult_bs = (card.ability.extra.xmult_bs) + 1.2
                return {
                    message = "UPGRADE!"
                }
            else
                return {
                    Xmult = card.ability.extra.xmult_bs
                }
            end
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                func = function()
                    card.ability.extra.xmult_bs = 0
                    return true
                end,
                message = "RESTART!"
            }
        end
    end
}