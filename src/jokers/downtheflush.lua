
SMODS.Joker { --Down the flush
    key = "downtheflush",
    config = {
        extra = {
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Down the flush',
        ['text'] = {
            [1] = '{C:green}#1# {}in {C:green}#2# {}chance to create a random',
            [2] = '{C:attention}Tag{} when a Flush is played'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fpr_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_fpr_downtheflush') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if next(context.poker_hands["Flush"]) then
                if SMODS.pseudorandom_probability(card, 'group_0_b3d07ac6', 1, card.ability.extra.odds, 'j_fpr_downtheflush', false) then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local selected_tag = pseudorandom_element(G.P_TAGS, pseudoseed("create_tag")).key
                            local tag = Tag(selected_tag)
                            if tag.name == "Orbital Tag" then
                                local _poker_hands = {}
                                for k, v in pairs(G.GAME.hands) do
                                    if v.visible then
                                        _poker_hands[#_poker_hands + 1] = k
                                    end
                                end
                                tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                            end
                            tag:set_ability()
                            add_tag(tag)
                            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Created Tag!", colour = G.C.GREEN})
                end
            end
        end
    end
}