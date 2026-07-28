
SMODS.Joker{ --Schrödinger
    key = "schrodinger",
    config = {
        extra = {
            odds = 2,
            xmult0 = 2.5
        }
    },
    loc_txt = {
        ['name'] = 'Schrödinger',
        ['text'] = {
            [1] = 'Played cards have a {C:green}1 in 2{} chance',
            [2] = 'to give {X:red,C:white}X2{} Mult when scored',
            [3] = '{C:inactive}(Unalterable odds){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fpr_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_fpr_schrodinger') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_1c2ae2e5', 1, card.ability.extra.odds, 'j_fpr_schrodinger', true) then
                    SMODS.calculate_effect({Xmult = 2.5}, card)
                end
            end
        end
    end
}