
SMODS.Joker { --Dr. Spectred
    key = "drspectred",
    config = {
        extra = {
            xmult0 = 1.5,
            xmult = 2,
            xmult2 = 3,
            xmult3 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Dr. Spectred',
        ['text'] = {
            [1] = '{C:common}Common{} Jokers each give {X:red,C:white}X1.5{} Mult',
            [2] = '{C:uncommon}Uncommon {}Jokers each give {X:red,C:white}X2{} Mult',
            [3] = '{C:rare}Rare {}Jokers each give {X:mult,C:white}X3{} Mult',
            [4] = '{C:legendary}Legendary{} Jokers each give {X:mult,C:white}X5 {}Mult',
            [5] = ''
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 5
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
    
    calculate = function(self, card, context)
        if context.other_joker  then
            if (function()
                return context.other_joker.config.center.rarity == 1
            end)() then
                return {
                    Xmult = 1.5
                }
            elseif (function()
                return context.other_joker.config.center.rarity == 2
            end)() then
                return {
                    Xmult = 2
                }
            elseif (function()
                return context.other_joker.config.center.rarity == 3
            end)() then
                return {
                    Xmult = 3
                }
            elseif (function()
                return context.other_joker.config.center.rarity == 4
            end)() then
                return {
                    Xmult = 5
                }
            end
        end
    end
}