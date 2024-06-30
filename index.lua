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
    mainFrame.Size = UDim2.new(0, 400, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
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
    teleButton.Position = UDim2.new(0.5, -100, 0.15, 0)
    teleButton.Size = UDim2.new(0, 200, 0, 40)
    teleButton.Name = "TeleportButton"

    local bossDropdown = Instance.new("TextButton", mainFrame)
    bossDropdown.Text = "Escolher Boss"
    bossDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
    bossDropdown.Font = Enum.Font.Gotham
    bossDropdown.TextSize = 16
    bossDropdown.AutoButtonColor = false
    bossDropdown.BackgroundColor3 = Color3.fromRGB(33, 150, 243)
    bossDropdown.Position = UDim2.new(0.5, -100, 0.3, 0)
    bossDropdown.Size = UDim2.new(0, 200, 0, 40)
    bossDropdown.Name = "BossDropdown"

    local meleeButton = Instance.new("TextButton", mainFrame)
    meleeButton.Text = "Auto Melee"
    meleeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    meleeButton.Font = Enum.Font.Gotham
    meleeButton.TextSize = 16
    meleeButton.AutoButtonColor = false
    meleeButton.BackgroundColor3 = Color3.fromRGB(33, 150, 243)
    meleeButton.Position = UDim2.new(0.5, -100, 0.45, 0)
    meleeButton.Size = UDim2.new(0, 200, 0, 40)
    meleeButton.Name = "MeleeButton"

    local gunButton = Instance.new("TextButton", mainFrame)
    gunButton.Text = "Auto Gun"
    gunButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    gunButton.Font = Enum.Font.Gotham
    gunButton.TextSize = 16
    gunButton.AutoButtonColor = false
    gunButton.BackgroundColor3 = Color3.fromRGB(33, 150, 243)
    gunButton.Position = UDim2.new(0.5, -100, 0.6, 0)
    gunButton.Size = UDim2.new(0, 200, 0, 40)
    gunButton.Name = "GunButton"

    local fruitButton = Instance.new("TextButton", mainFrame)
    fruitButton.Text = "Auto Blox Fruit"
    fruitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    fruitButton.Font = Enum.Font.Gotham
    fruitButton.TextSize = 16
    fruitButton.AutoButtonColor = false
    fruitButton.BackgroundColor3 = Color3.fromRGB(33, 150, 243)
    fruitButton.Position = UDim2.new(0.5, -100, 0.75, 0)
    fruitButton.Size = UDim2.new(0, 200, 0, 40)
    fruitButton.Name = "FruitButton"

    local switch = Instance.new("TextButton", mainFrame)
    switch.Text = "Ativar Notificador"
    switch.TextColor3 = Color3.fromRGB(255, 255, 255)
    switch.Font = Enum.Font.Gotham
    switch.TextSize = 16
    switch.AutoButtonColor = false
    switch.BackgroundColor3 = Color3.fromRGB(33, 150, 243)
    switch.Position = UDim2.new(0.5, -100, 0.9, 0)
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
    minimizedImage.Image = "https://telegra.ph/file/8157fc22ad0d927321df7.jpg" -- A imagem que você forneceu
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
        bossDropdown = bossDropdown,
        melee = meleeButton,
        gun = gunButton,
        bloxFruit = fruitButton,
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

-- Função para escolher um boss
local function chooseBoss(bossName)
    showText("Boss escolhido: " .. bossName, 2)
    -- Implemente a lógica para lidar com o boss escolhido aqui
end

-- Função para iniciar o auto farm de boss
local function autoFarmBoss()
    -- Implemente a lógica para auto farm de boss aqui
    showText("Auto farm de Boss ativado", 2)
end

-- Função para iniciar o auto farm com base no tipo de arma melee
local function autoMelee()
    -- Implemente a lógica para auto farm com melee aqui
    showText("Auto melee ativado", 2)
end

-- Função para iniciar o auto farm com base no tipo de arma gun
local function autoGun()
    -- Implemente a lógica para auto farm com gun aqui
    showText("Auto gun ativado", 2)
end

-- Função para iniciar o auto farm com base no uso de blox fruit
local function autoBloxFruit()
    -- Implemente a lógica para auto farm com blox fruit aqui
    showText("Auto blox fruit ativado", 2)
end

-- Criação dos elementos visuais e funcionalidades
local components = createAppInterface()

-- Conectar funcionalidades aos botões
components.notifier.MouseButton1Click:Connect(toggleNotifier)
components.teleport.MouseButton1Click:Connect(function()
    teleportPlayer(Vector3.new(0, 100, 0))  -- Posição de exemplo, ajuste conforme necessário
end)
components.bossDropdown.MouseButton1Click:Connect(function()
    -- Lógica para permitir que o usuário escolha o boss desejado
    local selectedBoss = "Boss A"  -- Exemplo, substitua com a lógica real de escolha
    chooseBoss(selectedBoss)
end)
components.melee.MouseButton1Click:Connect(autoMelee)
components.gun.MouseButton1Click:Connect(autoGun)
components.bloxFruit.MouseButton1Click:Connect(autoBloxFruit)
components.esp.MouseButton1Click:Connect(function()
    espItems()
    showText("ESP ativado", 2)
end)

-- Texto de inicialização
showText("Interface inicializada com sucesso", 3)
