local Rayfield = loadstring(game:HttpGet(
    'https://sirius.menu/rayfield'
))()

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

WebhookTab:CreateInput({
    Name = "Discord Webhook",
    PlaceholderText = "Paste webhook here",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        getgenv().Webhook = Text
    end,
})

WebhookTab:CreateButton({
    Name = "Test Webhook",
    Callback = function()
        Rayfield:Notify({
            Title = "FAWWA",
            Content = "Webhook test clicked",
            Duration = 5
        })
    end,
})

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
