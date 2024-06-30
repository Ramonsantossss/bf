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
    screenGui.Name = "NotifierApp"

    local mainFrame = Instance.new("Frame", screenGui)
    mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    mainFrame.Size = UDim2.new(0, 300, 0, 200)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
    mainFrame.Active = true
    mainFrame.Draggable = true

    local header = Instance.new("Frame", mainFrame)
    header.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    header.Size = UDim2.new(1, 0, 0, 30)
    header.Position = UDim2.new(0, 0, 0, 0)
    header.Active = true
    header.Draggable = true

    local titleLabel = Instance.new("TextLabel", header)
    titleLabel.Text = "Notifier App"
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
    closeButton.Size = UDim2.new(0, 30, 1, 0)
    closeButton.Position = UDim2.new(1, -30, 0, 0)

    local minimizeButton = Instance.new("TextButton", header)
    minimizeButton.Text = "-"
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.Font = Enum.Font.GothamBold
    minimizeButton.TextSize = 18
    minimizeButton.BackgroundTransparency = 1
    minimizeButton.Size = UDim2.new(0, 30, 1, 0)
    minimizeButton.Position = UDim2.new(1, -60, 0, 0)

    local switch = Instance.new("TextButton", mainFrame)
    switch.Text = "Ativar Notificador"
    switch.TextColor3 = Color3.fromRGB(255, 255, 255)
    switch.Font = Enum.Font.Gotham
    switch.TextSize = 16
    switch.AutoButtonColor = false
    switch.BackgroundColor3 = Color3.fromRGB(30, 136, 229)
    switch.Position = UDim2.new(0.5, -100, 0.6, 0)
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

    return switch
end

-- Conexão para ouvir a adição de novos filhos no workspace
local workspace_connection

-- Função para ativar ou desativar o notificador
local function toggleNotifier()
    if workspace_connection then
        workspace_connection:Disconnect()
        workspace_connection = nil
        switch.Text = "Ativar Notificador"
        switch.BackgroundColor3 = Color3.fromRGB(30, 136, 229)
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

-- Criação dos elementos visuais
local switch = createAppInterface()

-- Função para ativar/desativar o notificador quando o switch é clicado
switch.MouseButton1Click:Connect(toggleNotifier)

-- Texto de inicialização
showText("Interface inicializada com sucesso", 3)
