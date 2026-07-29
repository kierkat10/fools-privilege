
SMODS.Joker { --L
    key = "l",
    config = {
        extra = {
            L_xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'L',
        ['text'] = {
            [1] = 'This Joker gains',
            [2] = '{X:red,C:white}X0.25{} Mult for each',
            [3] = 'scored card, resets at',
            [4] = 'the end of the round',
            [5] = '(Currently {X:mult,C:white}X#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fprvilege_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'sho' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.L_xmult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            card.ability.extra.L_xmult = (card.ability.extra.L_xmult) + 0.2
            return {
                message = "UPGRADE!"
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.L_xmult
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.L_xmult = 0
                    return true
                end,
                message = "CASE ENDED"
            }
        end
    end
}