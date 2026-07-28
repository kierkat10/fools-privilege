
SMODS.Joker{ --Right Angle
    key = "rightangle",
    config = {
        extra = {
            rigthangle_chips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Right Angle',
        ['text'] = {
            [1] = 'If played hand contains',
            [2] = 'a {C:attention}Three of a Kind{},',
            [3] = 'this {C:attention}Joker {}gains {C:blue}+20{} Chips.',
            [4] = '{C:red}-5{} Chips every hand scored',
            [5] = 'without a {C:attention}Three of a Kind{}',
            [6] = '(Currently {C:blue}+#1#{} Chips)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["foolspri_fpv_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.rigthangle_chips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Three of a Kind"]) then
                card.ability.extra.rigthangle_chips = (card.ability.extra.rigthangle_chips) + 20
                return {
                    message = "UPGRADE!"
                }
            elseif not (next(context.poker_hands["Three of a Kind"])) then
                card.ability.extra.rigthangle_chips = math.max(0, (card.ability.extra.rigthangle_chips) - 5)
            else
                return {
                    chips = card.ability.extra.rigthangle_chips
                }
            end
        end
    end
}