
SMODS.Joker{ --Rainbow End
key = "rainbowend",
config = {
    extra = {
        odds = 10
    }
},
loc_txt = {
    ['name'] = 'Rainbow End',
    ['text'] = {
        [1] = '{C:attention}Scored {}cards have',
        [2] = '{C:green}#1# {}in {C:green}#2#{} chances to',
        [3] = 'become {C:attention}Polychrome{}'
    },
    ['unlock'] = {
        [1] = 'Unlocked by default.'
    }
},
pos = {
    x = 2,
    y = 1
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
atlas = 'joker',
pools = { ["fpr_fpr_jokers"] = true },

loc_vars = function(self, info_queue, card)
    
    local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_fpr_rainbowend') 
    return {vars = {new_numerator, new_denominator}}
end,

calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play  then
        if true then
            if SMODS.pseudorandom_probability(card, 'group_0_cac61065', 1, card.ability.extra.odds, 'j_fpr_rainbowend', false) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_edition("e_polychrome", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                
            end
        end
    end
end
}