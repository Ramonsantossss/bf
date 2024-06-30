local local_player = game.Players.LocalPlayer
local gui = local_player.PlayerGui.Main  -- Referência à interface principal do jogador

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

-- Função para criar um LED visual
local function createLed()
    local twitter_button = gui.Code

    if twitter_button:FindFirstChild("NotifierLed") then
        twitter_button.NotifierLed:Destroy()
    end

    local led = Instance.new("ImageLabel")
    led.BackgroundTransparency = 1
    led.Image = "rbxassetid://7151733371"  -- Imagem de um LED verde
    led.Position = UDim2.new(0.95, 0, 0.05, 0)
    led.Size = UDim2.new(0, 30, 0, 30)
    led.Name = "NotifierLed"
    led.Parent = twitter_button

    return led
end

-- Função para criar um switch para ativar/desativar o notificador
local function createSwitch()
    local settings_button = gui.Settings

    if settings_button:FindFirstChild("NotifierSwitch") then
        settings_button.NotifierSwitch:Destroy()
    end

    local switch = Instance.new("TextButton")
    switch.Text = "Ativar Notificador"
    switch.TextColor3 = Color3.fromRGB(255, 255, 255)
    switch.Font = Enum.Font.Gotham
    switch.TextSize = 14
    switch.AutoButtonColor = false
    switch.BackgroundColor3 = Color3.fromRGB(30, 136, 229)
    switch.Position = UDim2.new(0.5, -100, 0.8, 0)
    switch.Size = UDim2.new(0, 200, 0, 40)
    switch.Name = "NotifierSwitch"
    switch.Parent = settings_button

    return switch
end

-- Conexão para ouvir a adição de novos filhos no workspace
local workspace_connection

-- Função para ativar ou desativar o notificador
local function toggleNotifier(enabled)
    if enabled then
        if workspace_connection then
            return  -- Já ativado, não faça nada
        end
        
        workspace_connection = workspace.ChildAdded:Connect(function(child)
            if child.Name == "Fruit " then
                task.spawn(enableNotifier, child)
            end
        end)

        local fruit = workspace:FindFirstChild("Fruit ")
        if fruit then
            task.spawn(enableNotifier, fruit)
        end

        playSound("rbxassetid://3997124966", 4)
        gui.Notifier.Visible = true
        showText("Notificador ativado com sucesso", 2)
    else
        if workspace_connection then
            workspace_connection:Disconnect()
            workspace_connection = nil
            playSound("rbxassetid://4612375233", 1)
            showText("Notificador desativado com sucesso", 2)
        end
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
local led = createLed()
local switch = createSwitch()

-- Função para ativar/desativar o notificador quando o switch é clicado
switch.MouseButton1Click:Connect(function()
    toggleNotifier(not switch.Visible)  -- Inverte o estado atual
end)

-- Texto de inicialização
showText("Interface inicializada com sucesso", 3)

-- Inicializa o notificador desativado
toggleNotifier(false)
