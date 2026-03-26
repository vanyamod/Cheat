-- [[ NEXUS OS: GLOBAL CONFIGURATION ]]
local Config = {
    -- Основные настройки системы
    System = {
        Version = "3.1.2",
        Theme = "Ocean", -- Темы Rayfield: Default, Amber, Ocean, Blood, etc.
        DebugMode = false
    },
    
    -- Настройки для Movement Cog
    Movement = {
        DefaultSpeed = 16,
        MaxSpeed = 300,
        JumpPower = 50,
        InfiniteJump = false
    },
    
    -- Настройки для Combat Cog
    Combat = {
        AimbotEnabled = false,
        AimbotKey = "RightControl",
        FOV = 150,
        Smoothness = 0.2,
        TargetPart = "Head"
    },
    
    -- Настройки для Visuals Cog
    Visuals = {
        ESP_Enabled = false,
        Boxes = true,
        Names = true,
        Health = true,
        Distance = true,
        TeamCheck = false
    }
}

return Config
