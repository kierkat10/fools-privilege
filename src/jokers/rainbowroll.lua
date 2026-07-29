
SMODS.Joker { --Rainbow Roll
    key = "rainbowroll",
    config = {
        extra = {
            rainbowroll_var = 5
        }
    },
    loc_txt = {
        ['name'] = 'Rainbow Roll',
        ['text'] = {
            [1] = '{C:attention}Apply {}polychrome',
            [2] = 'to the next {C:attention}5{} scored cards'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fpv_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.rainbowroll_var}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if to_big((card.ability.extra.rainbowroll_var or 0)) > to_big(0) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_edition("e_polychrome", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                card.ability.extra.rainbowroll_var = math.max(0, (card.ability.extra.rainbowroll_var) - 1)
            elseif to_big((card.ability.extra.rainbowroll_var or 0)) == to_big(0) then
                local target_joker = card
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Eaten!", colour = G.C.RED})
                end
            end
        end
    end
}