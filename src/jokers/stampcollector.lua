
SMODS.Joker{ --Stamp Collector
    key = "stampcollector",
    config = {
        extra = {
            stampcollect_xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Stamp Collector',
        ['text'] = {
            [1] = 'When a card with a {C:attention}Seal{}',
            [2] = 'is scored, {C:red}removes{} the Seal and',
            [3] = 'this {C:attention}Joker{} gains {X:mult,C:white}X0.25{} Mult',
            [4] = '(Currently {X:mult,C:white}X#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 7
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
    pools = { ["fpr_fpv_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.stampcollect_xmult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if context.other_card.seal ~= nil then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_seal(nil)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                card.ability.extra.stampcollect_xmult = (card.ability.extra.stampcollect_xmult) + 0.25
                return {
                    message = "UPGRADE!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.stampcollect_xmult
            }
        end
    end
}