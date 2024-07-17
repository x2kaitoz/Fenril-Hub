local FenrilHub_DSoul = {}
function FenrilHub_DSoul:RUN()

	local GetService = function(serviceName) return game:GetService(serviceName) end
	local Workspace = Workspace
    local Players = GetService("Players")
    local RunService = GetService("RunService")
    local UserInputService = GetService("UserInputService")
    local CoreGui = GetService("CoreGui")
    local StarterGui = GetService("StarterGui")
    local ReplicatedStorage = GetService("ReplicatedStorage")
    local VirtualInputManager = GetService("VirtualInputManager")
    local VirtualUser = GetService("VirtualUser")
    local gameStats = GetService('Stats')
    local TeleportService = GetService("TeleportService")

	local PlaceId = tostring(game.PlaceId)
    local LocalPlayer = Players.LocalPlayer
	local Character = LocalPlayer.Character
	local HumanoidPlr = LocalPlayer.Character.Humanoid
	local PlayerGui = LocalPlayer.PlayerGui

	local placeId = game.PlaceId
	if placeId == 8069117419 then
		DemonSoulSimulator = true
	else
		LocalPlayer:Kick("ลูกอีเอ๋อรันผิดแมพไง")
		wait(2)
		TeleportService:Teleport(game.PlaceId, LocalPlayer)
	end

	function EquipWeapon(Tools)
		if LocalPlayer.Backpack:FindFirstChild(Tools) then
			local tool = LocalPlayer.Backpack:FindFirstChild(Tools)
			wait()
			LocalPlayer.Character.Humanoid:EquipTool(tool)
		elseif GetToolFromTip(Tools) then
			LocalPlayer.Character.Humanoid:EquipTool(GetToolFromTip(Tools))
		end
	end
	function Hop()
		local PlaceID = game.PlaceId
		local AllIDs = {}
		local foundAnything = ""
		local actualHour = os.date("!*t").hour
		local Deleted = false
		function TPReturner()
			local Site;
			if foundAnything == "" then
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
			else
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
			end
			local ID = ""
			if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
				foundAnything = Site.nextPageCursor
			end
			local num = 0;
			for i,v in pairs(Site.data) do
				local Possible = true
				ID = tostring(v.id)
				if tonumber(v.maxPlayers) > tonumber(v.playing) then
					for _,Existing in pairs(AllIDs) do
						if num ~= 0 then
							if ID == tostring(Existing) then
								Possible = false
							end
						else
							if tonumber(actualHour) ~= tonumber(Existing) then
								local delFile = pcall(function()
									AllIDs = {}
									table.insert(AllIDs, actualHour)
								end)
							end
						end
						num = num + 1
					end
					if Possible == true then
						table.insert(AllIDs, ID)
						wait()
						pcall(function()
							wait()
							game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, LocalPlayer)
						end)
						wait(4)
					end
				end
			end
		end
		function Teleport() 
			while wait() do
				pcall(function()
					TPReturner()
					if foundAnything ~= "" then
						TPReturner()
					end
				end)
			end
		end
		Teleport()
	end
	function UseCode(Text)
		ReplicatedStorage.RemoteEvents.Code:FireServer(Text)
	end
	function AutoSkill()
		if _G.Skill == "1" then
			ReplicatedStorage.RemoteEvents.SkillAttack:FireServer(1)
		end
	end
	function AutoRune()
		local args = {
			[1] = "Reforge",
			[2] = {
				[1] = {
					["Id"] = 21,
					["Level"] = 6,
					["BreathType"] = 7
				}
			}
		}
		for _ = 1, 3 do
			ReplicatedStorage.RemoteEvents.BreathFunc:InvokeServer(unpack(args))
		end
	end
	function BuyKaitun()
		--[ตำนาน]
		local args = {
			[1] = "OwnPetInfo",
			[2] = "[{\"PetId\":16,\"Version\":323,\"Level\":1},{\"PetId\":13,\"Version\":323,\"Level\":1},{\"PetId\":6,\"Version\":323,\"Level\":1},{\"PetId\":8,\"Version\":323,\"Level\":1}]"
		}
		ReplicatedStorage.RemoteEvents.Setting:FireServer(unpack(args))
		ReplicatedStorage.RemoteEvents.Setting:FireServer("OwnSkinInfo","[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]")
		-- [ปกติ]
		local skinIds = {28, 27, 21, 18, 17, 26, 16, 14, 13, 12, 8, 7, 4, 2, 1, 19, 23, 11, 9}
		for _, id in ipairs(skinIds) do
			local args = {
				[1] = id
			}
			if id == 1 then
				ReplicatedStorage.RemoteEvents.BuyRole:FireServer(unpack(args))
			else
				ReplicatedStorage.RemoteEvents.BuySkin:FireServer(unpack(args))
			end
		end
	end
	function BuyKaituns()
		--[ตำนาน]
		local args = {
			[1] = "OwnPetInfo",
			[2] = "[{\"PetId\":16,\"Version\":323,\"Level\":1},{\"PetId\":13,\"Version\":323,\"Level\":1},{\"PetId\":6,\"Version\":323,\"Level\":1},{\"PetId\":8,\"Version\":323,\"Level\":1}]"
		}
		ReplicatedStorage.RemoteEvents.Setting:FireServer(unpack(args))
		ReplicatedStorage.RemoteEvents.Setting:FireServer("OwnSkinInfo","[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]")
	end
	function BuySuperKaitun()
		--[ตำนาน]
		local args = {
			[1] = "OwnPetInfo",
			[2] = "[{\"PetId\":16,\"Version\":323,\"Level\":3},{\"PetId\":13,\"Version\":323,\"Level\":3},{\"PetId\":6,\"Version\":323,\"Level\":3},{\"PetId\":8,\"Version\":323,\"Level\":3}]"
		}
		ReplicatedStorage.RemoteEvents.Setting:FireServer(unpack(args))
		ReplicatedStorage.RemoteEvents.Setting:FireServer("OwnSkinInfo","[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]")
		
		-- [ปกติ]
		local skinIds = {28, 27, 21, 18, 17, 26, 16, 14, 13, 12, 8, 7, 4, 2, 1, 19, 23, 11, 9}
		for _, id in ipairs(skinIds) do
			local args = {
				[1] = id
			}
			if id == 1 then
				ReplicatedStorage.RemoteEvents.BuyRole:FireServer(unpack(args))
			else
				ReplicatedStorage.RemoteEvents.BuySkin:FireServer(unpack(args))
			end
		end
	end
	function addPlayerNames()
		local PlayerName = {}
		for _, player in pairs(ReplicatedStorage.PlayerData:GetChildren()) do  
			if player ~= ReplicatedStorage.PlayerData.Name then
				table.insert(PlayerName, player.Name)
			end
		end
		return PlayerName
	end
	local function runfunc(func,toname)
		task.spawn(function()
			while true do task.wait()
				pcall(function ()
					if _G[func] and LocalPlayer.Character:WaitForChild("Humanoid").Health >= 1 then
						xpcall(toname, print)
					end
				end)
			end
		end)
	end

	--autospin
	---- ReplicatedStorage.RemoteEvents.Roulette:FireServer()


	---[local]
	local players = game:GetService("Players")
	local plr = players.LocalPlayer
	local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local root = char:WaitForChild("HumanoidRootPart")

	-- # functions
	local funcs = {} do
		shared.funcs = funcs
		function funcs:TP(path)
			if path then
				if LocalPlayer.Character:FindFirstChild("Humanoid") then
					root.CFrame = CFrame.new(path.Position) * CFrame.new(0,0,5)
				end
			end
		end
		function funcs:clstMob(Level)
			local target, dist = nil, math.huge
			for _, v in next, Workspace.GhostPos[Level]:GetChildren() do
				if v:IsA("BasePart") and v:FindFirstChildWhichIsA("Model") then
					local magn = (v.Position - root.Position).magnitude
					if magn < dist then
						dist = magn
						target = v
					end
				end
			end
			return target
		end
		function funcs:farmBoss()
			for _, v in next, Workspace.Maps:GetChildren() do
				if tostring(v.Name):find("Boss_") then
					funcs:TP(v.HumanoidRootPart)
				end
			end
		end
		function funcs:farmTrain()
			if LocalPlayer.IsInTrain.Value == false then
				fireproximityprompt(Workspace.Maps.TrainStations.Entrance.EnterTrainTrigger.ProximityPrompt)
			end
			if LocalPlayer.PlayerGui.MainUi.EnterTrainTip.Visible == true then
				firesignal(LocalPlayer.PlayerGui.MainUi.EnterTrainTip.Bg.OkButton.MouseButton1Click)
				tWait(3)
			end
			if LocalPlayer.IsInTrain.Value == true then
				for _, v in next, Workspace.TrainGhosts:WaitForChild(LocalPlayer.Name):GetChildren() do
					if v:FindFirstChild("HumanoidRootPart", true) then
						funcs:TP(v.HumanoidRootPart)
					end
				end
			end
			if Workspace.Train.Portal.Next.Letter.SurfaceGui.Enabled == true then
				fireproximityprompt(Workspace.Train.Train.ContinueTrigger.ProximityPrompt)
				tWait(3)
			end
		end
		function funcs:CollectSoul()
			for _, v in next, Workspace.Souls:GetChildren() do
				if v:IsA("BasePart") then
					v.CFrame = root.CFrame
				end
			end
		end
		function funcs:GetClosestChest()
			local target, dist = nil, math.huge
			for _, v in next, Workspace.ChestPoints:GetDescendants() do
				if v:FindFirstChildWhichIsA("Model") then
					local magn = (v.Position - root.Position).magnitude
					if magn < dist then
						dist = magn
						target = v
					end
				end
			end
			return target
		end
	end
	-- # tables
	local arr = {
		getLevels = function()
			local items = {}
			for _, v in ipairs(Workspace.GhostPos:GetChildren()) do
				if v:IsA("Folder") then
					table.insert(items, v.Name)
				end
			end
			return items
		end,
		
		Binds = function()
			return { 
				Q = 1, 
				E = 2, 
				R = 3 
			}
		end
	}
	shared.arr = arr


	Code = {
		"Welcome",
		"thanks3000likes",
		"1000likes",
		"adou6000likes",
		"liangzai20klikes",
		"demon",
		"demonsoul",
		"demon150k",
		"demonsoul200k"
	}

	local UI = "https://pastebin.com/raw/"
	local Library = loadstring(game:HttpGet(UI.."3pkeb0HG"))()
	local ThemeManager = loadstring(game:HttpGet(UI.."nPMYS622"))()
	local SaveManager = loadstring(game:HttpGet(UI.."HLsN5erC"))()

	local Window = Library:CreateWindow({
		-- Set Center to true if you want the menu to appear in the center
		-- Set AutoShow to true if you want the menu to appear when it is created
		-- Position and Size are also valid options here
		-- but you do not need to define them unless you are changing them :)

		Title = 'Fenril Hub - Next Generation',
		Center = true, 
		AutoShow = true,
	})
	local Tabs = {
		-- Creates a new tab titled Main
		Main = Window:AddTab('General'),
		SettingsUi = Window:AddTab('Settings'),
	}

	---[box]
	local name = LocalPlayer.Name
	local TabBox = Tabs.Main:AddLeftTabbox()
	local TabBox1 = Tabs.Main:AddRightTabbox()
	local Buy = Tabs.Main:AddRightTabbox()
	local Kaitun = Tabs.Main:AddRightTabbox()

	---[Section]
	local MainSection = TabBox:AddTab('[ Main ]')
	local TP = TabBox1:AddTab('[ Teleport ]')
	local Buy = Buy:AddTab('Kaitun')
	local Kaitun = Kaitun:AddTab('Kaitun Main')

	Skill = { 
		["Q"] = 1, 
		["E"] = 2, 
		["R"] = 3 
	}

	local items = {
		{Name = 'Rune Level Max', Tooltip = 'Rune Level Max'},
	}
	for _, item in ipairs(items) do
		MainSection:AddToggle(item.Name, {Text = item.Name,Default = false,Tooltip = item.Tooltip,})
		Toggles[item.Name]:OnChanged(function(value)
			_G[item.Name] = value
		end)
	end

	local AddDropdown = {
		{Name = 'Player Game Passes', delfolder = addPlayerNames() , Multi = false },
	}
	for _, Dropdowns in ipairs(AddDropdown) do
		MainSection:AddDropdown(Dropdowns.Name, {Values = Dropdowns.delfolder,Default = 1, Multi = Dropdowns.Multi, Text = Dropdowns.Name})
		Options[Dropdowns.Name]:OnChanged(function(value)
			_G[Dropdowns.Name] = value
		end)
	end

	function auto_farm()
		if not _G["Auto Farm Monsters"] then
			return
		end
		if plr.Character:FindFirstChild("Humanoid").Health ~= 0 then
			pcall(function()
				repeat 
					wait()
					ReplicatedStorage.RemoteEvents.GeneralAttack:FireServer()
					funcs:TP(funcs:clstMob(_G.Level))
					if _G["Auto Skill"] then
						Skill()
					end
				until not plr.Character:FindFirstChild("Humanoid") or Toggles["Auto Farm Monsters"].Values == false
			end)
		end
	end
	function Skill()
		if not _G["Auto Skill"] then return end
		for i, v in pairs(_G.Skill) do
			if _G.Skill[i] == Skill[i] then
				ReplicatedStorage.RemoteEvents.SkillAttack:FireServer(Skill[i])
			end
		end
	end
	function DrawRole()
		if not _G["Auto Draw Role"] then return end
		pcall(function()
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88.26490783691406, 39.13349151611328, -463.3778991699219)
			ReplicatedStorage.RemoteEvents.DrawRole:FireServer(true)
		end)
		if not _G["Auto Draw Role"] then
			ReplicatedStorage.RemoteEvents.StopAutoDrawRole:FireServer()
		end	
	end
	function noclip()
		if not _G["No clip"] then return end
		if LocalPlayer.Character:FindFirstChild("Humanoid") then
			setfflag("HumanoidParallelRemoveNoPhysics", "False")
			setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
			LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end

	MainSection:AddButton('Redeem All Code', function()
		for _,v in pairs(Code) do
			UseCode(v)
		end
	end)

	Buy:AddButton('Kaitun', function()
		local buffs = {
			"SoulCount",
			"Temp_UltimateLuck",
			"Temp_PrimaryLuck",
			"Temp_DoubleExp",
			"Temp_MoveSpeed",
			"Temp_DoubleSoul"
		}
		
		local value = "9000000000000000000"
		
		for _, buff in ipairs(buffs) do
			local args = {
				[1] = buff,
				[2] = value
			}
			ReplicatedStorage.RemoteEvents.Setting:FireServer(unpack(args))
		end	

		--[maxlevel]
		local data = {
			MaxRoleLevel = 999,
			MaxTrainLevel = 999,
			OwnRoleInfo = "[{\"RoleLevel\":999,\"RoleId\":10,\"RoleExp\":18710180,\"SkinId\":28,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Ordered to seek for blue other shore flower\",\"Reward\":0}},{\"RoleLevel\":999,\"RoleId\":4,\"RoleExp\":18710180,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Command and jion the familiy member to meet Kisatsutai\",\"Reward\":0}},{\"RoleLevel\":999,\"RoleId\":15,\"RoleExp\":18710180,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Go to Natagumo Yama to investigate\",\"IsDispatching\":false}},{\"RoleLevel\":999,\"RoleId\":8,\"RoleExp\":18710180,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Locate the evil ghost alone\",\"IsDispatching\":false}},{\"RoleLevel\":999,\"RoleId\":2,\"RoleExp\":18710180,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Go to Mugen Train to investigate\",\"Reward\":0}},{\"RoleLevel\":999,\"RoleId\":5,\"RoleExp\":18710180,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Go to Butterfly massion to physical training\",\"IsDispatching\":false}},{\"RoleLevel\":999,\"RoleId\":6,\"RoleExp\":18710180,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Go to Mugen Train to investigate\",\"Reward\":0}},{\"RoleLevel\":999,\"RoleId\":12,\"RoleExp\":18710180,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Hang out to find human beings to enhance attack power\",\"Reward\":0}},{\"RoleLevel\":999,\"RoleId\":1,\"RoleExp\":18710180,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Go to Mugen Train to investigate\",\"Reward\":0}},{\"RoleLevel\":999,\"RoleId\":7,\"RoleExp\":18710180,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Develop drugs and care for patients in butterfly mansion\",\"Reward\":0}},{\"RoleLevel\":999,\"RoleId\":9,\"RoleExp\":18710180,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Practice sword skills with his brother\",\"Reward\":0}},{\"RoleLevel\":999,\"RoleId\":15,\"RoleExp\":18710180,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Go to Natagumo Yama to investigate\",\"IsDispatching\":false}},{\"RoleLevel\":999,\"RoleId\":26,\"RoleExp\":18710180,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Go to Natagumo Yama to investigate\",\"IsDispatching\":false}},{\"RoleLevel\":999,\"RoleId\":3,\"RoleExp\":18710180,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Go to Mugen Train to investigate\",\"IsDispatching\":false}}]",
			TrainTop3RankCount = "20"
		}
		
		for key, value in pairs(data) do
			local args = {
				[1] = key,
				[2] = value
			}
			ReplicatedStorage.RemoteEvents.Setting:FireServer(unpack(args))
		end	


		--local args = {
			--[1] = "OwnRoleInfo",
			--[2] = "[{\"RoleLevel\":999,\"RoleId\":10,\"RoleExp\":18710180,\"SkinId\":28,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Ordered to seek for blue other shore flower\",\"Reward\":0}},{\"RoleLevel\":999,\"RoleId\":4,\"RoleExp\":6213590,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Command and jion the familiy member to meet Kisatsutai\",\"Reward\":0}},{\"RoleLevel\":999,\"RoleId\":15,\"RoleExp\":0,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Go to Natagumo Yama to investigate\",\"IsDispatching\":false}},{\"RoleLevel\":999,\"RoleId\":8,\"RoleExp\":0,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Locate the evil ghost alone\",\"IsDispatching\":false}},{\"RoleLevel\":999,\"RoleId\":2,\"RoleExp\":371610,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Go to Mugen Train to investigate\",\"Reward\":0}},{\"RoleLevel\":999,\"RoleId\":5,\"RoleExp\":0,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Go to Butterfly massion to physical training\",\"IsDispatching\":false}},{\"RoleLevel\":999,\"RoleId\":6,\"RoleExp\":731405,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Go to Mugen Train to investigate\",\"Reward\":0}},{\"RoleLevel\":999,\"RoleId\":12,\"RoleExp\":519545,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Hang out to find human beings to enhance attack power\",\"Reward\":0}},{\"RoleLevel\":999,\"RoleId\":1,\"RoleExp\":371610,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Go to Mugen Train to investigate\",\"Reward\":0}},{\"RoleLevel\":999,\"RoleId\":7,\"RoleExp\":368610,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Develop drugs and care for patients in butterfly mansion\",\"Reward\":0}},{\"RoleLevel\":999,\"RoleId\":9,\"RoleExp\":0,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Practice sword skills with his brother\",\"Reward\":0}},{\"RoleLevel\":999,\"RoleId\":15,\"RoleExp\":0,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Go to Natagumo Yama to investigate\",\"IsDispatching\":false}},{\"RoleLevel\":999,\"RoleId\":3,\"RoleExp\":0,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Go to Mugen Train to investigate\",\"IsDispatching\":false}}]"
		--}
		--ReplicatedStorage.RemoteEvents.Setting:FireServer(unpack(args))
	end)
	Buy:AddButton('Buys', function()
		--[ตำนาน]
		--"[{\"PetId\":17,\"Version\":323,\"Level\":3},{\"PetId\":16,\"Version\":323,\"Level\":3},{\"PetId\":13,\"Version\":323,\"Level\":3},{\"PetId\":6,\"Version\":323,\"Level\":3},{\"PetId\":8,\"Version\":323,\"Level\":3}]"
		local args = {
			[1] = "OwnPetInfo",
			[2] = "[{\"PetId\":17,\"Version\":323,\"Level\":3},{\"PetId\":16,\"Version\":323,\"Level\":3},{\"PetId\":13,\"Version\":323,\"Level\":3},{\"PetId\":6,\"Version\":323,\"Level\":3},{\"PetId\":8,\"Version\":323,\"Level\":3}]"
		}
		ReplicatedStorage.RemoteEvents.Setting:FireServer(unpack(args))
		--local args = {
			--[1] = "OwnPetInfo",
			--[2] = "[{\"PetId\":16,\"Version\":323,\"Level\":3},{\"PetId\":13,\"Version\":323,\"Level\":3},{\"PetId\":6,\"Version\":323,\"Level\":3},{\"PetId\":8,\"Version\":323,\"Level\":3}]"
		--}
		--ReplicatedStorage.RemoteEvents.Setting:FireServer(unpack(args))
		local SkinInfo = {}
		for i = 0, 28 do
			table.insert(SkinInfo, i)
		end
		
		local args = {
			[1] = "OwnSkinInfo",
			[2] = game:GetService("HttpService"):JSONEncode(SkinInfo)
		}
		ReplicatedStorage.RemoteEvents.Setting:FireServer(unpack(args))	

		--[ตำนาน2]
		--local args = {
			--[1] = "OwnPetInfo",
			--[2] = "[{\"PetId\":16,\"Version\":323,\"Level\":3},{\"PetId\":16,\"Version\":323,\"Level\":3},{\"PetId\":16,\"Version\":323,\"Level\":3},{\"PetId\":13,\"Version\":323,\"Level\":3},{\"PetId\":6,\"Version\":323,\"Level\":3},{\"PetId\":8,\"Version\":323,\"Level\":3}]"
		--}
		--ReplicatedStorage.RemoteEvents.Setting:FireServer(unpack(args))

		--[ปกติ]
		local skinIds = {28, 27, 21, 18, 17, 26, 16, 14, 13, 12, 8, 7, 4, 2, 1, 19, 23, 11, 9}
		for _, id in ipairs(skinIds) do
			local args = {
				[1] = id
			}
			if id == 1 then
				ReplicatedStorage.RemoteEvents.BuyRole:FireServer(unpack(args))
			else
				ReplicatedStorage.RemoteEvents.BuySkin:FireServer(unpack(args))
			end
		end
	end)
	Buy:AddButton('Rune Doma Max', function()
		local args = {
			[1] = "OwnBreathInfo",
			[2] = "{\"Owned\":[{\"Id\":1,\"Level\":6,\"BreathType\":10},{\"Id\":2,\"Level\":6,\"BreathType\":10},{\"Id\":3,\"Level\":6,\"BreathType\":10},{\"Id\":4,\"Level\":6,\"BreathType\":10},{\"Id\":5,\"Level\":6,\"BreathType\":10},{\"Id\":6,\"Level\":6,\"BreathType\":10}],\"AutoId\":3,\"New\":true}"
		}
		ReplicatedStorage.RemoteEvents.Setting:FireServer(unpack(args))
	end)
	Buy:AddButton('Game Passes', function()
		local _GamePasses = {
			"GamePass_Speed",
			"GamePass_Vip",
			"GamePass_FastDrawRole1",
			"GamePass_FastDrawRole2",
			"GamePass_DoubleSoul",
			"GamePass_DoubleExp",
			"GamePass_Magnet",
			"GamePass_Luck1",
			"GamePass_Luck2",
			"GamePass_AutoAttack",
			"GamePass_Luck3",
			"GamePass_Dispatch1",
			"GamePass_Dispatch2",
			"GamePass_Dispatch3",
			"GamePass_Test"
		}	
		for _, gamePass in ipairs(_GamePasses) do
			ReplicatedStorage.RemoteEvents.Setting:FireServer(gamePass, true)
		end	
	end)
	Buy:AddButton('Doma Unlock', function()
		for i=1,3 do
			ReplicatedStorage.RemoteEvents.Setting:FireServer("TrainTop3RankCount", "20")
			ReplicatedStorage.RemoteEvents.ReceiveSeasonTop3Reward:FireServer(i)
		end
	end)
	Buy:AddButton('All Unlock', function()
		for i = 1, 3 do
			ReplicatedStorage.RemoteEvents.Setting:FireServer("TrainTop3RankCount", "20")
			ReplicatedStorage.RemoteEvents.ReceiveSeasonTop3Reward:FireServer(i)
			ReplicatedStorage.RemoteEvents.Setting:FireServer("OwnSkinInfo", "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]")
		end
	end)
	---ReplicatedStorage.BossCoolDown
	MainSection:AddButton('Delete Name Tag', function()
		LocalPlayer.Character.Head.PlayerHeadUI:Destroy()
	end)

	local section = Tabs.Main:AddLeftTabbox('Player'):AddTab('Player') do

		MainSection:AddDropdown('Players', { Values = addPlayerNames(), Default = "1", Multi = false, Text = 'Player Name' })
		Options.Players:OnChanged(function(value)
			_G.Players = value
		end)
		MainSection:AddButton('Refresh PLayer', function()
			Options.Players.Values = addPlayerNames()
			Options.Players:SetValue(nil)
		end)

		--- [Game Passes]
		MainSection:AddButton('Game Passes', function()
			local playerData = ReplicatedStorage.PlayerData[_G.Players]
			for _, pass in ipairs(playerData:GetChildren()) do
				if string.find(pass.Name, "GamePass_") or string.find(pass.Name, "Badge_UnlockRoleLevel10") then
					pass.Value = true
				end
			end
		end)
		
		local options = {
		{'speed', {Text = 'WalkSpeed Value', Default = 35, Min = 1, Max = 200, Rounding = 2, Compact = false}},
		{'jump', {Text = 'JumpPower Value', Default = 50, Min = 1, Max = 200, Rounding = 2, Compact = false}}
		}

		for _, option in ipairs(options) do
			section:AddSlider(unpack(option))
		end

		spawn(function()
			while wait() do
				pcall(function()
					local character = LocalPlayer.Character
					if character and character:FindFirstChild("Humanoid").Health > 0 then 
						character.Humanoid.WalkSpeed = Options.speed.Value
						character.Humanoid.JumpPower = Options.jump.Value
					end
				end)
			end
		end)

	end

	---[Teleport]
	TP:AddButton('Teleport [Boss Room]', function()
		local character = LocalPlayer.Character
		if character and character:FindFirstChild("Humanoid").Health > 0 then 
			character.HumanoidRootPart.CFrame = CFrame.new(452.3760070800781, 38.9378547668457, 719.9202270507812)
		end
	end)
	TP:AddButton('Teleport [NPC]', function()
		LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188.0924072265625, 35.008731842041016, -155.2908935546875)
	end)


	--- [Kaitun]
	local function fireServer(setting, value)
		ReplicatedStorage.RemoteEvents.Setting:FireServer(setting, value)
	end

	Kaitun:AddButton('Kaitun ExpInfo', function()
		fireServer("OwnExpInfo", '[{\"Count\":999999,\"ExpId\":1},{\"Count\":999999,\"ExpId\":2},{\"Count\":999999,\"ExpId\":3},{\"Count\":16565539100,\"ExpId\":4}]')
	end)

	Kaitun:AddButton('TrainRank_New', function()
		fireServer("MaxTrainLevel", "200")
		fireServer("TrainRank_New", "200")
	end)

	Kaitun:AddButton('Statistics KilledDemon', function()
		fireServer("Statistics_KilledDemonCount", "1853263")
	end)

	Kaitun:AddButton('Statistics Damage', function()
		fireServer("Statistics_TotalDamage", "4000000000000")
	end)

	Kaitun:AddButton('Statistics Robux', function()
		fireServer("Donate", "40000")
		fireServer("Statistics_RobuxSpent", "40000")
	end)


	local function AddToggleAndInput(name, defaultValue, numeric, ValueS)
		Kaitun:AddToggle(name, {
			Text = 'Auto ' .. name,
			Default = ValueS,
			Tooltip = 'Auto ' .. name,
		})
		Toggles[name]:OnChanged(function(value)
			_G[name] = value
		end)
		
		Kaitun:AddInput(name, {
			Default = defaultValue,
			Numeric = numeric,
			Finished = true,
			Text = name,
		})
		Options[name]:OnChanged(function(Value)
			_G[name] = Value
		end)
	end

	AddToggleAndInput('LockSoul', 250, true, false)
	AddToggleAndInput('LookGamePass', 250, true)

	local function UpdateServerSetting(name, value)
		local args = {
			[1] = name,
			[2] = value
		}
		ReplicatedStorage.RemoteEvents.Setting:FireServer(unpack(args))
	end

	spawn(function()
		while wait() do
			if Toggles["LockSoul"].Value then
				UpdateServerSetting("SoulCount", Options["LockSoul"].Value .."000000")
			end
		end
	end)

	spawn(function()
		while wait() do
			if Toggles["LookGamePass"].Value then
				local gamePasses = {
					"Temp_UltimateLuck",
					"Temp_PrimaryLuck",
					"Temp_DoubleExp",
					"Temp_MoveSpeed",
					"Temp_DoubleSoul"
				}
				for _, gamePass in ipairs(gamePasses) do
					UpdateServerSetting(gamePass, Options["LookGamePass"].Value)
				end
			end
		end
	end)

	Kaitun:AddButton('Auto Pet', function()
		ReplicatedStorage.RemoteEvents.Setting:FireServer("OwnPetInfo","[{\"PetId\":17,\"Version\":323,\"Level\":3},{\"PetId\":16,\"Version\":323,\"Level\":3},{\"PetId\":13,\"Version\":323,\"Level\":3},{\"PetId\":6,\"Version\":323,\"Level\":3},{\"PetId\":8,\"Version\":323,\"Level\":3}]")
	end)
	Kaitun:AddButton('Auto Skin', function()
		ReplicatedStorage.RemoteEvents.Setting:FireServer("OwnSkinInfo","[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]")
	end)




	--- [Kaitun]


	--local args = {
		--[1] = "OwnRoleInfo",
		--[2] = "[
		--{\"RoleLevel\":999,\"RoleId\":10,\"RoleExp\":18710180,\"SkinId\":28,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Ordered to seek for blue other shore flower\",\"Reward\":0}},
		--{\"RoleLevel\":107,\"RoleId\":4,\"RoleExp\":6213590,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Command and jion the familiy member to meet Kisatsutai\",\"Reward\":0}},
		--{\"RoleLevel\":104,\"RoleId\":15,\"RoleExp\":0,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Go to Natagumo Yama to investigate\",\"IsDispatching\":false}},
		--{\"RoleLevel\":112,\"RoleId\":8,\"RoleExp\":0,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Locate the evil ghost alone\",\"IsDispatching\":false}},
		--{\"RoleLevel\":105,\"RoleId\":2,\"RoleExp\":371610,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Go to Mugen Train to investigate\",\"Reward\":0}},
		--{\"RoleLevel\":108,\"RoleId\":5,\"RoleExp\":0,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Go to Butterfly massion to physical training\",\"IsDispatching\":false}},
		--{\"RoleLevel\":122,\"RoleId\":6,\"RoleExp\":731405,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Go to Mugen Train to investigate\",\"Reward\":0}},
		--{\"RoleLevel\":105,\"RoleId\":12,\"RoleExp\":519545,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Hang out to find human beings to enhance attack power\",\"Reward\":0}},
		--{\"RoleLevel\":104,\"RoleId\":1,\"RoleExp\":371610,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Go to Mugen Train to investigate\",\"Reward\":0}},
		--{\"RoleLevel\":123,\"RoleId\":7,\"RoleExp\":368610,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Develop drugs and care for patients in butterfly mansion\",\"Reward\":0}},
		--{\"RoleLevel\":110,\"RoleId\":9,\"RoleExp\":0,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Practice sword skills with his brother\",\"Reward\":0}},
		--{\"RoleLevel\":104,\"RoleId\":15,\"RoleExp\":0,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Go to Natagumo Yama to investigate\",\"IsDispatching\":false}}]"
	--}
	--ReplicatedStorage.RemoteEvents.Setting:FireServer(unpack(args))


	--[ชิโนบุ]
	--{\"RoleLevel\":999,\"RoleId\":7,\"RoleExp\":14888490,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Develop drugs and care for patients in butterfly mansion\",\"IsDispatching\":false}},
	--[ทันจิโร่ม่วง]
	--{\"RoleLevel\":999,\"RoleId\":6,\"RoleExp\":26865290,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Go to Butterfly massion to physical training\",\"IsDispatching\":false}},
	--[รุย]
	--{\"RoleLevel\":999,\"RoleId\":4,\"RoleExp\":6213590,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Command and jion the familiy member to meet Kisatsutai\",\"Reward\":0}},
	--[อิโนะสึเกะ]
	--{\"RoleLevel\":999,\"RoleId\":2,\"RoleExp\":2056220,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Go to Butterfly massion to physical training\",\"Reward\":0}},
	--[ทันจิโร่]
	--{\"RoleLevel\":999,\"RoleId\":3,\"RoleExp\":23435740,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Go to Mugen Train to investigate\",\"Reward\":0}},
	--[อุโรโกดากิ]
	--{\"RoleLevel\":999,\"RoleId\":15,\"RoleExp\":0,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Go to Natagumo Yama to investigate\",\"IsDispatching\":false}},
	--[เนซึโกะ]
	--{\"RoleLevel\":999,\"RoleId\":1,\"RoleExp\":8749860,"\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"When night comes, play with Zenitsu","IsDispatching\":false}},
	--[อสูรลูกศร]
	--{\"RoleLevel\":999,\"RoleId\":12,\"RoleExp\":9932740,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Hang out to find human beings to enhance attack power\",\"Reward\":0}},
	--[กิยู]
	--{\"RoleLevel\":999,\"RoleId\":8,\"RoleExp\":24233000,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Locate the evil ghost alone","IsDispatching\":false}},
	--[เซ็นอิทซึ]
	--{\"RoleLevel\":999,\"RoleId\":5,\"RoleExp\":19276600,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Go to Natagumo Yama to investigate","IsDispatching\":false}},
	--[เรนโกคุ]
	--{\"RoleLevel\":999,\"RoleId\":9,\"RoleExp\":23553040,\"SkinId\":0,\"DispatchInfo\":{\"Progress\":-1,\"Reward\":0,\"DispatchName\":\"Practice sword skills with his brother","IsDispatching\":false}},
	--[อาคาสะ]
	--{\"RoleLevel\":999,\"RoleId\":10,\"RoleExp\":18710180,\"SkinId\":28,\"DispatchInfo\":{\"Progress\":-1,\"IsDispatching\":false,\"DispatchName\":\"Ordered to seek for blue other shore flower\",\"Reward\":0}}




	--Workspace.Maps["Boss_2"].Humanoid
	local section = Tabs.Main:AddLeftTabbox('Credits'):AddTab('Credits') do
		section:AddLabel('Creator: Kaito Kung') --#3EB489
	end
	local section = Tabs.Main:AddLeftTabbox('Discord'):AddTab('Discord') do
		section:AddButton('Discord Invite [App]', function()
			Library:Notify("Copy discord invite ... !", 2)
			setclipboard('https://discord.gg/sFGtUyEqD8')
			wait(2)
			Library:Notify("Copy discord invite success ... !", 2)
			local HttpService = game:GetService('HttpService')
			local req = request or syn.request
			wait(1)
			req({
				Url = "http://127.0.0.1:6463/rpc?v=1",
				Method = "POST",
				Headers = {
					["Content-Type"] = "application/json",
					["origin"] = "https://discord.com",
				},
				Body = HttpService:JSONEncode({
					["args"] = {
						["code"] = "sFGtUyEqD8",
					},
					["cmd"] = "INVITE_BROWSER",
					["nonce"] = "."
				})
			})
		end)
	end

	---[Menu]
	local MenuGroup = Tabs.SettingsUi:AddLeftGroupbox('		    [ Menu ]')
	local MenuConfig = Tabs.SettingsUi:AddRightGroupbox('		    [ Config ]')
	local Service = Tabs.SettingsUi:AddRightGroupbox('		    [ Server ]')
	-- I set NoUI so it does not show up in the keybinds menu
	MenuGroup:AddButton('Unload', function() 
		Library:Notify("Unload UI ... !", 2) -- Text, Time
		wait(2)
		for i,_ in pairs(_G) do 
			_G[i] = false
		end 
		Library:Unload() 
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
	MenuConfig:AddButton('Download Config', function()
	end)
	MenuConfig:AddButton('Delete Config', function()
		delfolder("FenrilHub")
	end)
	Service:AddButton('Rejoin', function()
		Library:Notify("FENRIL HUB REJOIN COMPLETE !", 1) -- Text, Time
		print("FENRIL HUB | REJOIN!")
		game:GetService("TeleportService"):Teleport(game.PlaceId)
	end)
	Service:AddButton('Server Hop', function()
		Library:Notify("FENRIL HUB HOP SERVER COMPLETE !", 3) -- Text, Time
		print("FENRIL HUB |  HOP SERVER!")
		Hop()
	end)
	MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightControl', NoUI = true, Text = 'Menu keybind' }) 
	Library.ToggleKeybind = Options.MenuKeybind 
	spawn(function()
		while wait() do
			pcall(function()
				local scripttime = game.Workspace.DistributedGameTime
				local seconds = scripttime%60
				local minutes = math.floor(scripttime/60%60)
				local hours = math.floor(scripttime/3600)
				Library:SetWatermarkVisibility(true)
				Library:SetWatermark("Fenril Hub Next Generations".. " | " ..minutes.." Minute(), "..math.floor(seconds).." Second()")
				--Library:SetWatermark(LocalPlayer.Name .. " | "..hours.." Hour(s), "..minutes.." Minute(s), "..math.floor(seconds).." Second(s)")
			end)
		end
	end)

	SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
	SaveManager:SetFolder('FenrilHub/Anime Fighters Simulator')
	SaveManager:BuildConfigSection(Tabs.SettingsUi)

	--- [ runfunc ]
	runfunc("Rune Level Max",AutoRune)
end
FenrilHub_DSoul:RUN()
