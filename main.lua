-- [[ NEXUS OS: MAIN LOADER WITH CONFIG ]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local RawURL = "https://raw.githubusercontent.com/vanyamod/Cheat/main/"

-- Загружаем глобальный конфиг
local Config = loadstring(game:HttpGet(RawURL .. "Config.lua"))()

local Window = Rayfield:CreateWindow({
    Name = "NEXUS V3 | ULTIMATE",
    LoadingTitle = "Nexus Framework v" .. Config.System.Version,
    LoadingSubtitle = "by Nexus Team",
    ConfigurationSaving = {
        Enabled = true,
        Folder = "NexusV3_Data", -- Папка в папке workspace вашего экспойта
        FileName = "MainConfig"
    }
})

local Cogs = {"Movement", "Combat", "Visuals"}
local Tabs = {}

-- Универсальный загрузчик
for _, cogName in pairs(Cogs) do
    local success, err = pcall(function()
        Tabs[cogName] = Window:CreateTab(cogName, 4483362458)
        
        local code = game:HttpGet(RawURL .. "Cogs/" .. cogName .. ".lua")
        local func = loadstring(code)
        
        if func then
            -- ПЕРЕДАЕМ: вкладку, библиотеку и часть конфига для этого модуля
            func(Tabs[cogName], Rayfield, Config[cogName])
            print("[NEXUS]: Модуль " .. cogName .. " инициализирован.")
        end
    end)
    if not success then warn("Ошибка в " .. cogName .. ": " .. err) end
end
