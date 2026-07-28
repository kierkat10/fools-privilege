
SMODS.Joker{ --Family Gathering
    key = "familygathering",
    config = {
        extra = {
            mult_fg = 0,
            chips_fg = 0
        }
    },
    loc_txt = {
        ['name'] = 'Family Gathering',
        ['text'] = {
            [1] = 'This Joker gains {C:red}+4{} Mult and {C:blue}+40{} Chips',
            [2] = 'when a {C:attention}Full House{} is played',
            [3] = '(Currently {C:red}#1#{}, {C:blue}#2#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 3
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
        
        return {vars = {card.ability.extra.mult_fg, card.ability.extra.chips_fg}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chips_fg,
                extra = {
                    mult = card.ability.extra.mult_fg
                }
            }
        end
        if context.before and context.cardarea == G.jokers  then
            if next(context.poker_hands["Full House"]) then
                return {
                    func = function()
                        card.ability.extra.mult_fg = (card.ability.extra.mult_fg) + 2
                        return true
                    end,
                    message = "UPGRADE!",
                    extra = {
                        func = function()
                            card.ability.extra.chips_fg = (card.ability.extra.chips_fg) + 40
                            return true
                        end,
                        message = "UPGRADE!",
                        colour = G.C.GREEN
                    }
                }
            end
        end
    end
}