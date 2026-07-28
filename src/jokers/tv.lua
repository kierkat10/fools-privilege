
SMODS.Joker{ --TV
    key = "tv",
    config = {
        extra = {
            xmult0 = 1.25,
            blind_size0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'TV',
        ['text'] = {
            [1] = '{C:attention}Played {}cards give',
            [2] = '{X:red,C:white}X1.25{} Mult when scored,',
            [3] = '{C:attention}X1.5{} base {C:attention}Blind {}size'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 8
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
    pools = { ["fpr_fpv_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                Xmult = 1.25
            }
        end
        if context.setting_blind  then
            return {
                
                func = function()
                    if G.GAME.blind.in_blind then
                        
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(1.5).." Blind Size", colour = G.C.GREEN})
                        G.GAME.blind.chips = G.GAME.blind.chips * 1.5
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        G.HUD_blind:recalculate()
                        return true
                    end
                end
            }
        end
    end
}