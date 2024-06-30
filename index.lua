local local_player = game.Players.LocalPlayer
local gui = local_player.PlayerGui:WaitForChild("Main")

-- Função para exibir texto temporário
local function showText(text, time)
    gui.Notifier.Text = text
    gui.Notifier.Visible = true
    task.wait(time)
    gui.Notifier.Visible = false
end

-- Função para reproduzir som
local function playSound(asset_id, pb_speed)
    local sound = Instance.new("Sound", workspace)
    sound.SoundId = asset_id
    sound.Volume = 1
    sound.PlaybackSpeed = pb_speed
    sound:Play()

    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

-- Carregar a Kavo UI Library
local Kavo = loadstring(game:HttpGet("https://pastebin.com/raw/UCymbKpi"))()

-- Criar a interface usando a Kavo UI Library
local library = Kavo:CreateLib("Notifier App", "DarkTheme")

-- Criar abas
local mainTab = library:NewTab("Main")
local settingsTab = library:NewTab("Settings")

-- Criar seções
local mainSection = mainTab:NewSection("Notifier Control")
local settingsSection = settingsTab:NewSection("Settings")

-- Variável para manter o estado do notificador
local notifierEnabled = false

-- Função para ativar ou desativar o notificador
local function toggleNotifier()
    notifierEnabled = not notifierEnabled

    if notifierEnabled then
        workspace_connection = workspace.ChildAdded:Connect(function(child)
            if child.Name == "Fruit " then
                task.spawn(enableNotifier, child)
            end
        end)

        local fruit = workspace:FindFirstChild("Fruit ")
        if fruit then
            task.spawn(enableNotifier, fruit)
        end

        showText("Notificador ativado com sucesso", 2)
        return "Desativar Notificador"
    else
        if workspace_connection then
            workspace_connection:Disconnect()
            workspace_connection = nil
        end

        showText("Notificador desativado com sucesso", 2)
        return "Ativar Notificador"
    end
end

-- Botão para ativar/desativar o notificador
mainSection:NewButton("Ativar Notificador", "Clique para ativar/desativar o notificador", function()
    local buttonText = toggleNotifier()
    mainSection:UpdateButton(1, buttonText)
end)

-- Função para habilitar o notificador quando uma fruta é encontrada
local function enableNotifier(fruit)
    local fruit_name = "Uma fruta"
    local fruit_child = fruit:WaitForChild("Handle")

    for _, descendant in ipairs(fruit:GetChildren()) do
        if descendant:IsA("MeshPart") and string.sub(descendant.Name, 1, 7) == "Meshes/" then
            local i, j = string.find(descendant.Name, '_')
            fruit_name = string.sub(descendant.Name, 8, i - 1)

            if string.lower(fruit_name) == "magu" then
                fruit_name = "Magma"
            elseif string.lower(fruit_name) == "smouke" then
                fruit_name = "Smoke"
            elseif string.lower(fruit_name) == "quaketest" then
                fruit_name = "Quake"
            end

            fruit_name = fruit_name:gsub("^%l", string.upper)
            fruit_name = fruit_name:gsub("%d+", '')
            break
        end
    end

    while workspace_connection and workspace:FindFirstChild(fruit.Name) do
        gui.Notifier.Text = fruit_name .. " encontrada a: " .. math.floor((local_player.Character:WaitForChild("UpperTorso").Position - fruit_child.Position).Magnitude * 0.15) .. 'm'
        task.wait(0.2)
    end

    if not workspace:FindFirstChild(fruit.Name) then
        playSound("rbxassetid://4612375233", 1)
        showText("Fruta despawnada/coletada", 3)
    end
end

-- Exibir texto de inicialização
showText("Interface inicializada com sucesso", 3)
