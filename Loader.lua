local VERSION = "1.0"
local HUB_NAME = "FAWWA FISH IT"

local SupportedGames = {
    [6701277882] = "FishIt"
}

local BASE_URL = "https://raw.githubusercontent.com/DeFiqi/FAWWA-FISH-IT/main"

local GameName = SupportedGames[game.GameId]

if not GameName then
    warn("[" .. HUB_NAME .. "] Game not supported!")
    return
end

local ScriptURL = BASE_URL .. "/Games/" .. GameName .. ".lua"

local Success, Error = pcall(function()
    loadstring(game:HttpGet(ScriptURL))()
end)

if not Success then
    warn("[" .. HUB_NAME .. "] Error: " .. tostring(Error))
end
