
SMODS.Joker{ --Oath Of Loyalty
    key = "oathofloyalty",
    config = {
        extra = {
            kingsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Oath Of Loyalty',
        ['text'] = {
            [1] = 'When {C:attention}Blind {}selected, draw',
            [2] = 'an additional amount of {C:attention}cards{}',
            [3] = 'to hand equal to the',
            [4] = 'amount of {C:attention}Kings {}in your',
            [5] = 'full deck'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["foolspri_foolsprivilege_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
    return {vars = {(function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 13 then count = count + 1 end end; return count end)()}}
    end,
    
    calculate = function(self, card, context)
        if context.first_hand_drawn  then
            if G.hand and #G.hand.cards > 0 then
            SMODS.draw_cards((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 13 then count = count + 1 end end; return count end)())
            end
            return {
                message = "+"..tostring((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 13 then count = count + 1 end end; return count end)()).." Cards Drawn"
            }
        end
    end
}