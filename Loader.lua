local VERSION = "1.0"
local HUB_NAME = "FAWWA FISH IT"

local SupportedGames = {
    [6701277882] = "FishIt"
}

local BASE_URL = "https://raw.githubusercontent.com/USERNAME/FAWWA-FISH-IT/main"

local GameName = SupportedGames[game.GameId]

if not GameName then
    warn(HUB_NAME .. " | Game not supported")
    return
end

loadstring(game:HttpGet(BASE_URL .. "/Games/" .. GameName .. ".lua"))()
