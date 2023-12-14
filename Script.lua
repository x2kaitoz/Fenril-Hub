if placeId == 8069117419 then
    DemonSoulSimulator = true
else
    game.Players.LocalPlayer:Kick("มึงรันสคริปต์ผิดหาโคตรพ่อมึงหรอเดี๋ยวกูแบนแมร่ง ไอควายโง่จริงๆ")
    wait(3)
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end

function u()
	local UI = "https://pastebin.com/raw/"

	local Library = loadstring(game:HttpGet(UI.."Zv1JR1SX"))()
	local ThemeManager = loadstring(game:HttpGet(UI.."rXr3uyQ5"))()
	local SaveManager = loadstring(game:HttpGet(UI.."HLsN5erC"))()
	local Window = Library:CreateWindow({
		-- Set Center to true if you want the menu to appear in the center
		-- Set AutoShow to true if you want the menu to appear when it is created
		-- Position and Size are also valid options here
		-- but you do not need to define them unless you are changing them :)

		Title = 'Fenril Hub Premium Scripts - Demon Soul Simulator',
		Center = true, 
		AutoShow = true,
	})
	local Tabs = {
		-- Creates a new tab titled Main
		Main = Window:AddTab('General'),
		SettingsUi = Window:AddTab('Settings'),
	}
	local MenuGroup = Tabs.SettingsUi:AddLeftGroupbox('Menu')
	local MenuConfig = Tabs.SettingsUi:AddRightGroupbox('Config')
	-- I set NoUI so it does not show up in the keybinds menu
	MenuGroup:AddButton('Unload', function() 
		Library:Notify("Unload UI ... !", 2) -- Text, Time
		wait(2)
		Library:Unload() 
	end)
	if isfile("FenrilHub\\themes\\White.json") then
		MenuConfig:AddLabel('Status: Download 🟢')
	else
		MenuConfig:AddLabel('Status: Notdownload 🔴')
	end
	MenuConfig:AddButton('Download Config', function()
	end)
	MenuConfig:AddButton('Delete Config', function()
	end)
	MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightControl', NoUI = true, Text = 'Menu keybind' }) 

	Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

	SaveManager:SetLibrary(Library)

	SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 

	SaveManager:SetFolder('FenrilHub/Demon Soul Simulator')
	SaveManager:BuildConfigSection(Tabs.SettingsUi)
	Library:Notify("Runing ... Demon Soul Simulator x fenril Hub !", 4) -- Text, Time
	wait(4)
	Library:SetWatermark('Demon Soul Simulator x fenril Hub - ')
	---[box]
	local name = game.Players.LocalPlayer.Name
	local TabBox = Tabs.Main:AddLeftTabbox()
	local Main1 = Tabs.Main:AddRightTabbox()

	---[Section]
	local MainSection = TabBox:AddTab('Soul')
	local Main = Main1:AddTab('Main')

	MainSection:AddInput('LockSoul', {
		Default = 250,
		Numeric = true,
		Finished = true,

		Text = ' ',
	})
	Options.LockSoul:OnChanged(function(Value)
		_G.Lock_Soul = Value
	end)
	MainSection:AddToggle('looksoul', {
		Text = 'Auto look soul',
		Default = false,
		Tooltip = 'Auto look soul',
	})
	Toggles.looksoul:OnChanged(function(value)
		_G.looksoul = value 
	end)
	spawn(function()
		while wait() do
			if _G.looksoul then
				local args = {
					[1] = "SoulCount",
					[2] = _G.Lock_Soul.."000000"
				}
				game:GetService("ReplicatedStorage").RemoteEvents.Setting:FireServer(unpack(args))
			end
		end
	end) 

	MainSection:AddInput('lookBoots', {
		Default = nil,
		Numeric = true,
		Finished = true,

		Text = ' ',
	})
	Options.lookBoots:OnChanged(function(Value)
		_G.Lock_Boots = Value
	end)
	MainSection:AddToggle('lookGamePass', {
		Text = 'Auto look Boots',
		Default = false,
		Tooltip = 'Auto look Boots',
	})
	Toggles.lookGamePass:OnChanged(function(value)
		_G.look_Boots = value 
	end)
	spawn(function()
		while wait() do
			if _G.look_Boots then
				local args = {
					[1] = "Temp_UltimateLuck",
					[2] = _G.Lock_Boots
				}
				game:GetService("ReplicatedStorage").RemoteEvents.Setting:FireServer(unpack(args))
				local args = {
					[1] = "Temp_PrimaryLuck",
					[2] = _G.Lock_Boots
				}
				game:GetService("ReplicatedStorage").RemoteEvents.Setting:FireServer(unpack(args))
				local args = {
					[1] = "Temp_DoubleExp",
					[2] = _G.Lock_Boots
				}
				game:GetService("ReplicatedStorage").RemoteEvents.Setting:FireServer(unpack(args))
				local args = {
					[1] = "Temp_MoveSpeed",
					[2] = _G.Lock_Boots
				}
				game:GetService("ReplicatedStorage").RemoteEvents.Setting:FireServer(unpack(args))
				local args = {
					[1] = "Temp_DoubleSoul",
					[2] = _G.Lock_Boots
				}
				game:GetService("ReplicatedStorage").RemoteEvents.Setting:FireServer(unpack(args))
			end
		end
	end) 


	PlayerName = {}
	for i,v in pairs(game:GetService("ReplicatedStorage").PlayerData:GetChildren()) do  
		if v.Name ~= game:GetService("ReplicatedStorage").PlayerData.Name then
			table.insert(PlayerName ,v.Name)
		end
	end
	---[Game Passes]
	MainSection:AddDropdown('Player', { 
		Values = PlayerName, 
		Default = "1", 
		Multi = false, 
		Text = 'Player Game Pass' 
	})
	Options.Player:OnChanged(function(value)
		_G.Player_Gamepasses = value
	end)
	MainSection:AddButton('Game Passes', function()
		if _G.Player_Gamepasses ~= nil then
			game:GetService("ReplicatedStorage").PlayerData[_G.Player_Gamepasses].GamePass_FastDrawRole2.Value = true
			game:GetService("ReplicatedStorage").PlayerData[_G.Player_Gamepasses].GamePass_FastDrawRole1.Value = true
			game:GetService("ReplicatedStorage").PlayerData[_G.Player_Gamepasses].GamePass_Speed.Value = true
			game:GetService("ReplicatedStorage").PlayerData[_G.Player_Gamepasses].GamePass_Vip.Value = true
			game:GetService("ReplicatedStorage").PlayerData[_G.Player_Gamepasses].GamePass_DoubleSoul.Value = true
			game:GetService("ReplicatedStorage").PlayerData[_G.Player_Gamepasses].GamePass_DoubleExp.Value = true
			game:GetService("ReplicatedStorage").PlayerData[_G.Player_Gamepasses].GamePass_Magnet.Value = true
			game:GetService("ReplicatedStorage").PlayerData[_G.Player_Gamepasses].GamePass_Luck1.Value = true
			game:GetService("ReplicatedStorage").PlayerData[_G.Player_Gamepasses].GamePass_Luck2.Value = true
			game:GetService("ReplicatedStorage").PlayerData[_G.Player_Gamepasses].GamePass_AutoAttack.Value = true
			game:GetService("ReplicatedStorage").PlayerData[_G.Player_Gamepasses].GamePass_Luck3.Value = true
			game:GetService("ReplicatedStorage").PlayerData[_G.Player_Gamepasses].GamePass_Dispatch1.Value = true
			game:GetService("ReplicatedStorage").PlayerData[_G.Player_Gamepasses].GamePass_Dispatch2.Value = true
			game:GetService("ReplicatedStorage").PlayerData[_G.Player_Gamepasses].GamePass_Dispatch3.Value = true
			game:GetService("ReplicatedStorage").PlayerData[_G.Player_Gamepasses].GamePass_Test.Value = true
			game:GetService("ReplicatedStorage").PlayerData[_G.Player_Gamepasses].Badge_UnlockRoleLevel10.Value = true
			game:GetService("ReplicatedStorage").PlayerData[_G.Player_Gamepasses].Badge_UnlockRoleLevel10.Value = true
			game:GetService("ReplicatedStorage").PlayerData[_G.Player_Gamepasses].Badge_UnlockRoleLevel10.Value = true
			wait()
			Library:Notify("Game Passes Unlock Success !", 3) -- Text, Time
		end
	end)
	local RefreshPlayer = MainSection:AddButton('Refresh PLayer', function()
		Options.Player.Values = (function()
			PlayerName = {}
			for i,v in pairs(game:GetService("ReplicatedStorage").PlayerData:GetChildren()) do  
				if v.Name ~= game:GetService("ReplicatedStorage").PlayerData.Name then
					table.insert(PlayerName ,v.Name)
				end
			end
			return PlayerName
		end)()
		Options.Player:SetValue("")
	end)

	---[Rejoin]
	MainSection:AddButton('Rejoin', function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer) 
	end)

	---[Main]
	Main:AddButton('Doma Unlock Premium', function()
		Library:Notify("Doma Unlock Premium Runing ... !", 3) -- Text, Time
		wait(3)
		local args = {
			[1] = "TrainTop3RankCount",
			[2] = "20"
		}
		game:GetService("ReplicatedStorage").RemoteEvents.Setting:FireServer(unpack(args))
		for i=1,3 do
			game:GetService("ReplicatedStorage").RemoteEvents.ReceiveSeasonTop3Reward:FireServer(i)
		end
		Library:Notify("Doma Unlock Premium Success !", 3) -- Text, Time
	end)
	Main:AddButton('Pet Unlock all Premium', function()
		Library:Notify("Pet Unlock all Premium Runing ... !", 3) -- Text, Time
		wait(3)
		local args = {
			[1] = "OwnPetInfo",
			[2] = "[{\"PetId\":16,\"Version\":323,\"Level\":3},{\"PetId\":13,\"Version\":323,\"Level\":3},{\"PetId\":6,\"Version\":323,\"Level\":3},{\"PetId\":8,\"Version\":323,\"Level\":3}]"
		}
		game:GetService("ReplicatedStorage").RemoteEvents.Setting:FireServer(unpack(args))
		Library:Notify("Pet Unlock all Premium Success !", 3) -- Text, Time
	end)
	Main:AddButton('Skin Unlock', function()
		Library:Notify("Skin Unlock Runing ... !", 3) -- Text, Time
		wait(3)
		local args = {
			[1] = "OwnSkinInfo",
			[2] = "[0,24,28,27,21,18,17,26,16,15,14,13,12,8,7,4,2,1,19,23,11,9,6]"
		}
		game:GetService("ReplicatedStorage").RemoteEvents.Setting:FireServer(unpack(args))
		Library:Notify("Skin Unlock Success !", 3) -- Text, Time
	end)
	Main:AddButton('Teleport', function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188.0924072265625, 35.008731842041016, -155.2908935546875)
	end)

	local section = Tabs.Main:AddRightTabbox('Local Player'):AddTab('Player') do
		section:AddSlider('speed', { 
			Text = 'WalkSpeed Value', 
			Default = 35, 
			Min = 1, 
			Max = 200, 
			Rounding = 2, 
			Compact = false 
		})
		section:AddSlider('jump', { 
			Text = 'JumpPower Value', 
			Default = 50, 
			Min = 1, 
			Max = 200, 
			Rounding = 2, 
			Compact = false 
		})
		spawn(function()
			while wait() do
				pcall(function()
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then 
						game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Options.speed.Value
						game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Options.jump.Value
					end
				end)
			end
		end)
	end


	local section = Tabs.Main:AddLeftTabbox('Credits'):AddTab('Credits') do
		section:AddLabel('Creator: FB : Kaito Kung') --#3EB489
	end
	local section = Tabs.Main:AddLeftTabbox('Discord'):AddTab('Discord') do
		section:AddButton('Copy discord invite', function()
			Library:Notify("Copy discord invite ... !", 2) -- Text, Time
			wait(2)
			setclipboard('https://discord.gg/sFGtUyEqD8')
			Library:Notify("Skin Unlock Success !", 1) -- Text, Time
			Library:Notify("Ctrl + V !", 3) -- Text, Time
		end)
		section:AddButton('Go To discord [app]', function()
			local HttpService = game:GetService('HttpService')
			local req = request or syn.request
			wait(1)
			req(
				{
					Url = "http://127.0.0.1:6463/rpc?v=1",
					Method = "POST",
					Headers = {
						["Content-Type"] = "application/json",
						["origin"] = "https://discord.com",
					},
					Body = HttpService:JSONEncode(
						{
							["args"] = {
								["code"] = "sFGtUyEqD8",
							},
							["cmd"] = "INVITE_BROWSER",
							["nonce"] = "."
						})
				})
		end)
	end
	Library:Notify("Demon Soul Simulator x fenril Hub Success !", 5) -- Text, Time
end
u()
