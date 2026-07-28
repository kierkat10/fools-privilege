
SMODS.Joker{ --Nutella Cookie
    key = "nutellacookie",
    config = {
        extra = {
            dollars = 1,
            dollars_mod = 2,
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'Nutella Cookie',
        ['text'] = {
            [1] = 'Earn {C:money}$#1#{} at end of round',
            [2] = 'Payout increases by {C:money}$#2#{} when',
            [3] = '{C:attention}Big Blind{} or {C:attention}Boss Blind{} is defeated',
            [4] = '{C:green}#3# in #4#{} chance this card is {C:red}destroyed',
            [5] = 'when {C:attention}Boss Blind{} is defeated'
        }
    },
    pos = { x = 1, y = 9 },
    cost = 6,
    rarity = 1,
    blueprint_compat = false,
    atlas = 'CustomJokers',
    pools = { ["foolspri_fpv_jokers"] = true },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "j_foolspri_nutellacookie")
        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.dollars_mod,
                numerator, 
                denominator
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.blueprint and (G.GAME.blind.boss or G.GAME.blind.name == "Big Blind") then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "dollars",
                scalar_value = "dollars_mod",
                message_colour = G.C.MONEY
            })
            if SMODS.pseudorandom_probability(card, "j_foolspri_nutellacookie", 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, { pinch_anim = true})
                return {
                    message = localize("k_eaten_ex")
                }
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end
}