
SMODS.Joker{ --Evil Eye 
    key = "evileye",
    config = {
        extra = {
            evileye_chips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Evil Eye ',
        ['text'] = {
            [1] = 'This {C:attention}Joker {}gains {C:blue}+12{} Chips',
            [2] = 'for each {C:tarot}Tarot{} card used',
            [3] = '(Currenty {C:blue}+#1#{} Chips)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 5
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
    atlas = 'CustomJokers',
    pools = { ["foolspri_foolsprivilege_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.evileye_chips}}
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Tarot' then
                return {
                    func = function()
                        card.ability.extra.evileye_chips = (card.ability.extra.evileye_chips) + 12
                        return true
                    end,
                    message = "UPGRADE!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.evileye_chips
            }
        end
    end
}