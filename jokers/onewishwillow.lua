
SMODS.Joker{ --One Wish Willow
    key = "onewishwillow",
    config = {
        extra = {
            oww_chips = 0
        }
    },
    loc_txt = {
        ['name'] = 'One Wish Willow',
        ['text'] = {
            [1] = 'If the {C:attention}hand {}{C:attention}played{}',
            [2] = 'is your {C:attention}most{} {C:attention}played {}this',
            [3] = '{C:attention}Joker {}gains {C:blue}20 {} Chips',
            [4] = '(Currently {C:blue}+#1#{} Chips)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 5
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
        
        return {vars = {card.ability.extra.oww_chips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local current_played = G.GAME.hands[context.scoring_name].played or 0
                for handname, values in pairs(G.GAME.hands) do
                    if handname ~= context.scoring_name and values.played > current_played and values.visible then
                        return false
                    end
                end
                return true
            end)() then
                card.ability.extra.oww_chips = (card.ability.extra.oww_chips) + 20
                return {
                    message = "UPGRADE!",
                    extra = {
                        chips = card.ability.extra.oww_chips,
                        colour = G.C.CHIPS
                    }
                }
            else
                return {
                    chips = card.ability.extra.oww_chips
                }
            end
        end
    end
}