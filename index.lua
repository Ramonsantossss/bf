-- Script para coletar baús automaticamente em Blox Fruits (exemplo em Lua)

local player = game.Players.LocalPlayer
local chests = game.Workspace:GetChildren() -- Assumindo que os baús são filhos diretos de Workspace

local function findNearestChest()
    local minDistance = math.huge
    local nearestChest = nil
    local playerPosition = player.Character.HumanoidRootPart.Position

    for _, chest in pairs(chests) do
        if chest.Name == "Chest" then -- Nome do modelo do baú
            local chestPosition = chest.Position
            local distance = (playerPosition - chestPosition).magnitude

            if distance < minDistance then
                minDistance = distance
                nearestChest = chest
            end
        end
    end

    return nearestChest
end

local function collectNearestChest()
    local nearestChest = findNearestChest()

    if nearestChest then
        player.Character:MoveTo(nearestChest.Position)
        wait(1) -- Tempo para chegar ao baú
        nearestChest:FindFirstChildOfClass("ClickDetector"):Click() -- Clica no baú
    end
end

-- Ativar/desativar coleta automática
local isAutoCollecting = false

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F1 then -- Tecla para ativar/desativar (exemplo: F1)
        isAutoCollecting = not isAutoCollecting
        if isAutoCollecting then
            print("Coleta automática ativada.")
            while isAutoCollecting do
                collectNearestChest()
                wait(1)
            end
        else
            print("Coleta automática desativada.")
        end
    end
end)
