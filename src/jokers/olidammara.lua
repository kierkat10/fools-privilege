
SMODS.Joker { --Olidammara
    key = "olidammara",
    config = {
        extra = {
            hands0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Olidammara',
        ['text'] = {
            [1] = 'When {C:attention}Blind{} selected',
            [2] = 'gain {C:attention}+5{} {C:blue}Hands {}for the round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 3
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
    unlocked = false,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fprvilege_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(5).." Hands", colour = G.C.GREEN})
                    
                    G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 5
                    return true
                end
            }
        end
    end
}