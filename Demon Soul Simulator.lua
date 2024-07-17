function u()
	do
		local gui = game:GetService("CoreGui"):FindFirstChild("HovxrzGui")
		if gui then
			gui:Destroy()
		end
	end

	local UserInputService = game:GetService("UserInputService")
	local TweenService = game:GetService("TweenService")

	local function MakeDraggable(topbarobject, object)
		local Dragging = nil
		local DragInput = nil
		local DragStart = nil
		local StartPosition = nil

		local function Update(input)
			local Delta = input.Position - DragStart
			local pos =
				UDim2.new(
					StartPosition.X.Scale,
					StartPosition.X.Offset + Delta.X,
					StartPosition.Y.Scale,
					StartPosition.Y.Offset + Delta.Y
				)
			local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
			Tween:Play()
		end

		topbarobject.InputBegan:Connect(
			function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					Dragging = true
					DragStart = input.Position
					StartPosition = object.Position

					input.Changed:Connect(
						function()
							if input.UserInputState == Enum.UserInputState.End then
								Dragging = false
							end
						end
					)
				end
			end
		)

		topbarobject.InputChanged:Connect(
			function(input)
				if
					input.UserInputType == Enum.UserInputType.MouseMovement or
					input.UserInputType == Enum.UserInputType.Touch
				then
					DragInput = input
				end
			end
		)

		UserInputService.InputChanged:Connect(
			function(input)
				if input == DragInput and Dragging then
					Update(input)
				end
			end
		)
	end

	local library = {}

	function library:CreateWindow(text,maincolor,text2,logo)
		logo = logo or 0
		maincolor = maincolor or Color3.fromRGB(63,233,233)
		local isselected = false

		local HovxrzGui = Instance.new("ScreenGui")
		HovxrzGui.Name = "HovxrzGui"
		HovxrzGui.Parent = game:GetService("CoreGui")
		HovxrzGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		local Main = Instance.new("Frame")
		Main.Name = "Main"
		Main.Parent = HovxrzGui
		Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		Main.BorderColor3 = Color3.fromRGB(25, 25, 25)
		Main.Position = UDim2.new(0.5, 0,0.499, 0)
		-- Main.Size = UDim2.new(0, 375, 0, 460)
		Main.AnchorPoint = Vector2.new(0.5,0.5)

		local Top = Instance.new("Frame")
		Top.Name = "Top"
		Top.Parent = Main
		Top.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		Top.BorderSizePixel = 0
		-- Top.Size = UDim2.new(0, 375, 0, 20)
		Top.ClipsDescendants = true
		
		local NameHub = Instance.new("TextLabel")
		NameHub.Name = "NameHub"
		NameHub.Parent = Top
		NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NameHub.BackgroundTransparency = 1.000
		NameHub.Position = UDim2.new(0, 25, 0, 0)
		NameHub.Size = UDim2.new(0, 50, 0, 20)
		NameHub.Font = Enum.Font.GothamSemibold
		NameHub.Text = string.upper(text)
		NameHub.TextColor3 = Color3.fromRGB(225, 225, 225)
		NameHub.TextSize = 15.000
		
		local Hub = Instance.new("TextLabel")
		Hub.Name = "Hub"
		Hub.Parent = Top
		Hub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Hub.BackgroundTransparency = 1.000
		Hub.Position = UDim2.new(0, 75, 0, 0)
		Hub.Size = UDim2.new(0, 60, 0, 20)
		Hub.Font = Enum.Font.GothamSemibold
		Hub.Text = "HUB"
		Hub.TextColor3 = maincolor
		Hub.TextSize = 15.000
		Hub.TextXAlignment = Enum.TextXAlignment.Left
		
		local Logo = Instance.new("ImageLabel")
		Logo.Name = "Logo"
		Logo.Parent = Top
		Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Logo.BackgroundTransparency = 1.000
		Logo.BorderSizePixel = 0
		Logo.Position = UDim2.new(0, 5, 0, 0)
		Logo.Size = UDim2.new(0, 20, 0, 20)
		Logo.Image = "rbxassetid://"..tostring(logo)

		local Barrier = Instance.new("Frame")
		Barrier.Name = "Barrier"
		Barrier.Parent = Top
		Barrier.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
		Barrier.BorderColor3 = Color3.fromRGB(27, 42, 53)
		Barrier.BorderSizePixel = 0
		Barrier.Position = UDim2.new(0, 115, 0, 3)
		Barrier.Size = UDim2.new(0, 2, 0, 14)

		local Description = Instance.new("TextLabel")
		Description.Name = "Description"
		Description.Parent = Top
		Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Description.BackgroundTransparency = 1.000
		Description.Position = UDim2.new(0, 125, 0, 0)
		Description.Size = UDim2.new(0, 250, 0, 20)
		Description.Font = Enum.Font.GothamSemibold
		Description.Text = text2
		Description.TextColor3 = Color3.fromRGB(225, 225, 225)
		Description.TextSize = 15.000
		Description.TextXAlignment = Enum.TextXAlignment.Left

		local Tab = Instance.new("Frame")
		Tab.Name = "Tab"
		Tab.Parent = Main
		Tab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		Tab.BorderSizePixel = 0
		Tab.Position = UDim2.new(0, 5, 0, 25)
		Tab.Size = UDim2.new(0, 365, 0, 25)

		local ScrollTab = Instance.new("ScrollingFrame")
		ScrollTab.Name = "ScrollTab"
		ScrollTab.Parent = Tab
		ScrollTab.Active = true
		ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollTab.BackgroundTransparency = 1.000
		ScrollTab.BorderSizePixel = 0
		ScrollTab.Size = UDim2.new(0, 365, 0, 25)
		ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
		ScrollTab.ScrollBarThickness = 0

		local TabListLayout = Instance.new("UIListLayout")
		TabListLayout.Name = "TabListLayout"
		TabListLayout.Parent = ScrollTab
		TabListLayout.FillDirection = Enum.FillDirection.Horizontal
		TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		TabListLayout.Padding = UDim.new(0, 5)

		local Page = Instance.new("Frame")
		Page.Name = "Page"
		Page.Parent = Main
		Page.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		Page.BorderSizePixel = 0
		Page.Position = UDim2.new(0.0133333337, 0, 0.130434781, 0)
		Page.Size = UDim2.new(0, 365, 0, 395)

		local pagesFolder = Instance.new("Folder")
		pagesFolder.Name = "pagesFolder"
		pagesFolder.Parent = Page

		MakeDraggable(Top,Main)
		
		Main.BackgroundTransparency = 1
		Tab.Visible = false
		Page.Visible = false
		Main.Size = UDim2.new(0,375,0,0)
		Top.Size = UDim2.new(0,0,0,20)
		TweenService:Create(
			Top,
			TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
			{Size = UDim2.new(0, 375, 0, 20)}
		):Play()
		repeat wait() until Top.Size == UDim2.new(0, 375, 0, 20)
		Main.BackgroundTransparency = 0
		TweenService:Create(
			Main,
			TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
			{Size = UDim2.new(0, 375, 0, 460)}
		):Play()
		repeat wait() until Main.Size == UDim2.new(0, 375, 0, 460)
		Tab.Visible = true
		Page.Visible = true

		local uihide = false
		local ScreenGui = Instance.new("ScreenGui")
		local ImageButton = Instance.new("ImageButton")

		ScreenGui.Parent = game.CoreGui

		ImageButton.Parent = ScreenGui
		ImageButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
		ImageButton.Size = UDim2.new(0, 50, 0, 50)
		ImageButton.BorderSizePixel = 0
		ImageButton.Image = "rbxassetid://13431833426" -- LOGO
		ImageButton.MouseButton1Down:connect(function()
			if uihide == false then
				uihide = true
				Tab.Visible = false
				Page.Visible = false
				TweenService:Create(
					Main,
					TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{Size = UDim2.new(0,375,0,0)}
				):Play()
				repeat wait() until Main.Size == UDim2.new(0,375,0,0)
				Main.BackgroundTransparency = 1
				TweenService:Create(
					Top,
					TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{Size = UDim2.new(0,0,0,20)}
				):Play()
			else
				uihide = false
				TweenService:Create(
					Top,
					TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{Size = UDim2.new(0, 375, 0, 20)}
				):Play()
				repeat wait() until Top.Size == UDim2.new(0, 375, 0, 20)
				Main.BackgroundTransparency = 0
				TweenService:Create(
					Main,
					TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{Size = UDim2.new(0, 375, 0, 460)}
				):Play()
				repeat wait() until Main.Size == UDim2.new(0, 375, 0, 460)
				Tab.Visible = true
				Page.Visible = true
			end
		end)

		local uitab = {}
		function uitab:AddTab(text)
			local TabButton = Instance.new("TextButton")
			TabButton.Name = "TabButton"
			TabButton.Parent = ScrollTab
			TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TabButton.BackgroundTransparency = 1.000
			TabButton.Size = UDim2.new(0, 80, 0, 25)
			TabButton.Font = Enum.Font.GothamSemibold
			TabButton.Text = text
			TabButton.TextColor3 = Color3.fromRGB(225, 225, 225)
			TabButton.TextSize = 14.000
			TabButton.TextTransparency = 0.5

			local MainPage = Instance.new("Frame")
			MainPage.Name = "MainPage"
			MainPage.Parent = pagesFolder
			MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			MainPage.BackgroundTransparency = 1.000
			MainPage.Size = UDim2.new(0, 365, 0, 395)
			MainPage.Visible = false

			local MainFramePage = Instance.new("ScrollingFrame")
			MainFramePage.Name = "MainFramePage"
			MainFramePage.Parent = MainPage
			MainFramePage.Active = true
			MainFramePage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			MainFramePage.BackgroundTransparency = 1.000
			MainFramePage.BorderSizePixel = 0
			MainFramePage.Size = UDim2.new(0, 365, 0, 395)
			MainFramePage.CanvasSize = UDim2.new(0, 0, 0, 0)
			MainFramePage.ScrollBarThickness = 0

			local PageListLayout = Instance.new("UIListLayout")
			PageListLayout.Name = "PageListLayout"
			PageListLayout.Padding = UDim.new(0, 15)
			PageListLayout.Parent = MainFramePage
			PageListLayout.SortOrder = Enum.SortOrder.LayoutOrder

			local PagePadding = Instance.new("UIPadding")
			PagePadding.Name = "PagePadding"
			PagePadding.Parent = MainFramePage
			PagePadding.PaddingLeft = UDim.new(0,15)
			PagePadding.PaddingTop = UDim.new(0,15)

			TabButton.MouseButton1Click:Connect(function()
				for i,v in next,pagesFolder:GetChildren() do
					if v.Name == "MainPage" then
						v.Visible = false
					end
					MainPage.Visible = true
				end
				for i,v in next,ScrollTab:GetChildren() do
					if v:IsA("TextButton") then
						TweenService:Create(
							v,
							TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{TextTransparency = 0.5}
						):Play()
					end
					TweenService:Create(
						TabButton,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end
			end)

			if isselected == false then
				for i,v in next,pagesFolder:GetChildren() do
					if v.Name == "MainPage" then
						v.Visible = false
					end
					MainPage.Visible = true
				end
				for i,v in next,ScrollTab:GetChildren() do
					if v:IsA("TextButton") then
						TweenService:Create(
							v,
							TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{TextTransparency = 0.5}
						):Play()
					end
					TweenService:Create(
						TabButton,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end
				isselected = true
			end

			game:GetService("RunService").Stepped:Connect(function()
				ScrollTab.CanvasSize = UDim2.new(0, TabListLayout.AbsoluteContentSize.X + 10, 0, 0)
				MainFramePage.CanvasSize = UDim2.new(0, 0, 0, PageListLayout.AbsoluteContentSize.Y + 30)
			end)

			local main = {}
			function main:AddButton(text,callback)
				local ButtonFrame = Instance.new("Frame")
				ButtonFrame.Name = "ButtonFrame"
				ButtonFrame.Parent = MainFramePage
				ButtonFrame.BackgroundColor3 = maincolor
				ButtonFrame.BorderSizePixel = 0
				ButtonFrame.Size = UDim2.new(0, 335, 0, 30)
				
				local UICorner = Instance.new("UICorner")
				UICorner.Parent = ButtonFrame
				UICorner.CornerRadius = UDim.new(0,5)
				
				local Button = Instance.new("TextButton")
				Button.Name = "Button"
				Button.Parent = ButtonFrame
				Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				Button.BorderSizePixel = 0
				Button.Position = UDim2.new(0, 1, 0, 1)
				Button.Size = UDim2.new(0, 333, 0, 28)
				Button.AutoButtonColor = false
				Button.Font = Enum.Font.GothamSemibold
				Button.Text = text
				Button.TextColor3 = Color3.fromRGB(225, 225, 225)
				Button.TextSize = 14.000

				local UICorner_2 = Instance.new("UICorner")
				UICorner_2.Parent = Button
				UICorner_2.CornerRadius = UDim.new(0,5)
				
				local Black = Instance.new("Frame")
				Black.Name = "Black"
				Black.Parent = Button
				Black.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				Black.BackgroundTransparency = 1.000
				Black.Size = UDim2.new(0, 335, 0, 28)

				Button.MouseEnter:Connect(function()
					TweenService:Create(
						Button,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextColor3 = maincolor}
					):Play()
					TweenService:Create(
						Black,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{BackgroundTransparency = 0.7}
					):Play()
				end)

				Button.MouseLeave:Connect(function()
					TweenService:Create(
						Button,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(225, 225, 225)}
					):Play()
					TweenService:Create(
						Black,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
				end)

				Button.MouseButton1Click:Connect(function()
					callback()
					Button.TextSize = 0
					TweenService:Create(
						Button,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextSize = 14}
					):Play()
				end)
			end

			function main:AddToggle(text,config,callback)
				config = config or false
				local istoggled = config

				local ToggleFrame = Instance.new("Frame")
				ToggleFrame.Name = "ToggleFrame"
				ToggleFrame.Parent = MainFramePage
				ToggleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleFrame.BackgroundTransparency = 1.000
				ToggleFrame.Size = UDim2.new(0, 335, 0, 25)

				local ToggleButton = Instance.new("TextButton")
				ToggleButton.Name = "ToggleButton"
				ToggleButton.Parent = ToggleFrame
				ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleButton.BackgroundTransparency = 1.000
				ToggleButton.Size = UDim2.new(0, 335, 0, 25)
				ToggleButton.Font = Enum.Font.SourceSans
				ToggleButton.Text = ""
				ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
				ToggleButton.TextSize = 14.000

				local ToggleLabel = Instance.new("TextLabel")
				ToggleLabel.Name = "ToggleLabel"
				ToggleLabel.Parent = ToggleFrame
				ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleLabel.BackgroundTransparency = 1.000
				ToggleLabel.Position = UDim2.new(0.0447761193, 0, 0, 0)
				ToggleLabel.Size = UDim2.new(0, 276, 0, 25)
				ToggleLabel.Font = Enum.Font.GothamSemibold
				ToggleLabel.Text = text
				ToggleLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
				ToggleLabel.TextSize = 15.000
				ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left

				local ToggleImage = Instance.new("Frame")
				ToggleImage.Name = "ToggleImage"
				ToggleImage.Parent = ToggleFrame
				ToggleImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
				ToggleImage.Position = UDim2.new(0, 290, 0, 1)
				ToggleImage.Size = UDim2.new(0, 46, 0, 21)

				local UICorner = Instance.new("UICorner")
				UICorner.CornerRadius = UDim.new(0, 10)
				UICorner.Parent = ToggleImage

				local Circle = Instance.new("Frame")
				Circle.Name = "Circle"
				Circle.Parent = ToggleImage
				Circle.BackgroundColor3 = Color3.fromRGB(233, 63, 63)
				Circle.Position = UDim2.new(0, 2, 0, 1)
				Circle.Size = UDim2.new(0, 19, 0, 19)

				local UICorner_2 = Instance.new("UICorner")
				UICorner_2.CornerRadius = UDim.new(0, 10)
				UICorner_2.Parent = Circle

				ToggleButton.MouseButton1Click:Connect(function()
					if istoggled == false then
						istoggled = true
						TweenService:Create(
							Circle,
							TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{Position = UDim2.new(0, 24, 0, 1)}
						):Play()
						TweenService:Create(
							Circle,
							TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{BackgroundColor3 = maincolor}
						):Play()
					else
						istoggled = false
						TweenService:Create(
							Circle,
							TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{Position = UDim2.new(0, 2, 0, 1)}
						):Play()
						TweenService:Create(
							Circle,
							TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(233, 63, 63)}
						):Play()
					end
					pcall(callback,istoggled)
				end)

				if config == true then
					if istoggled == false then
						istoggled = true
					end
					TweenService:Create(
						Circle,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Position = UDim2.new(0, 24, 0, 1)}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{BackgroundColor3 = maincolor}
					):Play()
					pcall(callback,istoggled)
				end
			end

			function main:AddDropdown(text,option,callback)
				local isdropping = false
				local Dropdown = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local DropTitle = Instance.new("TextLabel")
				local DropScroll = Instance.new("ScrollingFrame")
				local UIListLayout = Instance.new("UIListLayout")
				local UIPadding = Instance.new("UIPadding")
				local DropButton = Instance.new("TextButton")
				local DropImage = Instance.new("ImageLabel")
				
				Dropdown.Name = "Dropdown"
				Dropdown.Parent = MainFramePage
				Dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				Dropdown.ClipsDescendants = true
				Dropdown.Size = UDim2.new(0, 335, 0, 30)
				
				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = Dropdown
				
				DropTitle.Name = "DropTitle"
				DropTitle.Parent = Dropdown
				DropTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropTitle.BackgroundTransparency = 1.000
				DropTitle.Size = UDim2.new(0, 335, 0, 30)
				DropTitle.Font = Enum.Font.GothamSemibold
				DropTitle.Text = text.. " : "
				DropTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
				DropTitle.TextSize = 15.000
				DropTitle.TextXAlignment = Enum.TextXAlignment.Left

				local UIPaddingHAHA = Instance.new("UIPadding")
				UIPaddingHAHA.Parent = DropTitle
				UIPaddingHAHA.Name = "UIPaddingHAHA"
				UIPaddingHAHA.PaddingLeft = UDim.new(0,15)
				
				DropScroll.Name = "DropScroll"
				DropScroll.Parent = Dropdown
				DropScroll.Active = true
				DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropScroll.BackgroundTransparency = 1.000
				DropScroll.BorderSizePixel = 0
				DropScroll.Position = UDim2.new(0, 0, 0, 31)
				DropScroll.Size = UDim2.new(0, 335, 0, 70)
				DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
				DropScroll.ScrollBarThickness = 3
				
				UIListLayout.Parent = DropScroll
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 5)
				
				UIPadding.Parent = DropScroll
				UIPadding.PaddingLeft = UDim.new(0, 5)
				UIPadding.PaddingTop = UDim.new(0, 5)
				
				DropImage.Name = "DropImage"
				DropImage.Parent = Dropdown
				DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropImage.BackgroundTransparency = 1.000
				DropImage.Position = UDim2.new(0, 305, 0, 5)
				DropImage.Rotation = 180.000
				DropImage.Size = UDim2.new(0, 20, 0, 20)
				DropImage.Image = "rbxassetid://6031090990"
				
				DropButton.Name = "DropButton"
				DropButton.Parent = Dropdown
				DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropButton.BackgroundTransparency = 1.000
				DropButton.Size = UDim2.new(0, 335, 0, 30)
				DropButton.Font = Enum.Font.SourceSans
				DropButton.Text = ""
				DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
				DropButton.TextSize = 14.000

				for i,v in next,option do
					local Item = Instance.new("TextButton")

					Item.Name = "Item"
					Item.Parent = DropScroll
					Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Item.BackgroundTransparency = 1.000
					Item.Size = UDim2.new(0, 335, 0, 26)
					Item.Font = Enum.Font.GothamSemibold
					Item.Text = tostring(v)
					Item.TextColor3 = Color3.fromRGB(225, 225, 225)
					Item.TextSize = 13.000
					Item.TextTransparency = 0.500

					Item.MouseEnter:Connect(function()
						TweenService:Create(
							Item,
							TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{TextTransparency = 0}
						):Play()
					end)

					Item.MouseLeave:Connect(function()
						TweenService:Create(
							Item,
							TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{TextTransparency = 0.5}
						):Play()
					end)

					Item.MouseButton1Click:Connect(function()
						isdropping = false
						Dropdown:TweenSize(UDim2.new(0,335,0,30),"Out","Quad",0.3,true)
						TweenService:Create(
							DropImage,
							TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{Rotation = 180}
						):Play()
						callback(Item.Text)
						DropTitle.Text = text.." : "..Item.Text
					end)
				end

				DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)

				DropButton.MouseButton1Click:Connect(function()
					if isdropping == false then
						isdropping = true
						Dropdown:TweenSize(UDim2.new(0,335,0,100),"Out","Quad",0.3,true)
						TweenService:Create(
							DropImage,
							TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{Rotation = 0}
						):Play()
					else
						isdropping = false
						Dropdown:TweenSize(UDim2.new(0,335,0,30),"Out","Quad",0.3,true)
						TweenService:Create(
							DropImage,
							TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{Rotation = 180}
						):Play()
					end
				end)

				local dropfunc = {}
				function dropfunc:Add(t)
					local Item = Instance.new("TextButton")
					Item.Name = "Item"
					Item.Parent = DropScroll
					Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Item.BackgroundTransparency = 1.000
					Item.Size = UDim2.new(0, 335, 0, 26)
					Item.Font = Enum.Font.GothamSemibold
					Item.Text = tostring(t)
					Item.TextColor3 = Color3.fromRGB(225, 225, 225)
					Item.TextSize = 13.000
					Item.TextTransparency = 0.500

					Item.MouseEnter:Connect(function()
						TweenService:Create(
							Item,
							TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{TextTransparency = 0}
						):Play()
					end)

					Item.MouseLeave:Connect(function()
						TweenService:Create(
							Item,
							TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{TextTransparency = 0.5}
						):Play()
					end)

					Item.MouseButton1Click:Connect(function()
						isdropping = false
						Dropdown:TweenSize(UDim2.new(0,335,0,30),"Out","Quad",0.3,true)
						TweenService:Create(
							DropImage,
							TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{Rotation = 180}
						):Play()
						callback(Item.Text)
						DropTitle.Text = text.." : "..Item.Text
					end)
				end
				function dropfunc:Clear()
					DropTitle.Text = tostring(text).." : "
					isdropping = false
					Dropdown:TweenSize(UDim2.new(0,335,0,30),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
					for i,v in next, DropScroll:GetChildren() do
						if v:IsA("TextButton") then
							v:Destroy()
						end
					end
				end
				return dropfunc
			end
			function main:AddSlider(text,min,max,set,callback)
				local Slider = Instance.new("Frame")
				local slidercorner = Instance.new("UICorner")
				local sliderr = Instance.new("Frame")
				local sliderrcorner = Instance.new("UICorner")
				local SliderLabel = Instance.new("TextLabel")
				local HAHA = Instance.new("Frame")
				local AHEHE = Instance.new("TextButton")
				local bar = Instance.new("Frame")
				local bar1 = Instance.new("Frame")
				local bar1corner = Instance.new("UICorner")
				local barcorner = Instance.new("UICorner")
				local circlebar = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local slidervalue = Instance.new("Frame")
				local valuecorner = Instance.new("UICorner")
				local TextBox = Instance.new("TextBox")
				local UICorner_2 = Instance.new("UICorner")

				Slider.Name = "Slider"
				Slider.Parent = MainFramePage
				Slider.BackgroundColor3 = maincolor
				Slider.BackgroundTransparency = 0
				Slider.Size = UDim2.new(0, 335, 0, 51)

				slidercorner.CornerRadius = UDim.new(0, 5)
				slidercorner.Name = "slidercorner"
				slidercorner.Parent = Slider

				sliderr.Name = "sliderr"
				sliderr.Parent = Slider
				sliderr.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				sliderr.Position = UDim2.new(0, 1, 0, 1)
				sliderr.Size = UDim2.new(0, 333, 0, 49)

				sliderrcorner.CornerRadius = UDim.new(0, 5)
				sliderrcorner.Name = "sliderrcorner"
				sliderrcorner.Parent = sliderr

				SliderLabel.Name = "SliderLabel"
				SliderLabel.Parent = sliderr
				SliderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderLabel.BackgroundTransparency = 1.000
				SliderLabel.Position = UDim2.new(0, 15, 0, 0)
				SliderLabel.Size = UDim2.new(0, 180, 0, 26)
				SliderLabel.Font = Enum.Font.GothamSemibold
				SliderLabel.Text = text
				SliderLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
				SliderLabel.TextSize = 16.000
				SliderLabel.TextTransparency = 0
				SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

				HAHA.Name = "HAHA"
				HAHA.Parent = sliderr
				HAHA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				HAHA.BackgroundTransparency = 1.000
				HAHA.Size = UDim2.new(0, 333, 0, 29)

				AHEHE.Name = "AHEHE"
				AHEHE.Parent = sliderr
				AHEHE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				AHEHE.BackgroundTransparency = 1.000
				AHEHE.Position = UDim2.new(0, 10, 0, 35)
				AHEHE.Size = UDim2.new(0, 313, 0, 5)
				AHEHE.Font = Enum.Font.SourceSans
				AHEHE.Text = ""
				AHEHE.TextColor3 = Color3.fromRGB(0, 0, 0)
				AHEHE.TextSize = 14.000

				bar.Name = "bar"
				bar.Parent = AHEHE
				bar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				bar.Size = UDim2.new(0, 313, 0, 5)

				bar1.Name = "bar1"
				bar1.Parent = bar
				bar1.BackgroundColor3 = maincolor
				bar1.BackgroundTransparency = 0
				bar1.Size = UDim2.new(set/max, 0, 0, 5)

				bar1corner.CornerRadius = UDim.new(0, 5)
				bar1corner.Name = "bar1corner"
				bar1corner.Parent = bar1

				barcorner.CornerRadius = UDim.new(0, 5)
				barcorner.Name = "barcorner"
				barcorner.Parent = bar

				circlebar.Name = "circlebar"
				circlebar.Parent = bar1
				circlebar.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
				circlebar.Position = UDim2.new(1, -2, 0, -3)
				circlebar.Size = UDim2.new(0, 10, 0, 10)

				UICorner.CornerRadius = UDim.new(0, 100)
				UICorner.Parent = circlebar

				slidervalue.Name = "slidervalue"
				slidervalue.Parent = sliderr
				slidervalue.BackgroundColor3 = maincolor
				slidervalue.BackgroundTransparency = 0
				slidervalue.Position = UDim2.new(0, 265, 0, 5)
				slidervalue.Size = UDim2.new(0, 65, 0, 18)

				valuecorner.CornerRadius = UDim.new(0, 5)
				valuecorner.Name = "valuecorner"
				valuecorner.Parent = slidervalue

				TextBox.Parent = slidervalue
				TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				TextBox.Position = UDim2.new(0, 1, 0, 1)
				TextBox.Size = UDim2.new(0, 63, 0, 16)
				TextBox.Font = Enum.Font.GothamSemibold
				TextBox.TextColor3 = Color3.fromRGB(225, 225, 225)
				TextBox.TextSize = 9.000
				TextBox.Text = set
				TextBox.TextTransparency = 0

				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = TextBox

				local mouse = game.Players.LocalPlayer:GetMouse()
				local uis = game:GetService("UserInputService")

				if Value == nil then
					Value = set
					pcall(function()
						callback(Value)
					end)
				end
				
				AHEHE.MouseButton1Down:Connect(function()
					Value = math.floor((((tonumber(max) - tonumber(min)) / 315) * bar1.AbsoluteSize.X) + tonumber(min)) or 0
					pcall(function()
						callback(Value)
					end)
					bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 315), 0, 5)
					circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 305), 0, -3)
					moveconnection = mouse.Move:Connect(function()
						TextBox.Text = Value
						Value = math.floor((((tonumber(max) - tonumber(min)) / 315) * bar1.AbsoluteSize.X) + tonumber(min))
						pcall(function()
							callback(Value)
						end)
						bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 315), 0, 5)
						circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 305), 0, -3)
					end)
					releaseconnection = uis.InputEnded:Connect(function(Mouse)
						if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
							Value = math.floor((((tonumber(max) - tonumber(min)) / 315) * bar1.AbsoluteSize.X) + tonumber(min))
							pcall(function()
								callback(Value)
							end)
							bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 315), 0, 5)
							circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 305), 0, -3)
							moveconnection:Disconnect()
							releaseconnection:Disconnect()
						end
					end)
				end)
				releaseconnection = uis.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
						Value = math.floor((((tonumber(max) - tonumber(min)) / 315) * bar1.AbsoluteSize.X) + tonumber(min))
						TextBox.Text = Value
					end
				end)

				TextBox.FocusLost:Connect(function()
					if tonumber(TextBox.Text) > max then
						TextBox.Text  = max
					end
					bar1.Size = UDim2.new((TextBox.Text or 0) / max, 0, 0, 5)
					circlebar.Position = UDim2.new(1, -2, 0, -3)
					TextBox.Text = tostring(TextBox.Text and math.floor( (TextBox.Text / max) * (max - min) + min) )
					pcall(callback, TextBox.Text)
				end)
			end

			function main:AddTextbox(text,disappear,callback)
				local Textbox = Instance.new("Frame")
				local TextboxCorner = Instance.new("UICorner")
				local Textboxx = Instance.new("Frame")
				local TextboxxCorner = Instance.new("UICorner")
				local TextboxLabel = Instance.new("TextLabel")
				local txtbtn = Instance.new("TextButton")
				local RealTextbox = Instance.new("TextBox")
				local UICorner = Instance.new("UICorner")

				Textbox.Name = "Textbox"
				Textbox.Parent = MainFramePage
				Textbox.BackgroundColor3 = maincolor
				Textbox.BackgroundTransparency = 0
				Textbox.Size = UDim2.new(0, 335, 0, 31)

				TextboxCorner.CornerRadius = UDim.new(0, 5)
				TextboxCorner.Name = "TextboxCorner"
				TextboxCorner.Parent = Textbox

				Textboxx.Name = "Textboxx"
				Textboxx.Parent = Textbox
				Textboxx.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				Textboxx.Position = UDim2.new(0, 1, 0, 1)
				Textboxx.Size = UDim2.new(0, 333, 0, 29)

				TextboxxCorner.CornerRadius = UDim.new(0, 5)
				TextboxxCorner.Name = "TextboxxCorner"
				TextboxxCorner.Parent = Textboxx

				TextboxLabel.Name = "TextboxLabel"
				TextboxLabel.Parent = Textbox
				TextboxLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextboxLabel.BackgroundTransparency = 1.000
				TextboxLabel.Position = UDim2.new(0, 15, 0, 0)
				TextboxLabel.Text = text
				TextboxLabel.Size = UDim2.new(0, 145, 0, 31)
				TextboxLabel.Font = Enum.Font.GothamSemibold
				TextboxLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
				TextboxLabel.TextSize = 16.000
				TextboxLabel.TextTransparency = 0
				TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left

				txtbtn.Name = "txtbtn"
				txtbtn.Parent = Textbox
				txtbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				txtbtn.BackgroundTransparency = 1.000
				txtbtn.Position = UDim2.new(0, 1, 0, 1)
				txtbtn.Size = UDim2.new(0, 333, 0, 29)
				txtbtn.Font = Enum.Font.SourceSans
				txtbtn.Text = ""
				txtbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
				txtbtn.TextSize = 14.000

				RealTextbox.Name = "RealTextbox"
				RealTextbox.Parent = Textbox
				RealTextbox.ClipsDescendants = true
				RealTextbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				RealTextbox.BackgroundTransparency = 0
				RealTextbox.Position = UDim2.new(0, 255, 0, 6)
				RealTextbox.Size = UDim2.new(0, 75, 0, 20)
				RealTextbox.Font = Enum.Font.GothamSemibold
				RealTextbox.Text = ""
				RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
				RealTextbox.TextSize = 11.000
				RealTextbox.TextTransparency = 0

				RealTextbox.FocusLost:Connect(function()
					callback(RealTextbox.Text)
					if disappear then
						RealTextbox.Text = ""
					end
				end)

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = RealTextbox
			end
			function main:AddLabel(text)
				local Label = Instance.new("TextLabel")
				local PaddingLabel = Instance.new("UIPadding")
				local labell = {}
		
				Label.Name = "Label"
				Label.Parent = MainFramePage
				Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Label.BackgroundTransparency = 1.000
				Label.Size = UDim2.new(0, 335, 0, 20)
				Label.Font = Enum.Font.GothamSemibold
				Label.TextColor3 = Color3.fromRGB(225, 225, 225)
				Label.TextSize = 16.000
				Label.Text = text
				Label.TextXAlignment = Enum.TextXAlignment.Left

				PaddingLabel.PaddingLeft = UDim.new(0,15)
				PaddingLabel.Parent = Label
				PaddingLabel.Name = "PaddingLabel"
		
				function labell:Set(newtext)
					Label.Text = newtext
				end

				return labell
			end
			function main:AddSeperator(text)
				local Seperator = Instance.new("Frame")
				local Sep1 = Instance.new("Frame")
				local Sep2 = Instance.new("TextLabel")
				local Sep3 = Instance.new("Frame")
				
				Seperator.Name = "Seperator"
				Seperator.Parent = MainFramePage
				Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Seperator.BackgroundTransparency = 1.000
				Seperator.Size = UDim2.new(0, 335, 0, 20)
				
				Sep1.Name = "Sep1"
				Sep1.Parent = Seperator
				Sep1.BackgroundColor3 = maincolor
				Sep1.BorderSizePixel = 0
				Sep1.Position = UDim2.new(0, 0, 0, 10)
				Sep1.Size = UDim2.new(0, 80, 0, 1)
				
				Sep2.Name = "Sep2"
				Sep2.Parent = Seperator
				Sep2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Sep2.BackgroundTransparency = 1.000
				Sep2.Position = UDim2.new(0, 120, 0, 0)
				Sep2.Size = UDim2.new(0, 100, 0, 20)
				Sep2.Font = Enum.Font.GothamSemibold
				Sep2.Text = text
				Sep2.TextColor3 = Color3.fromRGB(255, 255, 255)
				Sep2.TextSize = 14.000
				
				Sep3.Name = "Sep3"
				Sep3.Parent = Seperator
				Sep3.BackgroundColor3 = maincolor
				Sep3.BorderSizePixel = 0
				Sep3.Position = UDim2.new(0, 255, 0, 10)
				Sep3.Size = UDim2.new(0, 80, 0, 1)
			end

			function main:AddLine()
				local Linee = Instance.new("Frame")
				local Line = Instance.new("Frame")
				
				Linee.Name = "Linee"
				Linee.Parent = MainFramePage
				Linee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Linee.BackgroundTransparency = 1.000
				Linee.Position = UDim2.new(0, 0, 0.119999997, 0)
				Linee.Size = UDim2.new(0, 335, 0, 20)
				
				Line.Name = "Line"
				Line.Parent = Linee
				Line.BackgroundColor3 = maincolor
				Line.BorderSizePixel = 0
				Line.Position = UDim2.new(0, 0, 0, 10)
				Line.Size = UDim2.new(0, 335, 0, 1)
			end
			return main
		end
		return uitab
	end
	game:GetService("Players").LocalPlayer.Idled:connect(function()
		game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		wait(1)
		game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	end)
	--------------------------------------------------------------------
	local RenUi = library:CreateWindow("Fenril  ",Color3.fromRGB(175,238,238),"Demon Soul Simulator !")
	--------------------------------------------------------------------
	local Main = RenUi:AddTab("Main")
	--local Combat = RenUi:AddTab("Combat")
	--local Stats = RenUi:AddTab("Stats")
	--local Teleport = RenUi:AddTab("Teleport")
	--local Dungeon = RenUi:AddTab("Dungeon")
	--local DevilFruit = RenUi:AddTab("Devil Fruit")
	--local Shop = RenUi:AddTab("Shop")
	--local Misc = RenUi:AddTab("Misc")
	--------------------------------------------------------------------
	Main:AddSeperator("Credits Ui : Maru Hub")
	Main:AddSeperator("Script : Fenril Hub by Kaito")
	Main:AddSeperator("Main")

	local Boots = {}

	for i,v in pairs(game:GetService("ReplicatedStorage").PlayerData:GetChildren()) do  
		if v.Name ~= game:GetService("ReplicatedStorage").PlayerData.Name then
			table.insert(Boots ,v.Name)
		end
	end
	local BootsName = Main:AddDropdown("Select Player",Boots,function(value)
		_G.Player_Gamepasses = value
	end)

	Main:AddButton("Refresh Player",function()
		BootsName:Clear()
		for i,v in pairs(game:GetService("ReplicatedStorage").PlayerData:GetChildren()) do  
			if v.Name ~= game:GetService("ReplicatedStorage").PlayerData.Name then
				table.insert(Boots ,v.Name)
				BootsName:Add(v.Name) 
			end
		end
	end)
	Main:AddButton("Auto Gamepasses",function()
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
		end
	end)

	Main:AddButton("Auto Soul",function()
		local args = {
			[1] = "SoulCount",
			[2] = "1000000000"
		}
		game:GetService("ReplicatedStorage").RemoteEvents.Setting:FireServer(unpack(args))
	end)
	Main:AddButton("Auto Boots",function()
		local args = {
			[1] = "Temp_UltimateLuck",
			[2] = "960000000" 
		}
		game:GetService("ReplicatedStorage").RemoteEvents.Setting:FireServer(unpack(args))
		local args = {
			[1] = "Temp_PrimaryLuck",
			[2] = "960000000" 
		}
		game:GetService("ReplicatedStorage").RemoteEvents.Setting:FireServer(unpack(args))
		local args = {
			[1] = "Temp_DoubleExp",
			[2] = "960000000" 
		}
		game:GetService("ReplicatedStorage").RemoteEvents.Setting:FireServer(unpack(args))
		local args = {
			[1] = "Temp_MoveSpeed",
			[2] = "960000000" 
		}
		game:GetService("ReplicatedStorage").RemoteEvents.Setting:FireServer(unpack(args))
	end)

	Main:AddSeperator("Unlock")

	Main:AddButton("Doma Unlock Premium",function()
		local args = {
			[1] = "TrainTop3RankCount",
			[2] = "20"
		}
		game:GetService("ReplicatedStorage").RemoteEvents.Setting:FireServer(unpack(args))
		wait()
		for i=1,3 do
			game:GetService("ReplicatedStorage").RemoteEvents.ReceiveSeasonTop3Reward:FireServer(i)
		end
	end)
	Main:AddButton("Pet Unlock all Premium",function()
		local args = {
			[1] = "OwnPetInfo",
			[2] = "[{\"PetId\":16,\"Version\":323,\"Level\":3},{\"PetId\":13,\"Version\":323,\"Level\":3},{\"PetId\":6,\"Version\":323,\"Level\":3},{\"PetId\":8,\"Version\":323,\"Level\":3}]"
		}
		game:GetService("ReplicatedStorage").RemoteEvents.Setting:FireServer(unpack(args))
	end)
	Main:AddButton("Auto Skin Premium",function()
		local args = {
			[1] = "OwnSkinInfo",
			[2] = "[0,24,28,27,21,18,17,26,16,15,14,13,12,8,7,4,2,1,19,23,11,9,6]"
		}
		game:GetService("ReplicatedStorage").RemoteEvents.Setting:FireServer(unpack(args))
	end)

	Main:AddSeperator("Teleport")

	Main:AddButton("Rejoin",function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer) 
	end)
	Main:AddButton("Copy discord invite",function()
		setclipboard('https://discord.gg/sFGtUyEqD8')
	end)
	Main:AddButton("Go To discord [app]",function()
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
u()
