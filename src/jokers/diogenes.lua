
SMODS.Joker { --Diogenes
    key = "diogenes",
    config = {
        extra = {
            discards0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Diogenes',
        ['text'] = {
            [1] = 'When {C:attention}Blind {}is {C:attention}selected{},',
            [2] = 'gain {C:attention}+5{} {C:red}Discards{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fpv_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(5).." Discards", colour = G.C.GREEN})
                    
                    G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + 5
                    return true
                end
            }
        end
    end
}