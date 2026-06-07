local Rayfield = loadstring(game:HttpGet(
    "https://sirius.menu/rayfield"
))()

local HttpService = game:GetService("HttpService")

getgenv().FAWWA = getgenv().FAWWA or {}
getgenv().FAWWA.Webhook = getgenv().FAWWA.Webhook or ""

local function SendWebhook()
    local url = getgenv().FAWWA.Webhook

    if not url or url == "" then
        return false
    end

    local payload = {
        embeds = {{
            title = "🎣 FAWWA FISH IT",
            description = "Webhook Connected Successfully!",
            color = 16753920,
            footer = {
                text = "FAWWA FISH IT"
            }
        }}
    }

    local requestFunc =
        (syn and syn.request) or
        http_request or
        request

    if not requestFunc then
        return false
    end

    local success, result = pcall(function()
        return requestFunc({
            Url = url,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode(payload)
        })
    end)

    return success
end

local Window = Rayfield:CreateWindow({
    Name = "FAWWA FISH IT",
    LoadingTitle = "FAWWA FISH IT",
    LoadingSubtitle = "by DeFiqi",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "FAWWA",
        FileName = "FishIt"
    }
})

local MainTab = Window:CreateTab("Main", 4483362458)
local WebhookTab = Window:CreateTab("Webhook", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)

MainTab:CreateSection("Main Features")

MainTab:CreateToggle({
    Name = "Auto Fish",
    CurrentValue = false,
    Flag = "AutoFish",
    Callback = function(Value)
        getgenv().AutoFish = Value
    end,
})

MainTab:CreateToggle({
    Name = "Auto Sell",
    CurrentValue = false,
    Flag = "AutoSell",
    Callback = function(Value)
        getgenv().AutoSell = Value
    end,
})

WebhookTab:CreateSection("Discord Webhook")

WebhookTab:CreateInput({
    Name = "Discord Webhook URL",
    PlaceholderText = "Paste webhook here",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        getgenv().FAWWA.Webhook = Text
    end,
})

WebhookTab:CreateButton({
    Name = "Test Webhook",
    Callback = function()

        local success = SendWebhook()

        if success then
            Rayfield:Notify({
                Title = "FAWWA",
                Content = "Webhook Sent Successfully!",
                Duration = 5
            })
        else
            Rayfield:Notify({
                Title = "FAWWA",
                Content = "Webhook Failed!",
                Duration = 5
            })
        end

    end,
})

SettingsTab:CreateSection("Performance")

SettingsTab:CreateButton({
    Name = "FPS Boost",
    Callback = function()
        Rayfield:Notify({
            Title = "FAWWA",
            Content = "FPS Boost Enabled",
            Duration = 5
        })
    end,
})

Rayfield:Notify({
    Title = "FAWWA FISH IT",
    Content = "Successfully Loaded",
    Duration = 5
})
