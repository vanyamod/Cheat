return function(Tab, Rayfield, MyConfig)
    local Section = Tab:CreateSection("Настройки из конфига")

    Tab:CreateSlider({
        Name = "WalkSpeed",
        Range = {16, MyConfig.MaxSpeed}, -- Берем лимит из Гитхаба
        Increment = 1,
        CurrentValue = MyConfig.DefaultSpeed, -- Ставим дефолт из Гитхаба
        Flag = "SpeedSlider", -- Флаг для сохранения в JSON
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end,
    })
    
    Tab:CreateToggle({
        Name = "Infinite Jump",
        CurrentValue = MyConfig.InfiniteJump,
        Flag = "InfJumpToggle",
        Callback = function(Value)
            _G.InfJump = Value
        end,
    })
end
