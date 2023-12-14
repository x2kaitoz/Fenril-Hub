local FenrilHub_BladeBalls = {}
function FenrilHub_BladeBalls:RUN()
	repeat task.wait() warn("FENRIL HUB BLADE BALLS LOADED ... !") until game:IsLoaded() 

	if game:IsLoaded() then
		local UserInputService = game:GetService("UserInputService")
		local TweenService = game:GetService("TweenService")
		local LocalPlayer = game:GetService("Players").LocalPlayer
		
		local UILibrary = Instance.new("ScreenGui")
		local Load = Instance.new("Frame")
		local LoadButton = Instance.new("ImageButton")
		
		UILibrary.Name = "UILibrary"
		UILibrary.Parent = game:GetService("CoreGui")
		UILibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		
		Load.Name = "Load"
		Load.Parent = UILibrary
		Load.Active = true
		Load.AnchorPoint = Vector2.new(0.5, 0.5)
		Load.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		Load.BackgroundTransparency = 1
		Load.BorderSizePixel = 0
		Load.BackgroundTransparency = 1
		
		local uitoggled = false
		UserInputService.InputBegan:Connect(function(io, p)
			if io.KeyCode == Enum.KeyCode.RightControl then
				if uitoggled == false then
					uitoggled = true
					UILibrary.Enabled = false
				else
					UILibrary.Enabled = true
					uitoggled = false
				end
			end
		end)
		
		local Blur = Instance.new("BlurEffect")
		
		Blur.Size = 0
		Blur.Parent = game.Lighting
		
		if game.Workspace.Camera.FieldOfView == 50 then
			return game.Workspace.Camera.FieldOfView == 70
		end
		
		local LoadText = Instance.new("Frame")
		local UIListLayoutLoadText = Instance.new("UIListLayout")
		local TitleLoad = Instance.new("TextLabel")
		
		LoadText.Name = "LoadText"
		LoadText.Parent = Load
		LoadText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LoadText.BackgroundTransparency = 1.000
		LoadText.Size = UDim2.new(0, 500, 0, 50)
		LoadText.ClipsDescendants = true
		
		UIListLayoutLoadText.Name = "UIListLayoutLoadText"
		UIListLayoutLoadText.Parent = LoadText
		UIListLayoutLoadText.FillDirection = Enum.FillDirection.Horizontal
		UIListLayoutLoadText.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayoutLoadText.SortOrder = Enum.SortOrder.LayoutOrder
		
		function LoadFunction()
			print("Starts Scripr Premium.")
			TweenService:Create(game.Workspace.Camera,TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),{FieldOfView = 50}):Play()
		
			TweenService:Create(Blur,TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),{Size = 20}):Play()
		
			TweenService:Create(Load,TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),{Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
		
			TweenService:Create(Load,TweenInfo.new(.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),{BackgroundTransparency = 0}):Play()
		
			wait(.5)
			TweenService:Create(LoadButton,TweenInfo.new(.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),{ImageTransparency = 0}):Play()
		
			LoadButton.MouseEnter:Connect(function()
				TweenService:Create(LoadButton,TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),{Size = UDim2.new(0, 80, 0, 80)}):Play()
			end)
		
			LoadButton.MouseLeave:Connect(function()
				TweenService:Create(LoadButton,TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),{Size = UDim2.new(0, 70, 0, 70)}):Play()
			end)
		
			local LoadFocus = false
			print("Loading Interface .. !")
			if LoadFocus == false then
				LoadFocus = true
				TweenService:Create(LoadButton,TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),{Rotation = 180}):Play()
				TweenService:Create(LoadButton,TweenInfo.new(.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),{ImageTransparency = 1}):Play()
				wait(.5)
				LoadButton:Destroy()
		
				local Alphes = loadstring(game:HttpGet('https://alphes.net/Files/Notifier.lua'))()
				Alphes:Notifier("SCRIPT BLADE BALLS LOADED COMPLETE . . . ! ",2) wait(2.3)
				Alphes:Notifier("DEVELOPER : KAITO KUNG",2)
		
				wait(2)
				TweenService:Create(Load,TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),{Position = UDim2.new(0.5, 0, 0.025, 0)}):Play()
				TweenService:Create(Blur,TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),{Size = 0}):Play()
				TweenService:Create(game.Workspace.Camera,TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),{FieldOfView = 70}):Play()
			end
		end
		LoadFunction()
	end

    local GetService = function(serviceName) return game:GetService(serviceName) end
	local Workspace = game:GetService("Workspace")
    local Players = GetService("Players")
    local RunService = GetService("RunService")
    local UserInputService = GetService("UserInputService")
    local CoreGui = GetService("CoreGui")
    local StarterGui = GetService("StarterGui")
    local ReplicatedStorage = GetService("ReplicatedStorage")
    local VirtualInputManager = GetService("VirtualInputManager")
    local VirtualUser = GetService("VirtualUser")
    local TeleportService = GetService("TeleportService")

	local PlaceId = tostring(game.PlaceId)
    local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
	local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local HumanoidPlr = LocalPlayer.Character.Humanoid
	local PlayerGui = LocalPlayer.PlayerGui

    local Mouse = LocalPlayer:GetMouse()
    local Camera = workspace.CurrentCamera

	local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9)

	local Balls = workspace:WaitForChild("Balls", 9e9)
    local Parry_Balls 

    local FunctionTask = {}

	local function GetSubPrefix(G)
		G = tostring(G):gsub(" ", "")
		local E = ""
		if #G == 2 then
			local Z = string.sub(G, #G, #G + 1)
			E = Z == "1" and "st" or Z == "2" and "nd" or Z == "3" and "rd" or "th"
		end
		return E
	end

	local q = "%A, %B"
	local m = os.date(" %d", os.time())
	local s = ", %Y."
	q = os.date(q, os.time()) .. m .. GetSubPrefix() .. os.date(s, os.time())

	------------------------------------- [ Task: Esp ] -------------------------------------

	local Billboard_Property = {
		Name = "ESP_Billboard";
		Enabled = true;
		AlwaysOnTop = true;
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
		Active = true;
		LightInfluence = 1.000;
		Size = UDim2.new(0, 150, 0, 25);
		StudsOffset = Vector3.new(0, 2, 0);
	}
	local TexT_Property = {
		Name = "ESP_Billboard_Text";
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 1.000;
		Size = UDim2.new(0, 150, 0, 25);
		Font = Enum.Font.FredokaOne;
		RichText = true;
		Font = Enum.Font.Code;
		TextScaled = true;
		TextSize = 14.000;
		TextStrokeTransparency = 0;
		TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		TextWrapped = true;
	}
	local GetSelfDistance = function(Object)
		local Position = (typeof(Object) == "CFrame") and Object.Position or Object
		local RootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		return (RootPart.Position - Position).Magnitude
	end

	------------------------------------- [ Task: Ui Library ] -------------------------------------

	-- "iqEhfkBz"))() -- ui pc แบบเล็ก
	-- "3pkeb0HG"))() -- ui pc
	-- "jbKSsYdC"))() -- ui pc & mobile

	local UI = "https://pastebin.com/raw/"

    local Library = loadstring(game:HttpGet(UI.."jbKSsYdC"))()
	local ThemeManager = loadstring(game:HttpGet(UI.."nPMYS622"))()
	local SaveManager = loadstring(game:HttpGet(UI.."HLsN5erC"))()

	local Window = Library:CreateWindow({
		Title = 'Fenril Hub Premium Generations | '.. tostring(q),
		Center = true, 
		AutoShow = true,
	})
	local Tabs = {
		Main = Window:AddTab('General'),
		SettingsUi = Window:AddTab('Settings'),
	}

	------------------------------------- [ Task: Settings ] -------------------------------------

	_G.Settings = {
        ["- Enabled Auto Parry Balls"] = false;
		["EspPlayer"] = false;
	}
	local HttpService = game:GetService("HttpService")
	local playerName = LocalPlayer.Name
	local fileName = "FenrilHub_Blade Balls " .. playerName .. ".json"

	function loadcheck()
		if isfile(fileName) then
			return readfile(fileName)
		else
			local defaultSettings = HttpService:JSONEncode(_G.Settings)
			writefile(fileName, defaultSettings)
			return defaultSettings
		end
	end

	function LoadSetting()
		if isfile(fileName) then
			_G.Settings = HttpService:JSONDecode(readfile(fileName))
			return _G.Settings
		else
			return loadcheck()
		end
	end

	function saveSettings()
		if isfile(fileName) then
			writefile(fileName, HttpService:JSONEncode(_G.Settings))
			return writefile
		else
			return loadcheck()
		end
	end

	loadcheck()
	LoadSetting()
	
	
	local placeId = game.PlaceId

	if placeId == 13772394625 then
		BallsWorld = true
	else
		LocalPlayer:Kick("Invalid PlaceId.") wait(3)
		TeleportService:Teleport(placeId, LocalPlayer)
	end

	------------------------------------- [ Task: TabBox ] -------------------------------------
	local name = LocalPlayer.Name
	local Mains = Tabs.Main:AddLeftTabbox()
	local Ability = Tabs.Main:AddLeftTabbox()
	local Visuals = Tabs.Main:AddRightTabbox()

    ------------------------------------- [ Task: Section ] -------------------------------------
	local MainSection = Mains:AddTab('[ General ]')
	local Ability = Ability:AddTab('[ Ability ]')
	local VisualsSection = Visuals:AddTab('[ Visuals ]')


    local MenuGroup = Tabs.SettingsUi:AddLeftGroupbox('		    [ Menu ]')
	local MenuConfig = Tabs.SettingsUi:AddRightGroupbox('		    [ Config ]')
	local Service = Tabs.SettingsUi:AddRightGroupbox('		    [ Server ]')

	MenuGroup:AddButton('Unloaded Library', function() 
		for i,_ in pairs(_G) do 
			_G[i] = false
		end 
		Library:Unload() 
	end)
	MenuGroup:AddButton('Copy JobId Server', function() 
		Library:Notify("JobId Server ... !", 2)
		wait(2)
		setclipboard(game.JobId)
		Library:Notify("Ctrl + V !", 2)
	end)
	MenuGroup:AddInput('Join_JobId_Server', { Text = 'Server JobId' })
	MenuGroup:AddButton({ Text = 'Join Server', Func = function()
		game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, Options.Join_JobId_Server.Value)
	end })

	Service:AddButton('Rejoin', function()
		Library:Notify("FENRIL HUB REJOIN COMPLETE !", 1) -- Text, Time
		warn("FENRIL HUB | REJOIN!")
		TeleportService:Teleport(game.PlaceId)
	end)
	Service:AddButton('Server Hop', function()
		Library:Notify("FENRIL HUB HOP SERVER COMPLETE !", 3) -- Text, Time
		warn("FENRIL HUB |  HOP SERVER!")
		HopServer()
	end)

    ThemeManager:SetLibrary(Library)
    SaveManager:SetLibrary(Library)
    SaveManager:IgnoreThemeSettings()
    ThemeManager:ApplyToTab(Tabs.SettingsUi) 

	if isfile("FenrilHub\\themes\\White.json") then
        MenuConfig:AddLabel('Status: Download 🟢')
    else
        MenuConfig:AddLabel('Status: Notdownload 🔴')
    end
    MenuConfig:AddButton('Delete Config', function()
        delfolder("FenrilHub")
    end)

	MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightControl', NoUI = true, Text = 'Menu keybind' }) 
	Library.ToggleKeybind = Options.MenuKeybind 
	spawn(function()
		while wait() do
			pcall(function()
				local scripttime = Workspace.DistributedGameTime
				local seconds = scripttime%60
				local minutes = math.floor(scripttime/60%60)
				local hours = math.floor(scripttime/3600)
				Library:SetWatermarkVisibility(true)
				Library:SetWatermark("Fenril Hub Premium Generations".. " | " ..minutes.." Minute(), "..math.floor(seconds).." Second()")
				--Library:SetWatermark(LocalPlayer.Name .. " | "..hours.." Hour(s), "..minutes.." Minute(s), "..math.floor(seconds).." Second(s)")
			end)
		end
	end)

	SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
	SaveManager:SetFolder('FenrilHub/Balde Balls')
	SaveManager:BuildConfigSection(Tabs.SettingsUi)




	------------------------------------- [ Task: MainSection ] -------------------------------------

    function MainSectionToggle(name, default)
		MainSection:AddToggle(name, {Text = name,Default = _G.Settings[default],Tooltip = name,})
		Toggles[name]:OnChanged(function()
			_G.Settings[default] = Toggles[name].Value
			saveSettings()
		end)
	end

	------------------------------------- [ Task: Visuals ] -------------------------------------

	local function AddVisualsToggle(setting, text)
		VisualsSection:AddToggle(setting, {Text = text,Default = _G.Settings[setting],Tooltip = text,})
		Toggles[setting]:OnChanged(function(value)
			_G.Settings[setting] = value
			saveSettings()
		end)
	end

	AddVisualsToggle('EspPlayer', 'ESP Players')

	------------------------------------- [ Task: Function ] -------------------------------------

    -- ตรวจสอบว่าบอลเป็นอ็อบเจ็กต์ประเภท BasePart และเป็นลูกของ Balls ที่มีแอตทริบิวต์ realBall เป็น true
    function VerifyBall(Ball)
        return typeof(Ball) == "Instance" and Ball:IsA("BasePart") and Ball:IsDescendantOf(Balls) and Ball:GetAttribute("realBall")
    end    

    -- ตรวจสอบว่าผู้เล่นท้องถิ่นมี Character และมีอ็อบเจ็กต์ชื่อ "Highlight"
    function IsTarget() 
        return LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Highlight")
    end    

    -- เรียกใช้งานฟังก์ชัน Parry ผ่าน Remotes
    function Parry()
        local ParryButtonPress = Remotes:WaitForChild("ParryButtonPress")
        if ParryButtonPress then
            ParryButtonPress:Fire()
        else
            warn("ParryButtonPress Remote not found.")
        end
    end

	function GetRoot(Character)
        local RootPart = Character:FindFirstChild("HumanoidRootPart")
        return RootPart
    end

	function GetDistance(_Postition)
        local RootPart = GetRoot(LocalPlayer.Character)
        return (RootPart.Position - _Postition).Magnitude
    end

    function ParryBalls()
        local function ParryBall()
			task.spawn(function()
				Balls.ChildAdded:Connect(function(Ball)
					if not VerifyBall(Ball) then
						return
					end

					local OldPosition = Ball.Position
					local OldTick = tick()

					Ball:GetPropertyChangedSignal("Position"):Connect(function()
						if IsTarget() then 
							local Distance = (Ball.Position - Camera.Focus.Position).Magnitude 
							local Velocity = (OldPosition - Ball.Position).Magnitude

							if (Distance / Velocity) < 10 then
								Parry()
							end
						end
						
						if (tick() - OldTick >= 1/60) then
							OldTick = tick()
							OldPosition = Ball.Position
						end						
					end)
				end)
			end)
        end
        Parry_Balls = RunService.Heartbeat:Connect(function()
            ParryBall()
        end)
		setfpscap(144)
    end

    ------------------------------------ [ Task: FunctionTask ] -------------------------------------
	FunctionTask["Esp_Player"] = function()
		while true do task.wait()
			pcall(function ()
				for _,v in pairs(game.Players:GetChildren()) do
					if v ~= LocalPlayer then
						if v.Character.Head:FindFirstChild("ESP_Billboard") then
							if not v.Character.Head["ESP_Billboard"]:FindFirstChild("ESP_Billboard_Text") then
								v.Character.Head["ESP_Billboard"]:Destroy()
							end
							v.Character.Head.ESP_Billboard.Enabled = _G.Settings["EspPlayer"]
							v.Character.Head.ESP_Billboard.ESP_Billboard_Text.Text = [[<font color="rgb(255, 255, 255)">]] .. v.Name ..[[</font>]].. "\n" .. '<font color="rgb(255,159,159)">Distance : [' .. math.floor(GetSelfDistance(v.Character.HumanoidRootPart.Position)) ..']</font>'
						else
							local Billboard = Instance.new("BillboardGui",v.Character.Head)
							local TexT = Instance.new("TextLabel",Billboard)
							for Property,Value in pairs(Billboard_Property) do
								Billboard[Property] = Value
							end
							for Property,Value in pairs(TexT_Property) do
								TexT.Text = [[<font color="rgb(255, 255, 255)">]] .. v.Name ..[[</font>]].. "\n" .. '<font color="rgb(255,159,159)">Distance : [' .. math.floor(GetSelfDistance(v.Character.HumanoidRootPart.Position)) ..']</font>'
								TexT[Property] = Value
							end
						end
					end
				end			
			end)
		end
	end

	------------------------------------ [ Task:  Auto Parry Balls ] -------------------------------------

    MainSection:AddToggle("- Enabled Auto Parry Balls", {Text = "- Enabled Auto Parry Balls",Default = _G.Settings["- Enabled Auto Parry Balls"],Tooltip = "- Enabled Auto Parry Balls",})
    Toggles["- Enabled Auto Parry Balls"]:OnChanged(function()
        _G.Settings["- Enabled Auto Parry Balls"] = Toggles["- Enabled Auto Parry Balls"].Value
        if Toggles["- Enabled Auto Parry Balls"].Value then
            ParryBalls()
        else
            if Parry_Balls then
                Parry_Balls:Disconnect()
                Parry_Balls = nil
            end
        end
        saveSettings()
    end)




	------------------------------------ [ Task:  Ability ] -------------------------------------

	local AbilitiesFolder = Character:WaitForChild("Abilities")
	local ChosenAbility = "Raging Deflection"

    local Abilitys = {"Dash","Raging Deflection", "Shadow Step", "Super Jump", "Thunder Dash", "Phase Bypass"}
	for i,ability in pairs(Abilitys) do
		Ability:AddButton(ability, function()
			ChosenAbility = ability
		end)
	end
	
	local function onCharacterAdded(newCharacter)
		Character = newCharacter
		AbilitiesFolder = Character:WaitForChild("Abilities")
	end
	
	LocalPlayer.CharacterAdded:Connect(onCharacterAdded)

	while task.wait() do
		for _, obj in pairs(AbilitiesFolder:GetChildren()) do
			if obj:IsA("LocalScript") then
				if obj.Name == ChosenAbility then
					obj.Disabled = false
				else
					obj.Disabled = true
				end
			end
		end
	end

	------------------------------------- [ Task: Run Task ] -------------------------------------

	for TaskName, Task in pairs(FunctionTask) do
		task.spawn(Task)
	end

	setfpscap(144)
end
FenrilHub_BladeBalls:RUN()
