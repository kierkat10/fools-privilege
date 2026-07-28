
SMODS.Joker{ --Solar System
    key = "solarsystem",
    config = {
        extra = {
            solarsystem_var = 0,
            levels0 = 1,
            levels = 1,
            levels2 = 1,
            levels3 = 1,
            levels4 = 1,
            levels5 = 1,
            levels6 = 1,
            levels7 = 1,
            levels8 = 1,
            levels9 = 1,
            levels10 = 1,
            levels11 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Solar System',
        ['text'] = {
            [1] = '{C:attention}Upgrade {}every {C:attention}poker hand{} by {C:attention}1',
            [2] = '{}level every {C:attention}9{} [{C:inactive}#1#{}] {C:planet}Planet{} cards used'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 8
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
        
        return {vars = {card.ability.extra.solarsystem_var}}
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Planet' then
                return {
                    func = function()
                        card.ability.extra.solarsystem_var = (card.ability.extra.solarsystem_var) + 1
                        return true
                    end,
                    message = "Upgrade!"
                }
            elseif to_big(card.ability.extra.solarsystem_var) == to_big(9) then
                local target_hand = "High Card"
                level_up_hand(card, target_hand, true, 1)
                local target_hand2 = "Pair"
                level_up_hand(card, target_hand2, true, 1)
                local target_hand3 = "Two Pair"
                level_up_hand(card, target_hand3, true, 1)
                local target_hand4 = "Three of a Kind"
                level_up_hand(card, target_hand4, true, 1)
                local target_hand5 = "Straight"
                level_up_hand(card, target_hand5, true, 1)
                local target_hand6 = "Flush"
                level_up_hand(card, target_hand6, true, 1)
                local target_hand7 = "Full House"
                level_up_hand(card, target_hand7, true, 1)
                local target_hand8 = "Four of a Kind"
                level_up_hand(card, target_hand8, true, 1)
                local target_hand9 = "Five of a Kind"
                level_up_hand(card, target_hand9, true, 1)
                local target_hand10 = "Straight Flush"
                level_up_hand(card, target_hand10, true, 1)
                local target_hand11 = "Flush House"
                level_up_hand(card, target_hand11, true, 1)
                local target_hand12 = "Flush Five"
                level_up_hand(card, target_hand12, true, 1)
                return {
                    message = "Upgrade!",
                    extra = {
                        message = "Upgrade!",
                        colour = G.C.RED,
                        extra = {
                            message = "Upgrade!",
                            colour = G.C.RED,
                            extra = {
                                message = "Upgrade!",
                                colour = G.C.RED,
                                extra = {
                                    message = "Upgrade!",
                                    colour = G.C.RED,
                                    extra = {
                                        message = "Upgrade!",
                                        colour = G.C.RED,
                                        extra = {
                                            message = "Upgrade!",
                                            colour = G.C.RED,
                                            extra = {
                                                message = "Upgrade!",
                                                colour = G.C.RED,
                                                extra = {
                                                    message = "Upgrade!",
                                                    colour = G.C.RED,
                                                    extra = {
                                                        message = "Upgrade!",
                                                        colour = G.C.RED,
                                                        extra = {
                                                            message = "Upgrade!",
                                                            colour = G.C.RED,
                                                            extra = {
                                                                message = "Upgrade!",
                                                                colour = G.C.RED,
                                                                extra = {
                                                                    func = function()
                                                                        card.ability.extra.solarsystem_var = 0
                                                                        return true
                                                                    end,
                                                                    colour = G.C.BLUE
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            end
        end
    end
}