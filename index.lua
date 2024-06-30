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

-- Função para criar a interface do aplicativo
local function createAppInterface()
    local screenGui = Instance.new("ScreenGui", local_player.PlayerGui)
    screenGui.Name = "HyperHub"

    local mainFrame = Instance.new("Frame", screenGui)
    mainFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
    mainFrame.Size = UDim2.new(0, 400, 0, 250)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Draggable = true

    local header = Instance.new("Frame", mainFrame)
    header.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    header.Size = UDim2.new(1, 0, 0, 40)
    header.BorderSizePixel = 0
    header.Active = true
    header.Draggable = true

    local titleLabel = Instance.new("TextLabel", header)
    titleLabel.Text = "Hyper Hub"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 18
    titleLabel.BackgroundTransparency = 1
    titleLabel.Size = UDim2.new(1, -80, 1, 0)
    titleLabel.Position = UDim2.new(0, 10, 0, 0)

    local closeButton = Instance.new("TextButton", header)
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 18
    closeButton.BackgroundTransparency = 1
    closeButton.Size = UDim2.new(0, 40, 1, 0)
    closeButton.Position = UDim2.new(1, -40, 0, 0)

    local minimizeButton = Instance.new("TextButton", header)
    minimizeButton.Text = "-"
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.Font = Enum.Font.GothamBold
    minimizeButton.TextSize = 18
    minimizeButton.BackgroundTransparency = 1
    minimizeButton.Size = UDim2.new(0, 40, 1, 0)
    minimizeButton.Position = UDim2.new(1, -80, 0, 0)

    local teleButton = Instance.new("TextButton", mainFrame)
    teleButton.Text = "Teleportar"
    teleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    teleButton.Font = Enum.Font.Gotham
    teleButton.TextSize = 16
    teleButton.AutoButtonColor = false
    teleButton.BackgroundColor3 = Color3.fromRGB(33, 150, 243)
    teleButton.Position = UDim2.new(0.5, -100, 0.2, 0)
    teleButton.Size = UDim2.new(0, 200, 0, 40)
    teleButton.Name = "TeleportButton"

    local autoFarmBossButton = Instance.new("TextButton", mainFrame)
    autoFarmBossButton.Text = "Auto Farm Boss"
    autoFarmBossButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    autoFarmBossButton.Font = Enum.Font.Gotham
    autoFarmBossButton.TextSize = 16
    autoFarmBossButton.AutoButtonColor = false
    autoFarmBossButton.BackgroundColor3 = Color3.fromRGB(33, 150, 243)
    autoFarmBossButton.Position = UDim2.new(0.5, -100, 0.35, 0)
    autoFarmBossButton.Size = UDim2.new(0, 200, 0, 40)
    autoFarmBossButton.Name = "AutoFarmBossButton"

    local autoFarmStatusButton = Instance.new("TextButton", mainFrame)
    autoFarmStatusButton.Text = "Auto Farm por Status"
    autoFarmStatusButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    autoFarmStatusButton.Font = Enum.Font.Gotham
    autoFarmStatusButton.TextSize = 16
    autoFarmStatusButton.AutoButtonColor = false
    autoFarmStatusButton.BackgroundColor3 = Color3.fromRGB(33, 150, 243)
    autoFarmStatusButton.Position = UDim2.new(0.5, -100, 0.5, 0)
    autoFarmStatusButton.Size = UDim2.new(0, 200, 0, 40)
    autoFarmStatusButton.Name = "AutoFarmStatusButton"

    local switch = Instance.new("TextButton", mainFrame)
    switch.Text = "Ativar Notificador"
    switch.TextColor3 = Color3.fromRGB(255, 255, 255)
    switch.Font = Enum.Font.Gotham
    switch.TextSize = 16
    switch.AutoButtonColor = false
    switch.BackgroundColor3 = Color3.fromRGB(33, 150, 243)
    switch.Position = UDim2.new(0.5, -100, 0.8, 0)
    switch.Size = UDim2.new(0, 200, 0, 40)
    switch.Name = "NotifierSwitch"

    local minimizedFrame = Instance.new("Frame", screenGui)
    minimizedFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    minimizedFrame.Size = UDim2.new(0, 100, 0, 100)
    minimizedFrame.Position = UDim2.new(0, 10, 1, -110)
    minimizedFrame.Visible = false
    minimizedFrame.Active = true
    minimizedFrame.Draggable = true

    local minimizedImage = Instance.new("ImageButton", minimizedFrame)
    minimizedImage.Size = UDim2.new(1, 0, 1, 0)
    minimizedImage.Image = "http://www.roblox.com/asset/?id=10215283" -- A imagem que você forneceu
    minimizedImage.BackgroundTransparency = 1

    local function minimize()
        mainFrame.Visible = false
        minimizedFrame.Visible = true
    end

    local function maximize()
        mainFrame.Visible = true
        minimizedFrame.Visible = false
    end

    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    minimizeButton.MouseButton1Click:Connect(function()
        minimize()
    end)

    minimizedImage.MouseButton1Click:Connect(function()
        maximize()
    end)

    return {
        teleport = teleButton,
        autoFarmBoss = autoFarmBossButton,
        autoFarmStatus = autoFarmStatusButton,
        notifier = switch
    }
end

-- Conexão para ouvir a adição de novos filhos no workspace
local workspace_connection

-- Função para ativar ou desativar o notificador
local function toggleNotifier()
    if workspace_connection then
        workspace_connection:Disconnect()
        workspace_connection = nil
        switch.Text = "Ativar Notificador"
        switch.BackgroundColor3 = Color3.fromRGB(33, 150, 243)
        playSound("rbxassetid://4612375233", 1)
        showText("Notificador desativado com sucesso", 2)
    else
        workspace_connection = workspace.ChildAdded:Connect(function(child)
            if child.Name == "Fruit " then
                task.spawn(enableNotifier, child)
            end
        end)

        local fruit = workspace:FindFirstChild("Fruit ")
        if fruit then
            task.spawn(enableNotifier, fruit)
        end

        switch.Text = "Desativar Notificador"
        switch.BackgroundColor3 = Color3.fromRGB(76, 175, 80)
        playSound("rbxassetid://3997124966", 4)
        showText("Notificador ativado com sucesso", 2)
    end
end

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

-- Função para teleportar o jogador para uma posição específica
local function teleportPlayer(position)
    local character = local_player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:MoveTo(position)
            showText("Teleportando para (" .. position.X .. ", " .. position.Y .. ", " .. position.Z .. ")", 2)
        end
    end
end

-- Função para identificar todos os itens visíveis no jogo
local function espItems()
    local function isItemVisible(part)
        -- Implementação simplificada para detectar itens visíveis
        return part and part:IsA("Part") and part.Parent and part.Parent:IsA("Model") and part.Parent:IsDescendantOf(game.Workspace)
    end

    local function highlightItem(item)
        local highlight = Instance.new("SelectionBox")
        highlight.Parent = item
        highlight.Adornee = item
        highlight.LineThickness = 0.1
        highlight.Color3 = Color3.fromRGB(255, 255, 0)
    end

    for _, part in ipairs(workspace:GetDescendants()) do
        if isItemVisible(part) then
            highlightItem(part)
        end
    end
end

-- Função para pegar frutas dropadas automaticamente
local function autoPickupFruits()
    local fruitFolder = workspace:WaitForChild("Fruits")

    while workspace_connection do
        for _, fruit in ipairs(fruitFolder:GetChildren()) do
            if fruit:IsA("Model") then
                local fruitPosition = fruit.PrimaryPart.Position
                teleportPlayer(fruitPosition)
                wait(0.5)  -- Ajuste conforme necessário para evitar problemas de detecção
                game.ReplicatedStorage.Remotes.PickupFruit:FireServer(fruit)  -- Exemplo de chamada para coletar a fruta
            end
        end
        task.wait(1)
    end
end

-- Função para auto farm de boss
local function autoFarmBoss()
    -- Implemente a lógica para auto farm de boss aqui
    showText("Auto farm de Boss ativado", 2)
end

-- Função para auto farm baseado no status escolhido pelo usuário
local function autoFarmByStatus(status)
    -- Implemente a lógica para auto farm baseado no status aqui
    showText("Auto farm para status " .. status .. " ativado", 2)
end

-- Criação dos elementos visuais
local components = createAppInterface()

-- Conectar funcionalidades aos botões
components.notifier.MouseButton1Click:Connect(toggleNotifier)
components.teleport.MouseButton1Click:Connect(function()
    teleportPlayer(Vector3.new(0, 100, 0))  -- Posição de exemplo, ajuste conforme necessário
end)
components.autoFarmBoss.MouseButton1Click:Connect(autoFarmBoss)
components.autoFarmStatus.MouseButton1Click:Connect(function()
    -- Lógica para permitir que o usuário escolha o status desejado
    -- Exemplo: autoFarmByStatus("Health")
    autoFarmByStatus("Health")  -- Exemplo simples, ajuste conforme necessário
end)
components.esp.MouseButton1Click:Connect(function()
    espItems()
    showText("ESP ativado", 2)
end)

-- Texto de inicialização
showText("Interface inicializada com sucesso", 3)
