
SMODS.Joker{ --Bungee Jumping
    key = "bungeejumping",
    config = {
        extra = {
            bungee_xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Bungee Jumping',
        ['text'] = {
            [1] = 'When a {C:attention}Straigth {}is played,',
            [2] = 'this {C:attention}Joker {}gains {X:red,C:white}X0.2{} Mult',
            [3] = '(Currently {X:mult,C:white}X#1#{} Mult)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 8
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
    pools = { ["fpr_fpv_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.bungee_xmult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Straight" then
                card.ability.extra.bungee_xmult = (card.ability.extra.bungee_xmult) + 0.2
            else
                return {
                    Xmult = card.ability.extra.bungee_xmult
                }
            end
        end
    end
}