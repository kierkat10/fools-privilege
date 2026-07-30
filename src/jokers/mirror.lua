
SMODS.Joker {
    key = "mirror",
    name = "Blank Mirror",
    pos = { x = 4, y = 1 },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    atlas = "joker",
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_vampire
        info_queue[#info_queue + 1] = G.P_CENTERS.j_invisible
    end,
    calculate = function(self, card, context)
        if context.after then
            for _, scored_card in ipairs(context.scoring_hand) do
                if SMODS.get_enhancements(scored_card)["m_glass"] then
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        local joker_to_create = pseudorandom_element({"j_vampire", "j_invisible"}, "fpr_mirror")
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local new_card = SMODS.add_card({
                                    set = "Joker",
                                    key = joker_to_create
                                })
                                new_card:start_materialize()
                                G.GAME.joker_buffer = 0
                                return true
                            end
                        }))
                        SMODS.destroy_cards(card)
                        return {
                            message = localize("k_plus_joker"),
                            colour = (joker_to_create == "j_vampire" and G.C.RARITY.Uncommon) or (joker_to_create == "j_invisible" and G.C.RARITY.Rare) or G.C.FILTER
                        }
                    end
                end
            end
        end
    end
}