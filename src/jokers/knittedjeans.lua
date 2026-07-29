
SMODS.Joker { --Knitted Jeans
    key = "knittedjeans",
    config = {
        extra = {
            knittedjeans_xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Knitted Jeans',
        ['text'] = {
            [1] = 'If the {C:attention}first played hand{}',
            [2] = 'contains exactly {C:attention}1{} card',
            [3] = 'this {C:attention}Joker {}gains {X:mult,C:white}X0.2{} Mult.',
            [4] = 'Resets  if {C:attention}played hand{} contains',
            [5] = 'a {C:attention}Pair {}or {C:attention}Double pair{}',
            [6] = '(Curently {X:mult,C:white}X#1# {}Mult)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'joker',
    pools = { ["fpr_fpv_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.knittedjeans_xmult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (G.GAME.current_round.hands_played == 0 and to_big(#context.scoring_hand) == to_big(1)) then
                card.ability.extra.knittedjeans_xmult = (card.ability.extra.knittedjeans_xmult) + 0.2
            elseif (next(context.poker_hands["Pair"]) or next(context.poker_hands["Two Pair"])) then
                card.ability.extra.knittedjeans_xmult = 1
            else
                return {
                    Xmult = card.ability.extra.knittedjeans_xmult
                }
            end
        end
    end
}