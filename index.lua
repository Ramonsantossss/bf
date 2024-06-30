--GUI
local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library.CreateLib("The Rake(Noob Edition)", "BloodTheme")
--MAIN
local Tab = Window:NewTab("Main")
local MainSection = Tab:NewSection("Main")
local Tab = Window:NewTab("Player")
local PlayerSection = Tab:NewSection("Player")
local Tab = Window:NewTab("TP")
local TPSection = Tab:NewSection("TP")
local Tab = Window:NewTab("ESP")
local ESPSection = Tab:NewSection("ESP")
local Tab = Window:NewTab("Scripts")
local ScriptsSection = Tab:NewSection("Scripts")
local Tab = Window:NewTab("Credits")
local CreditsSection = Tab:NewSection("Credits")
local Tab = Window:NewTab("Cool Players!")
local CoolSection = Tab:NewSection("Cool Players!")
--BUTTONS


MainSection:NewButton("Fullbright", "Lets you see in the dark", function()
    game.Lighting.DepthOfField:Destroy()
game.Lighting.Atmosphere:Destroy()
game.Lighting.AmbienceCC:Destroy()
game.Lighting.ScreamCC:Destroy()
game.Lighting.ListenModeColor:Destroy()
game.Lighting.HourCC:Destroy()
game.Lighting.PowerOutCC:Destroy()
pcall(function()
	local lighting = game:GetService("Lighting");
	lighting.Ambient = Color3.fromRGB(255, 255, 255);
	lighting.Brightness = 1;
	lighting.FogEnd = 1e10;
	for i, v in pairs(lighting:GetDescendants()) do
		if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") then
			v.Enabled = false;
		end;
	end;
	lighting.Changed:Connect(function()
		lighting.Ambient = Color3.fromRGB(255, 255, 255);
		lighting.Brightness = 1;
		lighting.FogEnd = 1e10;
	end);
	spawn(function()
		local character = game:GetService("Players").LocalPlayer.Character;
		while wait() do
			repeat wait() until character ~= nil;
			if not character.HumanoidRootPart:FindFirstChildWhichIsA("PointLight") then
				local headlight = Instance.new("PointLight", character.HumanoidRootPart);
				headlight.Brightness = 1;
				headlight.Range = 60;
			end;
		end;
	end);
end)
end)
MainSection:NewButton("Remove Nature", "", function()
    game.Workspace.NatureFolder:Destroy()
end)
MainSection:NewButton("Rejoin", "", function()
    local ts = game:GetService("TeleportService")

local p = game:GetService("Players").LocalPlayer

 

ts:Teleport(game.PlaceId, p)
end)
TPSection:NewButton("DestroyedCabin", "Tp to DestroyedCabin", function()
local p1 = game.Players.LocalPlayer.Character.HumanoidRootPart
local object = "Part"
local pos = p1.CFrame

p1.CFrame = game.Workspace.LocationsFolder.DestroyedCabin.Construction.Bed.Part.CFrame
end)
TPSection:NewButton("DestroyedShelter", "Tp to DestroyedShelter", function()
 local p1 = game.Players.LocalPlayer.Character.HumanoidRootPart
local object = "Part"
local pos = p1.CFrame

p1.CFrame = game.Workspace.LocationsFolder.DestroyedShelter.Decoracion.Bed.Part.CFrame
end)
TPSection:NewButton("Shop", "Tp to Shop", function()
    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
local location = CFrame.new(-253.981964, 8.093853, -392.950012, -0.999795258, -3.12114139e-08, 0.0202340689, -3.07606491e-08, 1, 2.25887469e-08, -0.0202340689, 2.19617089e-08, -0.999795258)
local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
wait(0.1)
pl.CFrame = location
end)
TPSection:NewButton("RakeOof House", "Tp to RakeOof House", function()
    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
local location = CFrame.new(-843.935974, -1.55992174, 165.878235, 0.999508739, -3.64192387e-09, 0.0313417725, 2.16606155e-09, 1, 4.71232582e-08, -0.0313417725, -4.70322199e-08, 0.999508739)
local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
wait(0.1)
pl.CFrame = location
end)
TPSection:NewButton("SadBlock", "Tp to SadBlock ;(", function()
    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
local location = CFrame.new(568.181763, 10.9999981, 390.835785, 0.999808252, 9.59620152e-08, 0.0195831619, -9.68965779e-08, 1, 4.67738914e-08, -0.0195831619, -4.86624607e-08, 0.999808252)
local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
wait(0.1)
pl.CFrame = location
end)
TPSection:NewButton("Rejitasxd", "Tp to Rejitasxd", function()
    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
local location = CFrame.new(-107.494858, -4.05769253, -247.977997, -0.981930494, 6.72275302e-09, -0.189241782, -1.78789139e-09, 1, 4.48016166e-08, 0.189241782, 4.43304202e-08, -0.981930494)
local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
wait(0.1)
pl.CFrame = location
end)
TPSection:NewButton("Rejitasxd2", "Tp to Rejitasxd2", function()
    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
local location = CFrame.new(238.670685, 8.99999619, -122.169525, -0.903256536, -1.578689e-08, 0.429100901, -2.34997732e-09, 1, 3.18439284e-08, -0.429100901, 2.7754858e-08, -0.903256536)
local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
wait(0.1)
pl.CFrame = location
end)
TPSection:NewButton("GamingNoob", "Tp to GamingNoob", function()
    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
local location = CFrame.new(-359.962372, -9.42180061, 320.414246, -0.657717109, 4.02670857e-08, 0.753265023, -3.51445228e-09, 1, -5.65253906e-08, -0.753265023, -3.98250322e-08, -0.657717109)
local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
wait(0.1)
pl.CFrame = location
end)
TPSection:NewButton("SlenderPlace(USE FLY!)", "Tp to SlenderPlace", function()
    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
local location = CFrame.new(529.88678, 89.6461029, 396.658356, -0.553372085, 0.134796694, -0.821954489, -0, 0.986818075, 0.16183354, 0.832934201, 0.0895541608, -0.546077549)
local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
wait(0.1)
pl.CFrame = location
end)
TPSection:NewButton(" ", "Tp to  ", function()
    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
local location = CFrame.new(-363.899017, 8.72527885, -430.03595, 0.0367275402, -1.87673965e-08, -0.999325335, -4.82864929e-11, 1, -1.87818419e-08, 0.999325335, 7.3806472e-10, 0.0367275402)
local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
wait(0.1)
pl.CFrame = location
end)
TPSection:NewButton("PlayerStartMenuHouse", "Tp to PlayerStartMenuHouse", function()
    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
local location = CFrame.new(-740.746582, 25.803772, -153.408463, -0.0224491563, -1.61586358e-14, 0.999747992, -1.02112857e-07, 1, -2.2929092e-09, -0.999747992, -1.02138593e-07, -0.0224491563)
local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
wait(0.1)
pl.CFrame = location
end)
TPSection:NewButton("PowerStation", "Tp to PowerStation", function()
 local p1 = game.Players.LocalPlayer.Character.HumanoidRootPart
local object = "Part"
local pos = p1.CFrame

p1.CFrame = game.Workspace.LocationsFolder.PowerStation.ControlButtons.Buttons.InteractPart.CFrame
end)
TPSection:NewButton("SurvivorsSafeHouse", "Tp to SurvivorsSafeHoused", function()
 local p1 = game.Players.LocalPlayer.Character.HumanoidRootPart
local object = "Part"
local pos = p1.CFrame

p1.CFrame = game.Workspace.LocationsFolder.SurvivorsSafeHouse.Construction.Bed.InvWedge.CFrame
end)
TPSection:NewButton("ParkSafeHouse", "Tp to ParkSafeHouse", function()
 local p1 = game.Players.LocalPlayer.Character.HumanoidRootPart
local object = "Part"
local pos = p1.CFrame

p1.CFrame = game.Workspace.LocationsFolder.ParkSafeHouse.Construction.Bed.InvWedge.CFrame
end)
TPSection:NewButton("SupplyDrop", "Tp to SupplyDrop", function()
local p1 = game.Players.LocalPlayer.Character.HumanoidRootPart
local object = "Part"
local pos = p1.CFrame

p1.CFrame = game.Workspace.SupplyDrop.Model2.ClickPartOpen.CFrame
end)
PlayerSection:NewButton("Remove FallDamage", "You won't die when you fall from a great height", function()
    for i, player in pairs(game.Players:GetChildren()) do   wait()   game.Workspace[player.Name].FallDamage:Destroy() end
end)
PlayerSection:NewButton("Fly (Press B)", "You can fly!", function()
    local Speed = 60


if not RootAnchorBypassed then
    getgenv().RootAnchorBypassed = true
    local Player = game:GetService("Players").LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Root = Character:FindFirstChild("HumanoidRootPart")
    Player.CharacterAdded:Connect(function(C)
        Root = C:WaitForChild("HumanoidRootPart")
        wait(0.5)
        for _, C in pairs(getconnections(Root:GetPropertyChangedSignal("Anchored"))) do C:Disable() end
    end)
    
    local GameMT = getrawmetatable(game)
    local __oldindex = GameMT.__index
    setreadonly(GameMT, false)
    GameMT.__index = newcclosure(function(self, Key)
        if self == Root and Key == "Anchored" then return false end
        return __oldindex(self, Key)
    end)
    setreadonly(GameMT, true)
end

local UIS = game:GetService("UserInputService")
local OnRender = game:GetService("RunService").RenderStepped

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

local Camera = workspace.CurrentCamera
local Root = Character:WaitForChild("HumanoidRootPart")

local C1, C2, C3;
local Nav = {Flying = false, Forward = false, Backward = false, Left = false, Right = false}
C1 = UIS.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.Keyboard then
        if Input.KeyCode == Enum.KeyCode.B then --here you can change the letter
            Nav.Flying = not Nav.Flying
            Root.Anchored = Nav.Flying
        elseif Input.KeyCode == Enum.KeyCode.W then
            Nav.Forward = true
        elseif Input.KeyCode == Enum.KeyCode.S then
            Nav.Backward = true
        elseif Input.KeyCode == Enum.KeyCode.A then
            Nav.Left = true
        elseif Input.KeyCode == Enum.KeyCode.D then
            Nav.Right = true
        end
    end
end)

C2 = UIS.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.Keyboard then
        if Input.KeyCode == Enum.KeyCode.W then
            Nav.Forward = false
        elseif Input.KeyCode == Enum.KeyCode.S then
            Nav.Backward = false
        elseif Input.KeyCode == Enum.KeyCode.A then
            Nav.Left = false
        elseif Input.KeyCode == Enum.KeyCode.D then
            Nav.Right = false
        end
    end
end)

C3 = Camera:GetPropertyChangedSignal("CFrame"):Connect(function()
    if Nav.Flying then
        Root.CFrame = CFrame.new(Root.CFrame.Position, Root.CFrame.Position + Camera.CFrame.LookVector)
    end
end)

while true do -- not EndAll
    local Delta = OnRender:Wait()
    if Nav.Flying then
        if Nav.Forward then
            Root.CFrame = Root.CFrame + (Camera.CFrame.LookVector * (Delta * Speed))
        end
        if Nav.Backward then
            Root.CFrame = Root.CFrame + (-Camera.CFrame.LookVector * (Delta * Speed))
        end
        if Nav.Left then
            Root.CFrame = Root.CFrame + (-Camera.CFrame.RightVector * (Delta * Speed))
        end
        if Nav.Right then
            Root.CFrame = Root.CFrame + (Camera.CFrame.RightVector * (Delta * Speed))
        end
    end
end

--[[C1:Disconnect()
C2:Disconnect()
C3:Disconnect()
if Nav.Flying then
    Root.Anchored = false
end]]
end)
PlayerSection:NewSlider("OPRun", "You can run faster!", 250, 34, function(s)
    game.Players.LocalPlayer.Character.CharValues.RunSpeed.Value = s
end)
PlayerSection:NewButton("Inf Stamina", "You can run forever", function()
local setreadonly = setreadonly or make_writeable
local pussymode = game.workspace[game.Players.LocalPlayer.Name].CharValues.StaminaPercentValue
local mt = getrawmetatable(game)
local old = mt.__index
setreadonly(mt, false)
mt.__index = newcclosure(function(tbl, idx)
if idx == "Value" and tbl == pussymode then
return 100
end
return old(tbl, idx)
end)
setreadonly(mt, true)
end)
PlayerSection:NewButton("Reload Stamina", "You can reload your stamina", function()
    for i, player in pairs(game.Players:GetChildren()) do   wait()   game.Workspace[player.Name]['CharValues'].StaminaPercentValue.Value = 10000 end
end)
PlayerSection:NewButton("Remove Barreras", "If you touch Barreras twice you will be kicked", function()
    game.Workspace.MapTopPart:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()
    game.Workspace.Barreras.Barreras:Destroy()   
game.Workspace.Barreras.Barreras:Destroy()
game.Workspace.Barreras.Barreras:Destroy()
game.Workspace.Barreras.Barreras:Destroy()
game.Workspace.Barreras.Barreras:Destroy()
game.Workspace.Barreras.Barreras:Destroy()
game.Workspace.Barreras.Barreras:Destroy()
end)
PlayerSection:NewButton("Remove PowerDamage", "If you touch electric pasts then you will not take damage", function()
    game.Workspace.LocationsFolder.PowerStation.PowerDamage:Destroy()
end)
PlayerSection:NewButton("Remove Crawling", "You won't lie down when you're low on hp", function()
    game.Players.LocalPlayer.Character.CharValues.Crawling:Destroy()
end)
PlayerSection:NewButton("Remove Unnecessary Gui", "Get out gui chase, bloody night and more", function()
    game.Players.LocalPlayer.PlayerGui.HoursGui:Destroy()
    game.Players.LocalPlayer.PlayerGui.PowerGui:Destroy()
    game.Players.LocalPlayer.PlayerGui.DeadGui:Destroy()
    game.Players.LocalPlayer.PlayerGui.RakeChaseGui:Destroy()
end)
ESPSection:NewButton("The Rake", "You can see the rake in the distance", function()
    for i,v in pairs(game.Workspace:GetDescendants()) do
			if v.Parent.Name == 'The_Rake' then
	
				local BillboardGui = Instance.new('BillboardGui') -- Makes Billboardgui
				local TextLabel = Instance.new('TextLabel') -- makes text label
	
				BillboardGui.Parent = v.Parent -- what the billboardgui goes into
				BillboardGui.AlwaysOnTop = true -- if its on top or not
				BillboardGui.Size = UDim2.new(0, 50, 0, 50) -- size of it
				BillboardGui.StudsOffset = Vector3.new(0,2,0)
				BillboardGui.MaxDistance = 100000
	
				TextLabel.Parent = BillboardGui -- putting textlabel into billboardgui
				TextLabel.BackgroundTransparency = 1 -- transparency
				TextLabel.Size = UDim2.new(2, 5, 2, 5) -- size
				TextLabel.Text = "The Rake" -- what the label says
				TextLabel.TextColor3 = Color3.new(225, 0, 0) -- color
				TextLabel.TextScaled = false -- if the text is scaled or not
	
			end
		end
	
end)
ESPSection:NewButton("FlareGun(Ones time)", "You can see FlareGun in the distance", function()
    for i,v in pairs(game.Workspace:GetDescendants()) do
if v.ClassName == "TouchTransmitter" and v.Parent.Name == "Handle" then -- i am just wondering that the part u wanna esp have these properties u can change them if it doesnt work
local BillboardGui = Instance.new("BillboardGui")
local TextLabel = Instance.new("TextLabel")

BillboardGui.Parent = v.Parent
BillboardGui.AlwaysOnTop = true
BillboardGui.LightInfluence = 1
BillboardGui.Size = UDim2.new(0, 50, 0, 50)
BillboardGui.StudsOffset = Vector3.new(0, 2, 0)

TextLabel.Parent = BillboardGui
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Text = "FlareGun"
TextLabel.TextColor3 = Color3.new(1, 0, 0)
TextLabel.TextScaled = true
end
end
end)

PlayerSection:NewButton("Cheese", "Free cheese!", function()
local A_1 = "\99\104\101\101\115\101"
local Event = game:GetService("Players").LocalPlayer.PlayerGui.CodeGui.SendTextBoxRE
Event:FireServer(A_1)

end)
PlayerSection:NewButton("BloxyCola", "Free bloxycola!", function()
local A_1 = "\99\111\100\101"
local Event = game:GetService("Players").LocalPlayer.PlayerGui.CodeGui.SendTextBoxRE
Event:FireServer(A_1)
wait(4.50)
game.Players.LocalPlayer.PlayerGui.CodeGui.CodeFrame.Visible = false
end)
TPSection:NewButton("FlareGun", "Tp to FlareGun", function()
local p1 = game.Players.LocalPlayer.Character.HumanoidRootPart
local object = "FlareGun"
local pos = p1.CFrame

p1.CFrame = game.Workspace.FlareGun.Handle.CFrame

wait(0.1)

p1.CFrame = pos
end)
TPSection:NewButton("HighScrap", "Tp to HighScrap", function()
    

for _, obj in pairs(game.Workspace.StuffGiversFolder.ScrapMetals:GetChildren()) do
if obj.Name == "HighScrapMetal" then
if obj.Part.Transparency == 0 then
wait(0.1)

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = obj.Part.CFrame

end
end
end 
end)

TPSection:NewButton("NormalScrap", "Tp to NormalScrap", function()
for _, obj in pairs(game.Workspace.StuffGiversFolder.ScrapMetals:GetChildren()) do
if obj.Name == "NormalScrapMetal" then
if obj.Part.Transparency == 0 then
wait(0.1)

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = obj.Part.CFrame

end
end
end 
end)

TPSection:NewButton("LowScrap", "Tp to LowScrap", function()
for _, obj in pairs(game.Workspace.StuffGiversFolder.ScrapMetals:GetChildren()) do
if obj.Name == "LowScrapMetal" then
if obj.Part.Transparency == 0 then
wait(0.1)

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = obj.Part.CFrame

end
end
end 
end)

MainSection:NewButton("ServerHop", "", function()
--[[
IronBrew:tm: obfuscation; Version 2.7.2
]]
return(function(OVERPOWER_h,OVERPOWER_a,OVERPOWER_p)local OVERPOWER_k=string.char;local OVERPOWER_e=string.sub;local OVERPOWER_o=table.concat;local OVERPOWER_n=math.ldexp;local OVERPOWER_s=getfenv or function()return _ENV end;local OVERPOWER_q=select;local OVERPOWER_f=unpack or table.unpack;local OVERPOWER_i=tonumber;local function OVERPOWER_l(OVERPOWER_h)local OVERPOWER_b,OVERPOWER_c,OVERPOWER_f="","",{}local OVERPOWER_d=256;local OVERPOWER_g={}for OVERPOWER_a=0,OVERPOWER_d-1 do OVERPOWER_g[OVERPOWER_a]=OVERPOWER_k(OVERPOWER_a)end;local OVERPOWER_a=1;local function OVERPOWER_j()local OVERPOWER_b=OVERPOWER_i(OVERPOWER_e(OVERPOWER_h,OVERPOWER_a,OVERPOWER_a),36)OVERPOWER_a=OVERPOWER_a+1;local OVERPOWER_c=OVERPOWER_i(OVERPOWER_e(OVERPOWER_h,OVERPOWER_a,OVERPOWER_a+OVERPOWER_b-1),36)OVERPOWER_a=OVERPOWER_a+OVERPOWER_b;return OVERPOWER_c end;OVERPOWER_b=OVERPOWER_k(OVERPOWER_j())OVERPOWER_f[1]=OVERPOWER_b;while OVERPOWER_a<#OVERPOWER_h do local OVERPOWER_a=OVERPOWER_j()if OVERPOWER_g[OVERPOWER_a]then OVERPOWER_c=OVERPOWER_g[OVERPOWER_a]else OVERPOWER_c=OVERPOWER_b..OVERPOWER_e(OVERPOWER_b,1,1)end;OVERPOWER_g[OVERPOWER_d]=OVERPOWER_b..OVERPOWER_e(OVERPOWER_c,1,1)OVERPOWER_f[#OVERPOWER_f+1],OVERPOWER_b,OVERPOWER_d=OVERPOWER_c,OVERPOWER_c,OVERPOWER_d+1 end;return table.concat(OVERPOWER_f)end;local OVERPOWER_j=OVERPOWER_l('1Y1W2751X2102751W22F21T22122C1X21127922821V21T2242241W21827921E1E2791X2791W1F27S1W27421221Q2792171W27T27521021528228427Y1G27U27P27R27T27427521227O27427T28M2751028D27921R28A28L28628Q1W28728D28521427X27528H1W27G27627827521Z21T22521X1X21627922V21X22C23721X22A22E22121V29D28327522W22C22C2282