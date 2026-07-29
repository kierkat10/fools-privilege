
SMODS.Joker { --Lottery Winner
    key = "lotterywinner",
    config = {
        extra = {
            odds = 4,
            odds2 = 7,
            repetitions0 = 1,
            xmult0 = 2.5
        }
    },
    loc_txt = {
        ['name'] = 'Lottery Winner',
        ['text'] = {
            [1] = '{C:attention}Lucky{} cards have {C:green}#1#{} in {C:green}#2# {}',
            [2] = 'chance to retrigger',
            [3] = 'and a {C:green}#3# {}in {C:green}#4#{} chance',
            [4] = 'to apply {X:red,C:white}X2.5{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fprvilege_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_lucky"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_lucky\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_fpr_lotterywinner')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_fpr_lotterywinner')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_lucky"] == true then
                if SMODS.pseudorandom_probability(card, 'group_0_6f215288', 1, card.ability.extra.odds, 'j_fpr_lotterywinner', false) then
                    
                    return {repetitions = 1}
                end
                if SMODS.pseudorandom_probability(card, 'group_1_aee58414', 1, card.ability.extra.odds2, 'j_fpr_lotterywinner', false) then
                    SMODS.calculate_effect({Xmult = 2.5}, card)
                end
            end
        end
    end
}