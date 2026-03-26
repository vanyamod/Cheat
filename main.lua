-- [[ NEXUS OS: MAIN LOADER ]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "NEXUS V3 | ULTIMATE",
    LoadingTitle = "Загрузка модульной системы...",
    LoadingSubtitle = "by Nexus Team",
    ConfigurationSaving = { Enabled = true, Folder = "NexusV3" }
})

-- База данных модулей (добавляйте названия файлов сюда)
local Cogs = {
    "Movement",
    "Combat",
    "Visuals"
}

local Tabs = {} -- Сюда будем складывать созданные вкладки

-- Функция для загрузки "Когов" с GitHub
local function LoadCogs()
    local RawURL = "https://raw.githubusercontent.com/ВАШ_НИК/ВАШ_РЕПО/main/Cogs/"
    
    for _, cogName in pairs(Cogs) do
        local success, err = pcall(function()
            -- Создаем вкладку для модуля
            Tabs[cogName] = Window:CreateTab(cogName, 4483362458) 
            
            -- Загружаем код модуля
            local code = game:HttpGet(RawURL .. cogName .. ".lua")
            local func = loadstring(code)
            
            if func then
                -- Передаем вкладку в модуль, чтобы он сам создавал свои кнопки
                func(Tabs[cogName], Rayfield)
                print("[NEXUS]: Модуль " .. cogName .. " успешно загружен.")
            end
        end)
        
        if not success then
            warn("[NEXUS ERROR]: Не удалось загрузить " .. cogName .. ": " .. tostring(err))
        end
    end
end

LoadCogs()
Rayfield:LoadConfiguration()
