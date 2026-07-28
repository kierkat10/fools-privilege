
SMODS.Joker{ --Christmas Lights
    key = "christmaslights",
    config = {
        extra = {
            odds = 7
        }
    },
    loc_txt = {
        ['name'] = 'Christmas Lights',
        ['text'] = {
            [1] = '{C:attention}Scored {}{C:attention}cards {}have a',
            [2] = '{C:green}#1#{} in {C:green}#2# {}chance to gain a',
            [3] = 'random {C:attention}Seal{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 6
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_foolspri_christmaslights') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_bcb642a3', 1, card.ability.extra.odds, 'j_foolspri_christmaslights', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            local random_seal = SMODS.poll_seal({mod = 10, guaranteed = true})
                            if random_seal then
                                scored_card:set_seal(random_seal, true)
                            end
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            end
        end
    end
}