
SMODS.Joker{ --Blue Flame
    key = "blueflame",
    config = {
        extra = {
            chips_blueflame = 0
        }
    },
    loc_txt = {
        ['name'] = 'Blue Flame',
        ['text'] = {
            [1] = 'This {C:attention}Joker {}gains',
            [2] = '{C:blue}+20{} Chips when a card',
            [3] = 'is {C:red}destroyed{}',
            [4] = '(Currently {C:blue}+#1#{} Chips)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 3
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
    atlas = 'CustomJokers',
    pools = { ["foolspri_foolsprivilege_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chips_blueflame}}
    end,
    
    calculate = function(self, card, context)
        if context.remove_playing_cards  then
            return {
                func = function()
                    card.ability.extra.chips_blueflame = (card.ability.extra.chips_blueflame) + 20
                    return true
                end,
                message = "UPGRADE!"
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chips_blueflame
            }
        end
    end
}