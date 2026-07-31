return {
    descriptions = {
        Joker = {
            j_fpr_cheeky = {
                name = "Cheeky Joker",
                text = {
                    "Earn {C:money}$#1#{} if played hand",
                    "contains a {C:attention}Pair"
                }
            },
            j_fpr_arrogant = {
                name = "Arrogant Joker",
                text = {
                    "Earn {C:money}$#1#{} if played hand",
                    "contains a {C:attention}Three of a Kind"
                }
            },
            j_fpr_imprudent = {
                name = "Imprudent Joker",
                text = {
                    "Earn {C:money}$#1#{} if played hand",
                    "contains a {C:attention}Two Pair"
                }
            },
            j_fpr_daring = {
                name = "Daring Joker",
                text = {
                    "Earn {C:money}$#1#{} if played hand",
                    "contains a {C:attention}Straight"
                }
            },
            j_fpr_insolent = {
                name = "Insolent Joker",
                text = {
                    "Earn {C:money}$#1#{} if played hand",
                    "contains a {C:attention}Flush"
                }
            },
            j_fpr_sushi_serving = {
                name = "Sushi Serving",
                text = {
                    "{C:white,X:chips}X#1#{} Chips,",
                    "loses {X:chips,C:white}X#2#{} Chips at",
                    "end of round"
                }
            },
            j_fpr_dalgona = {
                name = "Dalgona Cookie",
                text = {
                    "{C:blue}+#1#{} hand#<s>1# and {C:red}+#2#{} discard#<s>2# if",
                    "{C:attention}Blind{} is not won by {C:attention}final{} hand,",
                    "{C:red,E:2}self destructs"
                }
            },
            j_fpr_basic_cola = {
                name = "Basic Cola",
                text = {
                    "Sell this card",
                    "to redeem a",
                    "random {C:attention}Voucher"
                }
            },
            j_fpr_sugar_free_cola = {
                name = "Sugar-Free Cola",
                text = {
                    "Sell this card",
                    "to create {C:attention}#1#",
                    "random free {C:attention}Tags"
                }
            },
            j_fpr_grape_cola = {
                name = "Grape Cola",
                text = {
                    "Sell this card to",
                    "create a free",
                    "{C:attention}Negative Tag"
                }
            },
            j_fpr_blue_cola = {
                name = "Blue Cola",
                text = {
                    "Sell this card to",
                    "create {C:attention}#1#{} random",
                    "{C:spectral}Spectral{} cards",
                    "{C:inactive}(Must have room)"
                }
            },
            j_fpr_blue_moon = {
                name = "Blue Moon",
                text = {
                    "When a non-{C:dark_edition}Negative",
                    "{C:planet}Planet{} card is used,",
                    "create a random",
                    "{C:dark_edition}Negative{} {C:planet}Planet{} card"
                }
            },
            j_fpr_rainbow_end = {
                name = "Rainbow End",
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "apply {C:dark_edition}Polychrome{} to",
                    "all scoring cards"
                }
            },
            j_fpr_schrodinger = {
                name = "Schrödinger",
                text = {
                    "Played cards have a",
                    "{C:red,E:2}fixed {C:green}#1# in #2#{} chance to",
                    "give {C:white,X:mult}X#3#{} Mult when scored",
                }
            },
            j_fpr_mirror = {
                name = "Blank Mirror",
                text = {
                    "Create either {C:attention}Vampire{} or",
                    "{C:attention}Invisible Joker{} at random",
                    "if played hand contains",
                    "a scoring {C:attention}Glass Card{},",
                    "{C:red,E:2}self destructs"
                }
            },
            j_fpr_spin_wheel = {
                name = "Spin the Wheel",
                text = {
                    "When {C:attention}Blind{} is",
                    "selected, create",
                    "a random {C:attention}Tag",
                    "but lose {C:money}$#1#"
                }
            },
            j_fpr_croupier = {
                name = "Croupier",
                text = {
                    "Swap {C:blue}Chips{}",
                    "and {C:red}Mult"
                }
            },
            j_fpr_draw = {
                name = "Draw 4",
                text = {
                    "Draw {C:attention}#1#{} additional card#<s>1#",
                    "when {C:attention}Blind{} is selected,",
                    "{C:blue}-#2#{} hand#<s>2# each round"
                }
            },
            j_fpr_rightangle = {
                name = "Right Angle",
                text = {
                    "This Joker gains {C:blue}+#1#{} Chip#<s>1#",
                    "if played hand contains",
                    "a {C:attention}Three of a Kind{}, but",
                    "loses {C:blue}-#2#{} Chip#<s>2# otherwise",
                    "{C:inactive}(Currently {C:blue}+#3#{C:inactive} Chips)"
                }
            },
            j_fpr_regular = {
                name = "Regular Joker",
                text = {
                    "{C:chips}+#1#{} Chips"
                }
            },
            j_fpr_stardust = {
                name = "Stardust Joker",
                text = {
                    "This Joker gains {C:white,X:mult}X#1#{} Mult",
                    "per {C:attention}card{} discarded",
                    "in a {C:attention}Boss Blind",
                    "{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)"
                }
            },
            j_fpr_burger = {
                name = "Smash Burger",
                text = {
                    {
                        "{X:red,C:white}X#1#{} Mult and lose {C:money}#2#$",
                        "when hand played"
                    },
                    {
                        "Decrease {C:white,X:mult}XMult{} by {X:mult,C:white}X#3#{} and",
                        "money lost by {C:money}$#4#",
                        "at end of round"
                    }
                }
            },
            j_fpr_approve = {
                name = "Approve!",
                text = {
                    "If {C:attention}first hand{} of round",
                    "has only {C:attention}#1#{} card#<s>1#, apply",
                    "a random {C:attention}Seal{} to #<them,it>1#"
                }
            }
        }
    },
    misc = {
        dictionary = {
            k_fpr_approved = "Approved!"
        }
    }
}