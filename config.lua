-- config.lua
local Config = {}

-- Сервисы
Config.Services = {
    Players = game:GetService("Players"),
    Workspace = game:GetService("Workspace"),
    ReplicatedStorage = game:GetService("ReplicatedStorage"),
    UserInputService = game:GetService("UserInputService"),
    RunService = game:GetService("RunService"),
    TweenService = game:GetService("TweenService"),
    HttpService = game:GetService("HttpService")
}

-- Игрок
Config.Player = Config.Services.Players.LocalPlayer
Config.Character = Config.Player.Character or Config.Player.CharacterAdded:Wait()
Config.HRP = Config.Character:WaitForChild("HumanoidRootPart")
Config.Humanoid = Config.Character:WaitForChild("Humanoid")

-- Важные объекты BSS
Config.Workspace = {
    NPCs = workspace.NPCs,
    Flowers = workspace.Flowers,
    FlowerZones = workspace.FlowerZones,
    Collectibles = workspace.Collectibles,
    Monsters = workspace.Monsters,
    Particles = workspace.Particles
}

-- Поля
Config.Fields = {
    "Sunflower Field", "Mushroom Field", "Dandelion Field", "Blue Flower Field",
    "Clover Field", "Spider Field", "Strawberry Field", "Bamboo Field",
    "Pineapple Patch", "Stump Field", "Cactus Field", "Pumpkin Patch",
    "Pine Tree Forest", "Rose Field", "Mountain Top Field", "Coconut Field", "Pepper Patch"
}

-- NPC квестодатели
Config.QuestNPCs = {
    "Black Bear", "Brown Bear", "Panda Bear", "Polar Bear", "Science Bear",
    "Mother Bear", "Tunnel Bear", "Sun Bear", "Gummy Bear", "Stick Bug",
    "Bubble Bee Man", "Riley Bee", "Bucko Bee", "Honey Bee"
}

-- Настройки безопасности
Config.Safety = {
    RandomDelayMin = 0.1,
    RandomDelayMax = 0.5,
    MovementRandomization = true,
    AntiKick = true,
    AutoReconnect = true
}

-- Настройки автофарма
Config.AutoFarm = {
    Enabled = false,
    CurrentField = "Sunflower Field",
    AutoConvert = true,
    CollectTokens = true,
    UseAbilities = true,
    FieldRotation = false,
    FieldRotationTime = 300
}

-- Настройки автоквестов
Config.AutoQuest = {
    Enabled = false,
    AutoAccept = true,
    AutoComplete = true,
    AutoTurnIn = true,
    Blacklist = {},
    PriorityNPCs = {"Polar Bear", "Gummy Bear"}
}

-- Настройки ESP
Config.ESP = {
    Tokens = false,
    Mobs = false,
    Bees = false,
    Distance = 1000
}

-- Настройки персонажа
Config.PlayerMods = {
    WalkSpeed = 16,
    JumpPower = 50,
    InfiniteJump = false,
    NoClip = false,
    Fly = false,
    FlySpeed = 50
}

-- Статистика
Config.Stats = {
    SessionStart = os.time(),
    PollenCollected = 0,
    HoneyMade = 0,
    QuestsCompleted = 0,
    TokensCollected = 0
}

-- Функция безопасной задержки
function Config:SafeWait(minTime, maxTime)
    if self.Safety.RandomDelayMin and self.Safety.RandomDelayMax then
        wait(math.random(self.Safety.RandomDelayMin * 100, self.Safety.RandomDelayMax * 100) / 100)
    else
        wait(minTime or 0.1)
    end
end

return Config
