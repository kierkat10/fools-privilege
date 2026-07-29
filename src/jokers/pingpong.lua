
SMODS.Joker { --Ping Pong
    key = "pingpong",
    config = {
        extra = {
            repetitions0 = 1,
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'Ping Pong',
        ['text'] = {
            [1] = '{C:attention}Retrigger {}first and',
            [2] = 'last scored {C:attention}card{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 4
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
    atlas = 'joker',
    pools = { ["fpr_fprvilege_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[1] then
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                }
            elseif context.other_card == context.scoring_hand[#context.scoring_hand] then
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}