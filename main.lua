to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

if not FoolsPrivilege then FoolsPrivilege = {} end
SMODS.FoolsPrivilege = FoolsPrivilege

FoolsPrivilege.config = SMODS.current_mod.config or {}

FoolsPrivilege.mod_config = SMODS.current_mod.config

local files = NFS.getDirectoryItemsInfo(SMODS.current_mod.path .. "/lib")
for i = 1, #files do
    local file_name = files[i].name
    if file_name:sub(-4) == ".lua" then
        assert(SMODS.load_file("lib/" .. file_name))()
    end
end

local files = {
    jokers = {
        list = {
            "cheeky",
            "arrogant",
            "imprudent",
            "daring",
            "insolent",
            "sushi_serving",
            "dalgona",
            "basic_cola",
            "sugar_free_cola",
            "grape_cola",
            "blue_cola",
            "blue_moon",
            "rainbow_end",
            "schrodinger",
            "mirror",
            "spin_wheel",
            "croupier",
            "draw4",
            "rightangle",
            "regularjoker",
            "stardustjoker",
            "smashburguer",
            "tomatosoup",
            "crumblcookie",
            "durian",
            "potatochips",
            "darkchocolate",
            "rainbowroll",
            "backroom",
            "lucky7",
            "downtheflush",
            "familygathering",
            "olidammara",
            "wuzetian",
            "jackofalltrades",
            "blueflame",
            "familybarbecue",
            "homecoming",
            "blackjack",
            "collegedegree",
            "illusionist",
            "gonggi",
            "spacestation",
            "burningpact",
            "taxdeclaration",
            "l",
            "lotterywinner",
            "pingpong",
            "breakshot",
            "oathofloyalty",
            "jackpot",
            "roulette",
            "drspectred",
            "shoppingspree",
            "sakuratree",
            "onewishwillow",
            "entrycard",
            "creeper",
            "evileye",
            "inkrestock",
            "draft",
            "economist",
            "redpaint",
            "phantasm",
            "daruma",
            "paintingbrush",
            "trianglejoker",
            "shoppingstop",
            "notebook",
            "christmaslights",
            "scrapingtool",
            "medusa",
            "liminalcorridor",
            "deviljoker",
            "raflle",
            "hattrick",
            "heisa10but",
            "stampcollector",
            "diogenes",
            "bonusprize",
            "multmatt",
            "sashimi",
            "extraspace",
            "bungeejumping",
            "redwine",
            "chocolategoldbar",
            "knittedjeans",
            "koifish",
            "tv",
            "solarsystem",
            "approve",
            "nutellacookie",
            "coffeeshot",
            "serverbook",
            "redvelvetcake",
            "blueberryporridge",
            "blacktrufflepasta",
            "salmonroe"
        }, directory = "src/jokers/"
    }
}

for _, name in ipairs(files["jokers"].list) do
    assert(SMODS.load_file(files["jokers"].directory .. name .. ".lua"))()
end