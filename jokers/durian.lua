
SMODS.Joker{ --Durian
    key = "durian",
    config = {
        extra = {
            durian_cards_destroyed = 10
        }
    },
    loc_txt = {
        ['name'] = 'Durian',
        ['text'] = {
            [1] = 'The next {C:attention}10 {}scored',
            [2] = 'cards get {C:red}destroyed{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["foolspri_foolsprivilege_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.durian_cards_destroyed}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if to_big(card.ability.extra.durian_cards_destroyed) > to_big(0) then
                context.other_card.should_destroy = true
                card.ability.extra.durian_cards_destroyed = math.max(0, (card.ability.extra.durian_cards_destroyed) - 1)
                return {
                    message = "Destroyed!"
                }
            elseif to_big(card.ability.extra.durian_cards_destroyed) == to_big(0) then
                local target_joker = card
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Stinky!", colour = G.C.RED})
                end
            end
        end
    end
}