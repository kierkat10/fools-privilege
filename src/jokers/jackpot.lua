
SMODS.Joker{ --Jackpot
    key = "jackpot",
    config = {
        extra = {
            probability_jackpot = 0
        }
    },
    loc_txt = {
        ['name'] = 'Jackpot',
        ['text'] = {
            [1] = 'Adds {C:attention}+0.01{} to all listed probabilities',
            [2] = 'every time a probability succeeds'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fprvilege_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.probability_jackpot}}
    end,
    
    calculate = function(self, card, context)
        if context.pseudorandom_result  then
            if context.result then
                return {
                    func = function()
                        card.ability.extra.probability_jackpot = (card.ability.extra.probability_jackpot) + 0.01
                        return true
                    end,
                    message = "UPGRADE!"
                }
            end
        end
        if context.mod_probability  then
            local numerator, denominator = context.numerator, context.denominator
            numerator = numerator + (card.ability.extra.probability_jackpot)
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
    end
}