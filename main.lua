SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end
-- this function is used to load everything within a folder.-- Jokerforge doesnt use it because it doesnt make loading order easy
local function load_folder(path)
    local files = NFS.getDirectoryItemsInfo(mod_path .. "/" .. path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file(path .. file_name))()
        end
    end
end
-- load the jokers
if true then
    assert(SMODS.load_file("jokers/daringjoker.lua"))()
    assert(SMODS.load_file("jokers/imprudentjoker.lua"))()
    assert(SMODS.load_file("jokers/insolentjoker.lua"))()
    assert(SMODS.load_file("jokers/arrogantjoker.lua"))()
    assert(SMODS.load_file("jokers/cheekyjoker.lua"))()
    assert(SMODS.load_file("jokers/sushiserving.lua"))()
    assert(SMODS.load_file("jokers/dalgonacookie.lua"))()
    assert(SMODS.load_file("jokers/basiccola.lua"))()
    assert(SMODS.load_file("jokers/sugarfreecola.lua"))()
    assert(SMODS.load_file("jokers/grapecola.lua"))()
    assert(SMODS.load_file("jokers/bluecola.lua"))()
    assert(SMODS.load_file("jokers/bluemoon.lua"))()
    assert(SMODS.load_file("jokers/rainbowend.lua"))()
    assert(SMODS.load_file("jokers/schrodinger.lua"))()
    assert(SMODS.load_file("jokers/blankmirror.lua"))()
    assert(SMODS.load_file("jokers/spinthewheel.lua"))()
    assert(SMODS.load_file("jokers/croupier.lua"))()
    assert(SMODS.load_file("jokers/draw4.lua"))()
    assert(SMODS.load_file("jokers/rightangle.lua"))()
    assert(SMODS.load_file("jokers/regularjoker.lua"))()
    assert(SMODS.load_file("jokers/stardustjoker.lua"))()
    assert(SMODS.load_file("jokers/smashburguer.lua"))()
    assert(SMODS.load_file("jokers/tomatosoup.lua"))()
    assert(SMODS.load_file("jokers/crumblcookie.lua"))()
    assert(SMODS.load_file("jokers/durian.lua"))()
    assert(SMODS.load_file("jokers/potatochips.lua"))()
    assert(SMODS.load_file("jokers/darkchocolate.lua"))()
    assert(SMODS.load_file("jokers/rainbowroll.lua"))()
    assert(SMODS.load_file("jokers/backroom.lua"))()
    assert(SMODS.load_file("jokers/lucky7.lua"))()
    assert(SMODS.load_file("jokers/downtheflush.lua"))()
    assert(SMODS.load_file("jokers/familygathering.lua"))()
    assert(SMODS.load_file("jokers/olidammara.lua"))()
    assert(SMODS.load_file("jokers/wuzetian.lua"))()
    assert(SMODS.load_file("jokers/jackofalltrades.lua"))()
    assert(SMODS.load_file("jokers/blueflame.lua"))()
    assert(SMODS.load_file("jokers/familybarbecue.lua"))()
    assert(SMODS.load_file("jokers/homecoming.lua"))()
    assert(SMODS.load_file("jokers/blackjack.lua"))()
    assert(SMODS.load_file("jokers/collegedegree.lua"))()
    assert(SMODS.load_file("jokers/illusionist.lua"))()
    assert(SMODS.load_file("jokers/gonggi.lua"))()
    assert(SMODS.load_file("jokers/spacestation.lua"))()
    assert(SMODS.load_file("jokers/burningpact.lua"))()
    assert(SMODS.load_file("jokers/taxdeclaration.lua"))()
    assert(SMODS.load_file("jokers/l.lua"))()
    assert(SMODS.load_file("jokers/lotterywinner.lua"))()
    assert(SMODS.load_file("jokers/pingpong.lua"))()
    assert(SMODS.load_file("jokers/breakshot.lua"))()
    assert(SMODS.load_file("jokers/oathofloyalty.lua"))()
    assert(SMODS.load_file("jokers/jackpot.lua"))()
    assert(SMODS.load_file("jokers/roulette.lua"))()
    assert(SMODS.load_file("jokers/drspectred.lua"))()
    assert(SMODS.load_file("jokers/shoppingspree.lua"))()
    assert(SMODS.load_file("jokers/sakuratree.lua"))()
    assert(SMODS.load_file("jokers/onewishwillow.lua"))()
    assert(SMODS.load_file("jokers/entrycard.lua"))()
    assert(SMODS.load_file("jokers/creeper.lua"))()
    assert(SMODS.load_file("jokers/evileye.lua"))()
    assert(SMODS.load_file("jokers/inkrestock.lua"))()
    assert(SMODS.load_file("jokers/draft.lua"))()
    assert(SMODS.load_file("jokers/economist.lua"))()
    assert(SMODS.load_file("jokers/redpaint.lua"))()
    assert(SMODS.load_file("jokers/phantasm.lua"))()
    assert(SMODS.load_file("jokers/daruma.lua"))()
    assert(SMODS.load_file("jokers/paintingbrush.lua"))()
    assert(SMODS.load_file("jokers/trianglejoker.lua"))()
    assert(SMODS.load_file("jokers/shoppingstop.lua"))()
    assert(SMODS.load_file("jokers/notebook.lua"))()
    assert(SMODS.load_file("jokers/christmaslights.lua"))()
    assert(SMODS.load_file("jokers/scrapingtool.lua"))()
    assert(SMODS.load_file("jokers/medusa.lua"))()
    assert(SMODS.load_file("jokers/liminalcorridor.lua"))()
    assert(SMODS.load_file("jokers/deviljoker.lua"))()
    assert(SMODS.load_file("jokers/raflle.lua"))()
    assert(SMODS.load_file("jokers/hattrick.lua"))()
    assert(SMODS.load_file("jokers/heisa10but.lua"))()
    assert(SMODS.load_file("jokers/stampcollector.lua"))()
    assert(SMODS.load_file("jokers/diogenes.lua"))()
    assert(SMODS.load_file("jokers/bonusprize.lua"))()
    assert(SMODS.load_file("jokers/multmatt.lua"))()
    assert(SMODS.load_file("jokers/sashimi.lua"))()
    assert(SMODS.load_file("jokers/extraspace.lua"))()
    assert(SMODS.load_file("jokers/bungeejumping.lua"))()
    assert(SMODS.load_file("jokers/redwine.lua"))()
    assert(SMODS.load_file("jokers/chocolategoldbar.lua"))()
    assert(SMODS.load_file("jokers/knittedjeans.lua"))()
    assert(SMODS.load_file("jokers/koifish.lua"))()
    assert(SMODS.load_file("jokers/tv.lua"))()
    assert(SMODS.load_file("jokers/solarsystem.lua"))()
    assert(SMODS.load_file("jokers/approve.lua"))()
    assert(SMODS.load_file("jokers/nutellacookie.lua"))()
    assert(SMODS.load_file("jokers/coffeeshot.lua"))()
    assert(SMODS.load_file("jokers/serverbook.lua"))()
    assert(SMODS.load_file("jokers/redvelvetcake.lua"))()
    assert(SMODS.load_file("jokers/blueberryporridge.lua"))()
    assert(SMODS.load_file("jokers/blacktrufflepasta.lua"))()
    assert(SMODS.load_file("jokers/salmonroe.lua"))()
end
SMODS.ObjectType({
    key = "foolspri_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "foolspri_foolspri_jokers",
    cards = {
        ["j_foolspri_daringjoker"] = true,
        ["j_foolspri_imprudentjoker"] = true,
        ["j_foolspri_insolentjoker"] = true,
        ["j_foolspri_arrogantjoker"] = true,
        ["j_foolspri_cheekyjoker"] = true,
        ["j_foolspri_sushiserving"] = true,
        ["j_foolspri_bluemoon"] = true,
        ["j_foolspri_rainbowend"] = true,
        ["j_foolspri_schrodinger"] = true,
        ["j_foolspri_croupier"] = true,
        ["j_foolspri_darkchocolate"] = true,
        ["j_foolspri_lucky7"] = true,
        ["j_foolspri_downtheflush"] = true,
        ["j_foolspri_familygathering"] = true,
        ["j_foolspri_jackofalltrades"] = true,
        ["j_foolspri_redvelvetcake"] = true,
        ["j_foolspri_blueberryporridge"] = true,
        ["j_foolspri_blacktrufflepasta"] = true,
        ["j_foolspri_salmonroe"] = true
    },
})

SMODS.ObjectType({
    key = "foolspri_foolsprivilege_jokers",
    cards = {
        ["j_foolspri_dalgonacookie"] = true,
        ["j_foolspri_basiccola"] = true,
        ["j_foolspri_sugarfreecola"] = true,
        ["j_foolspri_blankmirror"] = true,
        ["j_foolspri_spinthewheel"] = true,
        ["j_foolspri_draw4"] = true,
        ["j_foolspri_stardustjoker"] = true,
        ["j_foolspri_crumblcookie"] = true,
        ["j_foolspri_durian"] = true,
        ["j_foolspri_potatochips"] = true,
        ["j_foolspri_backroom"] = true,
        ["j_foolspri_olidammara"] = true,
        ["j_foolspri_wuzetian"] = true,
        ["j_foolspri_blueflame"] = true,
        ["j_foolspri_familybarbecue"] = true,
        ["j_foolspri_homecoming"] = true,
        ["j_foolspri_blackjack"] = true,
        ["j_foolspri_collegedegree"] = true,
        ["j_foolspri_illusionist"] = true,
        ["j_foolspri_gonggi"] = true,
        ["j_foolspri_spacestation"] = true,
        ["j_foolspri_burningpact"] = true,
        ["j_foolspri_taxdeclaration"] = true,
        ["j_foolspri_l"] = true,
        ["j_foolspri_lotterywinner"] = true,
        ["j_foolspri_pingpong"] = true,
        ["j_foolspri_breakshot"] = true,
        ["j_foolspri_oathofloyalty"] = true,
        ["j_foolspri_jackpot"] = true,
        ["j_foolspri_roulette"] = true,
        ["j_foolspri_drspectred"] = true,
        ["j_foolspri_shoppingspree"] = true,
        ["j_foolspri_sakuratree"] = true,
        ["j_foolspri_onewishwillow"] = true,
        ["j_foolspri_entrycard"] = true,
        ["j_foolspri_creeper"] = true,
        ["j_foolspri_evileye"] = true,
        ["j_foolspri_inkrestock"] = true,
        ["j_foolspri_draft"] = true,
        ["j_foolspri_economist"] = true,
        ["j_foolspri_redpaint"] = true,
        ["j_foolspri_phantasm"] = true,
        ["j_foolspri_daruma"] = true,
        ["j_foolspri_paintingbrush"] = true,
        ["j_foolspri_trianglejoker"] = true,
        ["j_foolspri_shoppingstop"] = true,
        ["j_foolspri_notebook"] = true,
        ["j_foolspri_christmaslights"] = true
    },
})

SMODS.ObjectType({
    key = "foolspri_fpv_jokers",
    cards = {
        ["j_foolspri_grapecola"] = true,
        ["j_foolspri_bluecola"] = true,
        ["j_foolspri_rightangle"] = true,
        ["j_foolspri_regularjoker"] = true,
        ["j_foolspri_smashburguer"] = true,
        ["j_foolspri_tomatosoup"] = true,
        ["j_foolspri_rainbowroll"] = true,
        ["j_foolspri_scrapingtool"] = true,
        ["j_foolspri_medusa"] = true,
        ["j_foolspri_liminalcorridor"] = true,
        ["j_foolspri_deviljoker"] = true,
        ["j_foolspri_raflle"] = true,
        ["j_foolspri_hattrick"] = true,
        ["j_foolspri_heisa10but"] = true,
        ["j_foolspri_stampcollector"] = true,
        ["j_foolspri_diogenes"] = true,
        ["j_foolspri_bonusprize"] = true,
        ["j_foolspri_multmatt"] = true,
        ["j_foolspri_sashimi"] = true,
        ["j_foolspri_extraspace"] = true,
        ["j_foolspri_bungeejumping"] = true,
        ["j_foolspri_redwine"] = true,
        ["j_foolspri_chocolategoldbar"] = true,
        ["j_foolspri_knittedjeans"] = true,
        ["j_foolspri_koifish"] = true,
        ["j_foolspri_tv"] = true,
        ["j_foolspri_solarsystem"] = true,
        ["j_foolspri_approve"] = true,
        ["j_foolspri_nutellacookie"] = true,
        ["j_foolspri_coffeeshot"] = true,
        ["j_foolspri_serverbook"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end