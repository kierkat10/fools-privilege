
SMODS.Joker{ --Hattrick
    key = "hattrick",
    config = {
        extra = {
            hattrick_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Hattrick',
        ['text'] = {
            [1] = 'This {C:attention}Joker {}gains {C:red}+3{} Mult',
            [2] = 'for each {C:attention}3{} scored in',
            [3] = 'a {C:attention}Three of a Kind{} scored',
            [4] = '(Currently {C:red}+#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 7
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
        
        return {vars = {card.ability.extra.hattrick_mult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 3 and context.scoring_name == "Three of a Kind") then
                card.ability.extra.hattrick_mult = (card.ability.extra.hattrick_mult) + 3
                return {
                    message = "UPGRADE!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.hattrick_mult
            }
        end
    end
}