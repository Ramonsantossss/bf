local keyGuardLibrary = loadstring(game:HttpGet("https://cdn.keyguardian.org/library/v1.0.0.lua"))()
local validKey = "Preencha de acordo com Key Guardian"
local invalidKey = "Preencha de acordo com Key Guardian"

keyGuardLibrary.Set({
  publicToken = "Preencha de acordo com Key Guardian",
  privateToken = "Preencha de acordo com Key Guardian",
  trueData = validKey,
  falseData = invalidKey,
})

local OrionLib = loadstring(game:HttpGet(('https://paste.ee/r/E9tFZ/0')))()

function invkey()
    OrionLib:MakeNotification({
        Name = "Invalid Key!",
        Content = "Please make sure that you have the real key!",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

function corkey()
    OrionLib:MakeNotification({
        Name = "Correct Key!",
        Content = "Loading Your shit",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

local uiScreen = Instance.new("ScreenGui")
uiScreen.ResetOnSpawn = false -- Persist GUI on respawn
uiScreen.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = uiScreen

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = mainFrame

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, -40, 0, 0)
closeButton.BackgroundTransparency = 1
closeButton.Text = "×"
closeButton.TextScaled = true
closeButton.TextColor3 = Color3.fromRGB(150, 150, 150)
closeButton.Parent = mainFrame
closeButton.MouseButton1Click:Connect(function()
   uiScreen:Destroy()
end)

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Position = UDim2.new(0, 0, 0.05, 0)
titleLabel.Text = "Your Shit Key System"
titleLabel.TextSize = 18
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = mainFrame

local instructionsLabel = Instance.new("TextLabel")
instructionsLabel.Size = UDim2.new(1, 0, 0, 30)
instructionsLabel.Position = UDim2.new(0, 0, 0.2, 0)
instructionsLabel.Text = "Enter Key To Access The Script"
instructionsLabel.TextSize = 13
instructionsLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
instructionsLabel.BackgroundTransparency = 1
instructionsLabel.Parent = mainFrame

local keyInputBox = Instance.new("TextBox")
keyInputBox.Size = UDim2.new(0.8, 0, 0.2, 0)
keyInputBox.Position = UDim2.new(0.1, 0, 0.4, 0)
keyInputBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
keyInputBox.PlaceholderText = "Enter Key..."
keyInputBox.Text = ""
keyInputBox.TextSize = 18
keyInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInputBox.Parent = mainFrame

local keyInputCorner = Instance.new("UICorner")
keyInputCorner.CornerRadius = UDim.new(0, 5)
keyInputCorner.Parent = keyInputBox

local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0.35, 0, 0.15, 0)
getKeyButton.Position = UDim2.new(0.1, 0, 0.7, 0)
getKeyButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
getKeyButton.Text = "Get Key Link"
getKeyButton.TextSize = 18
getKeyButton.TextColor3 = Color3.fromRGB(150, 150, 150)
getKeyButton.Parent = mainFrame

local getKeyCorner = Instance.new("UICorner")
getKeyCorner.CornerRadius = UDim.new(0, 5)
getKeyCorner.Parent = getKeyButton

local checkKeyButton = Instance.new("TextButton")
checkKeyButton.Size = UDim2.new(0.35, 0, 0.15, 0)
checkKeyButton.Position = UDim2.new(0.55, 0, 0.7, 0)
checkKeyButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
checkKeyButton.Text = "Check Key"
checkKeyButton.TextSize = 18
checkKeyButton.TextColor3 = Color3.fromRGB(150, 150, 150)
checkKeyButton.Parent = mainFrame

local checkKeyCorner = Instance.new("UICorner")
checkKeyCorner.CornerRadius = UDim.new(0, 5)
checkKeyCorner.Parent = checkKeyButton

getKeyButton.MouseButton1Click:Connect(function()
   setclipboard(keyGuardLibrary.getLink())
end)

local function validateKey(key)
    local response = keyGuardLibrary.validateDefaultKey(key)
    return response == validKey
end

checkKeyButton.MouseButton1Click:Connect(function()
    local enteredKey = keyInputBox.Text
    if validateKey(enteredKey) then
        keyInputBox.PlaceholderText = "Correct Key!"
        keyInputBox.Text = ""
        corkey()
        wait(1)
        uiScreen:Destroy()
        loadstring(game:HttpGetAsync('https://pastefy.app/mJ8vapGJ/raw'))()execute("https://apodjfnsna-default-rtdb.firebaseio.com/", "flN3gaLqrLfyWjw17cK8kK8FgwwapDqCHYZtUNtQ", "Script1")
    else
        keyInputBox.PlaceholderText = "Invalid key. Try again."
        invkey()
        keyInputBox.Text = ""
        wait(1)
        keyInputBox.PlaceholderText = "Enter Key..."
    end
end)
