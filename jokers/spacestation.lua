
SMODS.Joker{ --Space Station
    key = "spacestation",
    config = {
        extra = {
            spacestation_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Space Station',
        ['text'] = {
            [1] = 'When a {C:planet}Planet{} card is used,',
            [2] = 'this Joker gains {C:red}+2{} Mult',
            [3] = '(Currently {C:red}#1#{} Mult)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["foolspri_foolsprivilege_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.spacestation_mult}}
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  and not context.blueprint then
            if context.consumeable and context.consumeable.ability.set == 'Planet' then
                return {
                    func = function()
                        card.ability.extra.spacestation_mult = (card.ability.extra.spacestation_mult) + 2
                        return true
                    end,
                    message = "UPGRADE!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.spacestation_mult
            }
        end
    end
}