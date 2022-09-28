-- // Hexavate UI, Designed By Hexermaster1929. Property Of HexHub Softworks, Any Tampering Will Lead To A Permanant HexHub Blacklist! \\--

local Lib = {}

--[[local DetectedUIStrokes = {}
function FixStrokes(Parent)
	for i,v in pairs(Parent:GetChildren()) do
		if v:IsA("UIStroke") then
		table.insert(DetectedUIStrokes,v)
		
	end
		for i = 1, #DetectedUIStrokes do
			DetectedUIStrokes[i].Transparency = 0.75
		end
		FixStrokes(v)
	end
end]]--

local UIS = game:GetService("UserInputService")
function drag (Frame)
	local dragToggle = nil
	local dragSpeed = 0.23
	local dragInput = nil
	local dragStart = nil
	local dragPos = nil
	local function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.25), {Position = Position}):Play()
	end
	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end

local uiclicksfx = Instance.new("Sound")
uiclicksfx.PlaybackSpeed = 1.75
uiclicksfx.RollOffMaxDistance = 24
uiclicksfx.SoundId = "rbxassetid://144130810"
uiclicksfx.Name = "UICLICKSFX"
uiclicksfx.Parent = workspace

local tremolo_effect = Instance.new("TremoloSoundEffect")
tremolo_effect.Name = "TremoloEffect"
tremolo_effect.Parent = uiclicksfx

ButtonAudioToggle = true

function ButtonSFX()
	if ButtonAudioToggle then
		uiclicksfx:Play()
	end
end



local notification_v2 = Instance.new("ScreenGui")
notification_v2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
notification_v2.Name = "NotificationV2"
notification_v2.Parent = game.Players.LocalPlayer.PlayerGui
notification_v2.IgnoreGuiInset = true

local notification_holder = Instance.new("Frame")
notification_holder.AnchorPoint = Vector2.new(1, 1)
notification_holder.BackgroundColor3 = Color3.new(1, 1, 1)
notification_holder.BackgroundTransparency = 1
notification_holder.ClipsDescendants = true
notification_holder.Position = UDim2.new(1,0,1,0)
notification_holder.Size = UDim2.new(0, 306,0, 420)
notification_holder.Name = "NotificationHolder"
notification_holder.Parent = notification_v2

local NotifListLayout = Instance.new("UIListLayout")
NotifListLayout.Padding = UDim.new(0, 10)
NotifListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
NotifListLayout.SortOrder = Enum.SortOrder.LayoutOrder
NotifListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
NotifListLayout.Parent = notification_holder

local NotifPadding = Instance.new("UIPadding")
NotifPadding.PaddingBottom = UDim.new(0, 10)
NotifPadding.PaddingLeft = UDim.new(0, 10)
NotifPadding.PaddingRight = UDim.new(0, 10)
NotifPadding.PaddingTop = UDim.new(0, 10)
NotifPadding.Parent = notification_holder

function Lib:MakeNotification(Title,Desc,Icon,NotificationTime)

	local notification = Instance.new("Frame")
	notification.AnchorPoint = Vector2.new(0.5, 0.5)
	notification.BackgroundColor3 = Color3.new(0.27451, 0.27451, 0.27451)
	notification.Position = UDim2.new(0.479150534, 0, 0.73004353, 0)
	notification.Size = UDim2.new(0, 0, 0, 0)
	notification.Name = "Notification"
	notification.Parent = notification_holder
	notification.Visible = false

	local uicorner = Instance.new("UICorner")
	uicorner.CornerRadius = UDim.new(0, 7)
	uicorner.Parent = notification

	local uistroke = Instance.new("UIStroke")
	uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uistroke.Parent = notification
	uistroke.Transparency = 0.6

	local loader_title = Instance.new("TextLabel")
	loader_title.Font = Enum.Font.Gotham
	loader_title.Text = Title
	loader_title.TextColor3 = Color3.new(1, 1, 1)
	loader_title.TextScaled = true
	loader_title.TextSize = 14
	loader_title.TextWrapped = true
	loader_title.AnchorPoint = Vector2.new(0.5, 0.5)
	loader_title.BackgroundColor3 = Color3.new(1, 1, 1)
	loader_title.BackgroundTransparency = 1
	loader_title.Position = UDim2.new(0.633238435, 0, 0.285225958, 0)
	loader_title.Size = UDim2.new(0, 196, 0, 32)
	loader_title.Name = "LoaderTitle"
	loader_title.Parent = notification
	loader_title.TextTransparency = 1

	local loader_ico = Instance.new("ImageLabel")
	loader_ico.Image = "rbxassetid://"..tostring(Icon)
	loader_ico.ScaleType = Enum.ScaleType.Fit
	loader_ico.AnchorPoint = Vector2.new(0.5, 0.5)
	loader_ico.BackgroundColor3 = Color3.new(1, 1, 1)
	loader_ico.BackgroundTransparency = 1
	loader_ico.Position = UDim2.new(0.15316844, 0, 0.49355942, 0)
	loader_ico.Size = UDim2.new(0, 0, 0, 0)
	loader_ico.Name = "LoaderIco"
	loader_ico.Parent = notification
loader_ico.Visible = false

	local uistroke_2 = Instance.new("UIStroke")
	uistroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uistroke_2.Parent = loader_ico
	uistroke_2.Transparency = 0.6

	local uicorner_2 = Instance.new("UICorner")
	uicorner_2.CornerRadius = UDim.new(0, 7)
	uicorner_2.Parent = loader_ico

	local loader_title_2 = Instance.new("TextLabel")
	loader_title_2.Font = Enum.Font.Gotham
	loader_title_2.Text = Desc
	loader_title_2.TextColor3 = Color3.new(1, 1, 1)
	loader_title_2.TextScaled = true
	loader_title_2.TextSize = 14
	loader_title_2.TextWrapped = true
	loader_title_2.AnchorPoint = Vector2.new(0.5, 0.5)
	loader_title_2.BackgroundColor3 = Color3.new(1, 1, 1)
	loader_title_2.BackgroundTransparency = 1
	loader_title_2.Position = UDim2.new(0.633238435, 0, 0.677271783, 0)
	loader_title_2.Size = UDim2.new(0, 196, 0, 37)
	loader_title_2.Name = "LoaderTitle"
	loader_title_2.Parent = notification
	loader_title_2.TextTransparency = 1

	wait()
	ButtonSFX()
	notification.Visible = true
	game.TweenService:Create(notification, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 279, 0, 88),}):Play()
	wait(.4)
	loader_ico.Visible = true
	game.TweenService:Create(loader_title, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0,}):Play()
	game.TweenService:Create(loader_title_2, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0,}):Play()
	game.TweenService:Create(loader_ico, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 58, 0, 58),}):Play()
	
	wait(NotificationTime)

	game.TweenService:Create(loader_title, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 1,}):Play()
	game.TweenService:Create(loader_title_2, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 1,}):Play()
	game.TweenService:Create(loader_ico, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 0),}):Play()
	wait(.4)
	loader_ico.Visible = false
	game.TweenService:Create(notification, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 279, 0, 88),}):Play()
	wait(.4)
	notification:Destroy()
end

function Lib.CreateWindow(WindowName,IntroTitle,IntroIcon,IntroDesc,LoaderTime)
	local hexavate_ui = Instance.new("ScreenGui")
	hexavate_ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	hexavate_ui.Name = "HexavateUI"
	hexavate_ui.Parent = game.Players.LocalPlayer.PlayerGui
	
	
	
		local IntroText = IntroTitle or "Hexavate UI"
		local DescriptText = IntroDesc or "By hexHub Softworks"
		local LoaderImage = IntroIcon or "rbxassetid://11091925001"
		local LoaderOpenTime = LoaderTime or 6.5
		
		local hexavate_loader = Instance.new("Frame")
		hexavate_loader.AnchorPoint = Vector2.new(0.5, 0.5)
		hexavate_loader.BackgroundColor3 = Color3.new(0.27451, 0.27451, 0.27451)
		hexavate_loader.Position = UDim2.new(0.5, 0, 0.5, 0)
		hexavate_loader.Name = "HexavateLoader"
		hexavate_loader.Parent = hexavate_ui
	hexavate_loader.Visible = false
	

		local uicorner = Instance.new("UICorner")
		uicorner.CornerRadius = UDim.new(0, 7)
		uicorner.Parent = hexavate_loader

		local uistroke = Instance.new("UIStroke")
		uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uistroke.Parent = hexavate_loader
		uistroke.Transparency = 0.6

		local loader_title = Instance.new("TextLabel")
		loader_title.Font = Enum.Font.Gotham
		loader_title.Text = IntroText
		loader_title.TextColor3 = Color3.new(1, 1, 1)
		loader_title.TextScaled = true
		loader_title.TextSize = 14
		loader_title.TextTransparency = 1
		loader_title.TextWrapped = true
		loader_title.AnchorPoint = Vector2.new(0.5, 0.5)
		loader_title.BackgroundColor3 = Color3.new(1, 1, 1)
		loader_title.BackgroundTransparency = 1
		loader_title.Position = UDim2.new(0.637742996, 0, 0.33068037, 0)
		loader_title.Size = UDim2.new(0, 163, 0, 28)
		loader_title.Name = "LoaderTitle"
		loader_title.Parent = hexavate_loader

		local desc_text = Instance.new("TextLabel")
		desc_text.Font = Enum.Font.Gotham
		desc_text.Text = DescriptText
		desc_text.TextColor3 = Color3.new(1, 1, 1)
		desc_text.TextScaled = true
		desc_text.TextSize = 14
		desc_text.TextTransparency = 1
		desc_text.TextWrapped = true
		desc_text.AnchorPoint = Vector2.new(0.5, 0.5)
		desc_text.BackgroundColor3 = Color3.new(1, 1, 1)
		desc_text.BackgroundTransparency = 1
		desc_text.Position = UDim2.new(0.707217336, 0, 0.730680346, 0)
		desc_text.Size = UDim2.new(0, 129, 0, 25)
		desc_text.Name = "DescText"
		desc_text.Parent = hexavate_loader

		local loader_ico = Instance.new("ImageLabel")
		loader_ico.Image = LoaderImage
		loader_ico.ScaleType = Enum.ScaleType.Fit
		loader_ico.AnchorPoint = Vector2.new(0.5, 0.5)
		loader_ico.BackgroundColor3 = Color3.new(1, 1, 1)
		loader_ico.BackgroundTransparency = 1
		loader_ico.Position = UDim2.new(0.132825539, 0, 0.497347027, 0)
		loader_ico.Name = "LoaderIco"
		loader_ico.Parent = hexavate_loader
		loader_ico.Visible = false

		local uistroke_2 = Instance.new("UIStroke")
		uistroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uistroke_2.Parent = loader_ico
		uistroke_2.Transparency = 0.6

		local uicorner_2 = Instance.new("UICorner")
		uicorner_2.CornerRadius = UDim.new(0, 7)
		uicorner_2.Parent = loader_ico
		
		wait(.2)
		hexavate_loader.Visible = true
		game.TweenService:Create(hexavate_loader, 
			
			TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), 
			
			{Size = UDim2.new(0,248,0,60),}):Play()
		
		wait(.3)
		
		loader_ico.Visible = true
		
		game.TweenService:Create(loader_ico, 

			TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), 

			{Size = UDim2.new(0,48,0,48),}):Play()
		
		wait(.2)
		
		game.TweenService:Create(loader_title, 

			TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), 

			{TextTransparency = 0,}):Play()
		
		game.TweenService:Create(desc_text, 

			TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), 

			{TextTransparency = 0,}):Play()
		
		wait(LoaderOpenTime)
		
		game.TweenService:Create(loader_title, 

			TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), 

			{TextTransparency = 1,}):Play()

		game.TweenService:Create(desc_text, 

			TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), 

			{TextTransparency = 1,}):Play()
		
		wait(.2)
		
		

		game.TweenService:Create(loader_ico, 

			TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), 

			{Size = UDim2.new(0,0,0,0),}):Play()
		
		wait(.6)
		
		loader_ico.Visible = false
		
		
		game.TweenService:Create(hexavate_loader, 

			TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), 

			{Size = UDim2.new(0,0,0,0),}):Play()
		hexavate_loader.Visible = false
		
		wait(.2)
		
		local library_window = Instance.new("Frame")
		library_window.BackgroundColor3 = Color3.new(0.243137, 0.243137, 0.243137)
		library_window.Position = UDim2.new(0.257142842, 0, 0.227866516, 0)
		library_window.Size = UDim2.new(0, 567, 0, 345)
		library_window.Name = "LibraryWindow"
	library_window.Parent = hexavate_ui
	library_window.ClipsDescendants = true

		local uicorner = Instance.new("UICorner")
		uicorner.CornerRadius = UDim.new(0, 7)
		uicorner.Parent = library_window

		local uistroke = Instance.new("UIStroke")
		uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uistroke.Parent = library_window
		uistroke.Transparency = 0.6

		local library_title = Instance.new("TextLabel")
		library_title.Font = Enum.Font.Gotham
		library_title.Text = WindowName
		library_title.TextColor3 = Color3.new(1, 1, 1)
		library_title.TextScaled = true
		library_title.TextSize = 14
		library_title.TextWrapped = true
		library_title.TextXAlignment = Enum.TextXAlignment.Left
		library_title.BackgroundColor3 = Color3.new(1, 1, 1)
		library_title.BackgroundTransparency = 1
		library_title.Position = UDim2.new(0.0403415971, 0, 0.0306803398, 0)
		library_title.Size = UDim2.new(0, 365, 0, 28)
		library_title.Name = "LibraryTitle"
		library_title.Parent = library_window

		local tab_buttons = Instance.new("Frame")
		tab_buttons.BackgroundColor3 = Color3.new(0.243137, 0.243137, 0.243137)
		tab_buttons.BackgroundTransparency = 0.9900000095367432
		tab_buttons.ClipsDescendants = true
		tab_buttons.Position = UDim2.new(0.040666908, 0, 0.13385956, 0)
		tab_buttons.Size = UDim2.new(0, 109, 0, 276)
		tab_buttons.Name = "TabButtons"
		tab_buttons.Parent = library_window

		local uicorner_2 = Instance.new("UICorner")
		uicorner_2.CornerRadius = UDim.new(0, 7)
		uicorner_2.Parent = tab_buttons

		local uistroke_2 = Instance.new("UIStroke")
		uistroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uistroke_2.Parent = tab_buttons
		uistroke_2.Transparency = 0.6

		local uipadding = Instance.new("UIPadding")
		uipadding.PaddingBottom = UDim.new(0, 7)
		uipadding.PaddingTop = UDim.new(0, 7)
		uipadding.Parent = tab_buttons

		local uilist_layout = Instance.new("UIListLayout")
		uilist_layout.Padding = UDim.new(0, 7)
		uilist_layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		uilist_layout.SortOrder = Enum.SortOrder.LayoutOrder
		uilist_layout.Parent = tab_buttons

		local minimize_button = Instance.new("TextButton")
		minimize_button.Font = Enum.Font.GothamMedium
		minimize_button.Text = "-"
		minimize_button.TextColor3 = Color3.new(1, 1, 1)
		minimize_button.TextSize = 19
		minimize_button.TextWrapped = true
		minimize_button.BackgroundColor3 = Color3.new(1, 0, 0)
		minimize_button.BackgroundTransparency = 1
		minimize_button.BorderSizePixel = 0
		minimize_button.Position = UDim2.new(0.863328338, 0, 0.0282898378, 0)
		minimize_button.Size = UDim2.new(0, 27, 0, 27)
		minimize_button.ZIndex = 100
		minimize_button.Name = "MinimizeButton"
		minimize_button.Parent = library_window

		local uistroke_3 = Instance.new("UIStroke")
		uistroke_3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uistroke_3.Parent = minimize_button
		uistroke_3.Transparency = 0.75

		local uicorner_3 = Instance.new("UICorner")
		uicorner_3.CornerRadius = UDim.new(0, 3)
		uicorner_3.Parent = minimize_button

		local close_button = Instance.new("TextButton")
		close_button.Font = Enum.Font.GothamMedium
		close_button.Text = "X"
		close_button.TextColor3 = Color3.new(1, 1, 1)
		close_button.TextSize = 19
		close_button.TextWrapped = true
		close_button.BackgroundColor3 = Color3.new(1, 0, 0)
		close_button.BackgroundTransparency = 1
		close_button.BorderSizePixel = 0
		close_button.Position = UDim2.new(0.927790344, 0, 0.0282898378, 0)
		close_button.Size = UDim2.new(0, 27, 0, 27)
		close_button.ZIndex = 100
		close_button.Name = "CloseButton"
		close_button.Parent = library_window

		local uistroke_4 = Instance.new("UIStroke")
		uistroke_4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uistroke_4.Parent = close_button
		uistroke_4.Transparency = 0.75

		local uicorner_4 = Instance.new("UICorner")
		uicorner_4.CornerRadius = UDim.new(0, 3)
		uicorner_4.Parent = close_button

		close_button.MouseButton1Down:Connect(function()
			Lib.DestroyUI()
		end)

		minimize_button.MouseButton1Down:Connect(function()
			Lib.HideUI()
		end)


		drag(library_window)
		Lib:MakeNotification("Hexavate","Hexavate UI Loaded, Thanks For Choosing A HexHub Product.","11091925001",2.6)
	
		




		
	
	
	function Lib.DestroyUI()
		
	end
	
	function Lib.HideUI()
		
	end

	local Tabs = {}

	function Tabs:NewTab(TabName)

		local tab = Instance.new("ScrollingFrame")
		tab.CanvasSize = UDim2.new(0, 0, 0, 0)
		tab.ScrollBarImageColor3 = Color3.new(0, 0, 0)
		tab.Active = true
		tab.BackgroundColor3 = Color3.new(0.243137, 0.243137, 0.243137)
		tab.BackgroundTransparency = 0.9900000095367432
		tab.BorderColor3 = Color3.new(0.188235, 0.188235, 0.188235)
		tab.BorderMode = Enum.BorderMode.Inset
		tab.Position = UDim2.new(0.252000064, 0, 0.13385956, 0)
		tab.Size = UDim2.new(0, 397, 0, 276)
		tab.Name = "Tab"
		tab.Parent = library_window

		local TabUILIST = Instance.new("UIListLayout")
		TabUILIST.Padding = UDim.new(0, 7)
		TabUILIST.SortOrder = Enum.SortOrder.LayoutOrder
		TabUILIST.Parent = tab

		local uipadding = Instance.new("UIPadding")
		uipadding.PaddingBottom = UDim.new(0, 7)
		uipadding.PaddingLeft = UDim.new(0, 10)
		uipadding.PaddingRight = UDim.new(0, 7)
		uipadding.PaddingTop = UDim.new(0, 7)
		uipadding.Parent = tab

		local uistroke = Instance.new("UIStroke")
		uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uistroke.Parent = tab
		uistroke.Transparency = 0.6

		local TabCorner = Instance.new("UICorner")
		TabCorner.CornerRadius = UDim.new(0,7)
		TabCorner.Parent = tab
		
		--
		
		local tab_button = Instance.new("TextButton")
		tab_button.Font = Enum.Font.GothamMedium
		tab_button.Text = TabName
		tab_button.TextColor3 = Color3.new(1, 1, 1)
		tab_button.TextSize = 18
		tab_button.BackgroundColor3 = Color3.new(0.364706, 0.364706, 0.364706)
		tab_button.BackgroundTransparency = 0.5
		tab_button.BorderSizePixel = 0
		tab_button.Position = UDim2.new(0.0366972461, 0, 0, 0)
		tab_button.Size = UDim2.new(0, 97, 0, 36)
		tab_button.ZIndex = 100
		tab_button.Name = "TabButton"
		tab_button.Parent = tab_buttons

		local uicorner = Instance.new("UICorner")
		uicorner.CornerRadius = UDim.new(0, 7)
		uicorner.Parent = tab_button

		local uistroke = Instance.new("UIStroke")
		uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uistroke.Parent = tab_button
		uistroke.Transparency = 0.75
		
		local function UpdateTabSize()
			local cS = TabUILIST.AbsoluteContentSize

			game.TweenService:Create(tab, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				CanvasSize = UDim2.new(0,0,0,cS.Y + 10)
			}):Play()
		end


		tab_button.MouseButton1Down:Connect(function()
		
			for i,v in next, library_window:GetChildren() do
				if v:IsA("UICorner") or v:IsA("UIScale") or v:IsA("UIListLayout") or v:IsA("UIStroke") or v:IsA("UIGradient") then 

					print("Attempted To Close A Non Closeable Item (Normal Error)")
				else
					if v.Name == "Tab" then
						v.Visible = false
						
end
				end


			end

		tab.Visible = true
		end)

			local Elements = {}

			function Elements:NewSlider(SliderText,Max,Min,callback)
				callback = callback or function() end
			
			local new_slider = Instance.new("Frame")
			new_slider.BackgroundColor3 = Color3.new(0.301961, 0.301961, 0.301961)
			new_slider.Position = UDim2.new(0.0410331525, 0, 0.0589989573, 0)
			new_slider.Size = UDim2.new(0, 354, 0, 47)
			new_slider.Name = "NewSlider"
			new_slider.Parent = tab

			local uicorner = Instance.new("UICorner")
			uicorner.CornerRadius = UDim.new(0, 7)
			uicorner.Parent = new_slider

			local uistroke = Instance.new("UIStroke")
			uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uistroke.Parent = new_slider
			uistroke.Transparency = 0.6

			local bar = Instance.new("Frame")
			bar.AnchorPoint = Vector2.new(0.5, 0.5)
			bar.BackgroundColor3 = Color3.new(1, 1, 1)
			bar.ClipsDescendants = true
			bar.Position = UDim2.new(0.654377043, 0, 0.480679065, 0)
			bar.Size = UDim2.new(0, 227, 0, 8)
			bar.Name = "Bar"
			bar.Parent = new_slider

			local uicorner_2 = Instance.new("UICorner")
			uicorner_2.CornerRadius = UDim.new(100, 100)
			uicorner_2.Parent = bar

			local inner_bar = Instance.new("Frame")
			inner_bar.AnchorPoint = Vector2.new(0, 0.5)
			inner_bar.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
			inner_bar.Position = UDim2.new(0, 0, 0.5, 0)
			inner_bar.Size = UDim2.new(0, 0, 0, 8)
			inner_bar.Name = "InnerBar"
			inner_bar.Parent = bar

			local uicorner_3 = Instance.new("UICorner")
			uicorner_3.CornerRadius = UDim.new(100, 100)
			uicorner_3.Parent = inner_bar

			local slider_clickable = Instance.new("TextButton")
			slider_clickable.Font = Enum.Font.SourceSans
			slider_clickable.Text = " "
			slider_clickable.TextColor3 = Color3.new(0, 0, 0)
			slider_clickable.TextSize = 14
			slider_clickable.BackgroundColor3 = Color3.new(1, 1, 1)
			slider_clickable.BackgroundTransparency = 1
			slider_clickable.Position = UDim2.new(0.333755583, 0, 0.392283976, 0)
			slider_clickable.Size = UDim2.new(0, 227, 0, 7)
			slider_clickable.Name = "SliderClickable"
			slider_clickable.Parent = new_slider

			local title = Instance.new("TextLabel")
			title.Font = Enum.Font.GothamMedium
			title.Text = SliderText
			title.TextColor3 = Color3.new(1, 1, 1)
			title.TextScaled = true
			title.TextSize = 14
			title.TextWrapped = true
			title.BackgroundColor3 = Color3.new(1, 1, 1)
			title.BackgroundTransparency = 1
			title.Position = UDim2.new(0.0390000008, 0, 0.270000011, 0)
			title.Size = UDim2.new(0, 87, 0, 20)
			title.Name = "Title"
			title.Parent = new_slider

			local slider_val = Instance.new("TextLabel")
			slider_val.Font = Enum.Font.GothamMedium
			slider_val.Text = "0"
			slider_val.TextColor3 = Color3.new(1, 1, 1)
			slider_val.TextScaled = true
			slider_val.TextSize = 14
			slider_val.TextTransparency = 1
			slider_val.TextWrapped = true
			slider_val.BackgroundColor3 = Color3.new(1, 1, 1)
			slider_val.BackgroundTransparency = 1
			slider_val.Position = UDim2.new(0.0449301526, 0, 0.568206191, 0)
			slider_val.Size = UDim2.new(0, 87, 0, 15)
			slider_val.Name = "SliderVal"
			slider_val.Parent = new_slider
			
			local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
			local Slider = new_slider
			local SliderFrame = inner_bar
			local Button = slider_clickable
			local UIS = game:GetService("UserInputService")


		

			local holding = false

			Button.MouseButton1Down:Connect(function()
				holding = true
				game.TweenService:Create(slider_val, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					TextTransparency = 0
				}):Play()
				game.TweenService:Create(title, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					Position = UDim2.new(0.039, 0,0.1, 0)
				}):Play()
			end)

			Button.MouseButton1Up:Connect(function()
				if not holding then return end
				holding = false
				game.TweenService:Create(slider_val, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					TextTransparency = 1
				}):Play()
				game.TweenService:Create(title, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					Position = UDim2.new(0.039, 0,0.27, 0)
				}):Play()
			end)

			UIS.InputEnded:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then
					if not holding then return end
					holding = false
					game.TweenService:Create(slider_val, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						TextTransparency = 1
					}):Play()
					game.TweenService:Create(title, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						Position = UDim2.new(0.039, 0,0.27, 0)
					}):Play()
				end
			end)
			
			game:GetService("RunService").RenderStepped:Connect(function()
				if holding then
					SliderFrame.Position = UDim2.new(0, 0,0.5, 0)
					local Percentage = math.clamp((Mouse.X - Slider.Bar.AbsolutePosition.X) / Slider.Bar.AbsoluteSize.X,0,1)
					local Value = math.floor((Max - Min) * Percentage) + Min
					game.TweenService:Create(SliderFrame, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						Size = UDim2.new(Percentage, 0, 0, 8)
					}):Play()
					--SliderFrame.Size = UDim2.new(Percentage, 0, 0, 8)
					slider_val.Text = Value
					callback(Value, math.round(Value))
				end
			end)
			
			UpdateTabSize()
			
			end
		
		function Elements:NewToggle(ToggleText, callback)
			callback = callback or function() end

			local toggle = Instance.new("Frame")
			toggle.BackgroundColor3 = Color3.new(0.301961, 0.301961, 0.301961)
			toggle.Position = UDim2.new(0.0620857887, 0, 0.0501232147, 0)
			toggle.Size = UDim2.new(0, 354, 0, 47)
			toggle.Name = "Toggle"
			toggle.Parent = tab

			local uicorner = Instance.new("UICorner")
			uicorner.CornerRadius = UDim.new(0, 7)
			uicorner.Parent = toggle

			local uistroke = Instance.new("UIStroke")
			uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uistroke.Parent = toggle
			uistroke.Transparency = 0.6

			local title = Instance.new("TextLabel")
			title.Font = Enum.Font.GothamMedium
			title.Text = "Toggle Title"
			title.TextColor3 = Color3.new(1, 1, 1)
			title.TextScaled = true
			title.TextSize = 14
			title.TextWrapped = true
			title.TextXAlignment = Enum.TextXAlignment.Left
			title.BackgroundColor3 = Color3.new(1, 1, 1)
			title.BackgroundTransparency = 1
			title.Position = UDim2.new(0.0390000865, 0, 0.227446854, 0)
			title.Size = UDim2.new(0, 209, 0, 25)
			title.Name = "Title"
			title.Parent = toggle

			local toggle_button = Instance.new("TextButton")
			toggle_button.Font = Enum.Font.SourceSans
			toggle_button.Text = ""
			toggle_button.TextColor3 = Color3.new(0, 0, 0)
			toggle_button.TextSize = 14
			toggle_button.BackgroundColor3 = Color3.new(1, 1, 1)
			toggle_button.BackgroundTransparency = 1
			toggle_button.Position = UDim2.new(0.717936397, 0, 0.200794622, 0)
			toggle_button.Size = UDim2.new(0, 78, 0, 27)
			toggle_button.Name = "ToggleButton"
			toggle_button.Parent = toggle

			local toggle_bar = Instance.new("Frame")
			toggle_bar.AnchorPoint = Vector2.new(0.5, 0.5)
			toggle_bar.BackgroundColor3 = Color3.new(1, 1, 1)
			toggle_bar.ClipsDescendants = true
			toggle_bar.Position = UDim2.new(0.828105867, 0, 0.481722564, 0)
			toggle_bar.Size = UDim2.new(0, 68, 0, 20)
			toggle_bar.Name = "ToggleBar"
			toggle_bar.Parent = toggle

			local uicorner_2 = Instance.new("UICorner")
			uicorner_2.CornerRadius = UDim.new(100, 100)
			uicorner_2.Parent = toggle_bar

			local toggle_buttonfake = Instance.new("Frame")
			toggle_buttonfake.AnchorPoint = Vector2.new(0, 0.5)
			toggle_buttonfake.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
			toggle_buttonfake.Position = UDim2.new(0, -1,0.5, 0)
			toggle_buttonfake.Size = UDim2.new(0, 21, 0, 20)
			toggle_buttonfake.Name = "ToggleButtonfake"
			toggle_buttonfake.Parent = toggle_bar

			local uicorner_3 = Instance.new("UICorner")
			uicorner_3.CornerRadius = UDim.new(100, 100)
			uicorner_3.Parent = toggle_buttonfake

			local uistroke_2 = Instance.new("UIStroke")
			uistroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uistroke_2.Parent = toggle_bar
			uistroke_2.Transparency = 0.5
			
			local IsToggled = false

			toggle_button.MouseButton1Down:Connect(function()
				if IsToggled then
					callback(false)
					game.TweenService:Create(toggle_buttonfake, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Position = UDim2.new(0, -1,0.5, 0)
					}):Play()
					IsToggled = false
					
				else
					callback(true)
					game.TweenService:Create(toggle_buttonfake, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Position = UDim2.new(0.677, 1,0.5, 0)
					}):Play()
					IsToggled = true
				end
			end)

			
			UpdateTabSize()

		end
		
		function Elements:NewButton(ButtonTitle,ButtonText,callback)
			callback = callback or function() end
			
			local button = Instance.new("Frame")
			button.BackgroundColor3 = Color3.new(0.301961, 0.301961, 0.301961)
			button.Position = UDim2.new(0.0410331525, 0, 0.0589989573, 0)
			button.Size = UDim2.new(0, 354, 0, 47)
			button.Name = "Button"
			button.Parent = tab

			local uicorner = Instance.new("UICorner")
			uicorner.CornerRadius = UDim.new(0, 7)
			uicorner.Parent = button

			local uistroke = Instance.new("UIStroke")
			uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uistroke.Parent = button
			uistroke.Transparency = 0.6

			local title = Instance.new("TextLabel")
			title.Font = Enum.Font.GothamMedium
			title.Text = ButtonTitle
			title.TextColor3 = Color3.new(1, 1, 1)
			title.TextScaled = true
			title.TextSize = 14
			title.TextWrapped = true
			title.BackgroundColor3 = Color3.new(1, 1, 1)
			title.BackgroundTransparency = 1
			title.Position = UDim2.new(0.0390000865, 0, 0.184893668, 0)
			title.Size = UDim2.new(0, 151, 0, 28)
			title.Name = "Title"
			title.Parent = button

			local button_txt = Instance.new("TextButton")
			button_txt.Font = Enum.Font.GothamMedium
			button_txt.Text = ButtonText
			button_txt.TextColor3 = Color3.new(1, 1, 1)
			button_txt.TextSize = 18
			button_txt.BackgroundColor3 = Color3.new(0.364706, 0.364706, 0.364706)
			button_txt.BackgroundTransparency = 0.5
			button_txt.BorderSizePixel = 0
			button_txt.Position = UDim2.new(0.516949177, 0, 0.0972764045, 0)
			button_txt.Size = UDim2.new(0, 157, 0, 36)
			button_txt.ZIndex = 100
			button_txt.Name = "ButtonTxt"
			button_txt.Parent = button

			local uicorner_2 = Instance.new("UICorner")
			uicorner_2.CornerRadius = UDim.new(0, 7)
			uicorner_2.Parent = button_txt

			local uistroke_2 = Instance.new("UIStroke")
			uistroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uistroke_2.Parent = button_txt
			uistroke_2.Transparency = 0.75
			
			button_txt.MouseButton1Down:Connect(function()
				callback()
			end)
			
			UpdateTabSize()
		end
		
		function Elements:NewTextBox(TextBoxTitle,PlaceHolderText,callback)
			callback = callback or function() end
			local text_box = Instance.new("Frame")
			text_box.BackgroundColor3 = Color3.new(0.301961, 0.301961, 0.301961)
			text_box.Position = UDim2.new(0.16820243, 0, 0.405711025, 0)
			text_box.Size = UDim2.new(0, 354, 0, 47)
			text_box.Name = "TextBox"
			text_box.Parent = tab

			local uicorner = Instance.new("UICorner")
			uicorner.CornerRadius = UDim.new(0, 7)
			uicorner.Parent = text_box

			local uistroke = Instance.new("UIStroke")
			uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uistroke.Parent = text_box
			uistroke.Transparency = 0.6

			local title = Instance.new("TextLabel")
			title.Font = Enum.Font.GothamMedium
			title.Text = TextBoxTitle
			title.TextColor3 = Color3.new(1, 1, 1)
			title.TextScaled = true
			title.TextSize = 14
			title.TextWrapped = true
			title.BackgroundColor3 = Color3.new(1, 1, 1)
			title.BackgroundTransparency = 1
			title.Position = UDim2.new(0.0390000865, 0, 0.184893668, 0)
			title.Size = UDim2.new(0, 200, 0, 28)
			title.Name = "Title"
			title.Parent = text_box

			local txt_box_frame = Instance.new("Frame")
			txt_box_frame.AnchorPoint = Vector2.new(0.5, 0.5)
			txt_box_frame.BackgroundColor3 = Color3.new(0.301961, 0.301961, 0.301961)
			txt_box_frame.Position = UDim2.new(0.798887014, 0, 0.475655347, 0)
			txt_box_frame.Size = UDim2.new(0, 124, 0, 34)
			txt_box_frame.Name = "TxtBoxFrame"
			txt_box_frame.Parent = text_box

			local uicorner_2 = Instance.new("UICorner")
			uicorner_2.CornerRadius = UDim.new(0, 7)
			uicorner_2.Parent = txt_box_frame

			local uistroke_2 = Instance.new("UIStroke")
			uistroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uistroke_2.Parent = txt_box_frame
			uistroke_2.Transparency = 0.6

			local txt_box = Instance.new("TextBox")
			txt_box.CursorPosition = -1
			txt_box.Font = Enum.Font.GothamMedium
			txt_box.PlaceholderColor3 = Color3.new(0.870588, 0.870588, 0.870588)
			txt_box.PlaceholderText = PlaceHolderText
			txt_box.Text = "..."
			txt_box.TextColor3 = Color3.new(1, 1, 1)
			txt_box.TextScaled = true
			txt_box.TextSize = 14
			txt_box.TextWrapped = true
			txt_box.BackgroundColor3 = Color3.new(1, 1, 1)
			txt_box.BackgroundTransparency = 1
			txt_box.Position = UDim2.new(0.0403225422, 0, 0.0294117928, 0)
			txt_box.Size = UDim2.new(0, 114, 0, 32)
			txt_box.Name = "TxtBox"
			txt_box.Parent = txt_box_frame

			local uipadding = Instance.new("UIPadding")
			uipadding.PaddingBottom = UDim.new(0, 3)
			uipadding.PaddingLeft = UDim.new(0, 3)
			uipadding.PaddingRight = UDim.new(0, 3)
			uipadding.PaddingTop = UDim.new(0, 3)
			uipadding.Parent = txt_box
			
			txt_box.FocusLost:Connect(function(EnterPressed)
				if EnterPressed then
					callback(txt_box.Text,true)
					wait(.4)
					txt_box.Text = "..."
				else
					callback(txt_box.Text,false)
					wait(.4)
					txt_box.Text = "..."
				end
				
			end)
			
			UpdateTabSize()
		end
		
		function Elements:NewDropDown(DropDownTitle,Table,callback)
			callback = callback or function() end
			
			local drop = Instance.new("Frame")
			drop.BackgroundColor3 = Color3.new(0.301961, 0.301961, 0.301961)
			drop.Position = UDim2.new(0.257005513, 0, 0.759847462, 0)
			drop.Size = UDim2.new(0, 354, 0, 47)
			drop.Name = "Drop"
			drop.Parent = tab

			local uicorner = Instance.new("UICorner")
			uicorner.CornerRadius = UDim.new(0, 7)
			uicorner.Parent = drop

			local uistroke = Instance.new("UIStroke")
			uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uistroke.Parent = drop
			uistroke.Transparency = 0.6

			local title = Instance.new("TextLabel")
			title.Font = Enum.Font.GothamMedium
			title.Text = DropDownTitle
			title.TextColor3 = Color3.new(1, 1, 1)
			title.TextScaled = true
			title.TextSize = 14
			title.TextWrapped = true
			title.BackgroundColor3 = Color3.new(1, 1, 1)
			title.BackgroundTransparency = 1
			title.Position = UDim2.new(0.0390000865, 0, 0.184893668, 0)
			title.Size = UDim2.new(0, 200, 0, 28)
			title.Name = "Title"
			title.Parent = drop

			local drop_button = Instance.new("Frame")
			drop_button.BackgroundColor3 = Color3.new(0.301961, 0.301961, 0.301961)
			drop_button.Position = UDim2.new(0.674593329, 0, 0.177783072, 0)
			drop_button.Size = UDim2.new(0, 103, 0, 30)
			drop_button.Name = "DropButton"
			drop_button.Parent = drop

			local uicorner_2 = Instance.new("UICorner")
			uicorner_2.CornerRadius = UDim.new(0, 7)
			uicorner_2.Parent = drop_button

			local uistroke_2 = Instance.new("UIStroke")
			uistroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uistroke_2.Parent = drop_button
			uistroke_2.Transparency = 0.6

			local drop_current_selected = Instance.new("TextLabel")
			drop_current_selected.Font = Enum.Font.GothamMedium
			drop_current_selected.Text = ""
			drop_current_selected.TextColor3 = Color3.new(1, 1, 1)
			drop_current_selected.TextScaled = true
			drop_current_selected.TextSize = 14
			drop_current_selected.TextWrapped = true
			drop_current_selected.AnchorPoint = Vector2.new(0.5, 0)
			drop_current_selected.BackgroundColor3 = Color3.new(1, 1, 1)
			drop_current_selected.BackgroundTransparency = 1
			drop_current_selected.Position = UDim2.new(0.332981706, 0, 0, 0)
			drop_current_selected.Size = UDim2.new(0, 62, 0, 30)
			drop_current_selected.Name = "DropCurrentSelected"
			drop_current_selected.Parent = drop_button

			local open_btn = Instance.new("ImageButton")
			open_btn.Image = "rbxassetid://4370337241"
			open_btn.ScaleType = Enum.ScaleType.Fit
			open_btn.AnchorPoint = Vector2.new(0.5, 0)
			open_btn.BackgroundColor3 = Color3.new(1, 1, 1)
			open_btn.BackgroundTransparency = 1
			open_btn.Position = UDim2.new(0.786000013, 0, 0, 0)
			open_btn.Size = UDim2.new(0, 30, 0, 30)
			open_btn.Name = "OpenBTN"
			open_btn.Parent = drop_button

			local DropRealButton = Instance.new("TextButton")
			DropRealButton.Font = Enum.Font.SourceSans
			DropRealButton.Text = ""
			DropRealButton.TextColor3 = Color3.new(0, 0, 0)
			DropRealButton.TextSize = 14
			DropRealButton.BackgroundColor3 = Color3.new(1, 1, 1)
			DropRealButton.BackgroundTransparency = 0.999999999999999999999999
			DropRealButton.Size = UDim2.new(0, 103, 0, 30)
			DropRealButton.Position = UDim2.new(0.675, 0,0.128, 0)
			DropRealButton.Name = "RealButton"
			DropRealButton.Parent = drop
			DropRealButton.ZIndex = 10
			

			local drop_frame = Instance.new("Frame")
			drop_frame.BackgroundColor3 = Color3.new(0.301961, 0.301961, 0.301961)
			drop_frame.ClipsDescendants = true
			drop_frame.Position = UDim2.new(0.675000012, 0, 0.919999778, 0)
			drop_frame.Size = UDim2.new(0, 102, 0, 0)
			drop_frame.Name = "DropFrame"
			drop_frame.Parent = drop
			drop_frame.Visible = false

			local uicorner_3 = Instance.new("UICorner")
			uicorner_3.CornerRadius = UDim.new(0, 7)
			uicorner_3.Parent = drop_frame

			local uistroke_3 = Instance.new("UIStroke")
			uistroke_3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uistroke_3.Parent = drop_frame
			uistroke_3.Transparency = 0.6

			local DropScrollingFrame = Instance.new("ScrollingFrame")
			DropScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
			DropScrollingFrame.ScrollBarImageColor3 = Color3.new(0, 0, 0)
			DropScrollingFrame.ScrollBarThickness = 6
			DropScrollingFrame.Active = true
			DropScrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1)
			DropScrollingFrame.BackgroundTransparency = 1
			DropScrollingFrame.Size = UDim2.new(0, 100, 0, 115)
			DropScrollingFrame.Parent = drop_frame

			local DropListLayout = Instance.new("UIListLayout")
			DropListLayout.Padding = UDim.new(0, 7)
			DropListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			DropListLayout.Parent = DropScrollingFrame

			local uipadding = Instance.new("UIPadding")
			uipadding.PaddingBottom = UDim.new(0, 7)
			uipadding.PaddingLeft = UDim.new(0, 3)
			uipadding.PaddingTop = UDim.new(0, 7)
			uipadding.Parent = DropScrollingFrame

			
			local uipadding_2 = Instance.new("UIPadding")
			uipadding_2.PaddingBottom = UDim.new(0, 4)
			uipadding_2.PaddingLeft = UDim.new(0, 4)
			uipadding_2.PaddingRight = UDim.new(0, 4)
			uipadding_2.PaddingTop = UDim.new(0, 4)
			uipadding_2.Parent = tab_button
			
			local function UpdateDropSize()
				local cS = DropListLayout.AbsoluteContentSize

				game.TweenService:Create(DropScrollingFrame, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					CanvasSize = UDim2.new(0,0,0,cS.Y + 4)
				}):Play()
			end
			
			for i, v in pairs(Table) do
				local DropBTN = Instance.new("TextButton")
				DropBTN.Font = Enum.Font.GothamMedium
				DropBTN.Text = v
				DropBTN.TextColor3 = Color3.new(1, 1, 1)
				DropBTN.TextScaled = true
				DropBTN.TextSize = 18
				DropBTN.TextWrapped = true
				DropBTN.BackgroundColor3 = Color3.new(0.364706, 0.364706, 0.364706)
				DropBTN.BackgroundTransparency = 0.5
				DropBTN.BorderSizePixel = 0
				DropBTN.Size = UDim2.new(0, 86, 0, 30)
				DropBTN.ZIndex = 100
				DropBTN.Name = v
				DropBTN.Parent = DropScrollingFrame
				
				local uicorner_4 = Instance.new("UICorner")
			uicorner_4.CornerRadius = UDim.new(0, 7)
			uicorner_4.Parent = DropBTN

			local uistroke_4 = Instance.new("UIStroke")
			uistroke_4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uistroke_4.Parent = DropBTN
			uistroke_4.Transparency = 0.6

				DropBTN.MouseButton1Down:Connect(function()
					callback(v)
					game.TweenService:Create(drop_frame, 

						TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), 

						{Size = UDim2.new(0,102,0,0),}):Play()
					drop_current_selected.Text = v
					game.TweenService:Create(open_btn, 

						TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), 

						{Rotation = 0,}):Play()
					wait(.6)
					drop_frame.Visible = false
					wait(.2)
					UpdateTabSize()
				end)
				
				if drop_current_selected.Text == "" then drop_current_selected.Text = v end
					
			end
			
			local DropOpen = false
			
			DropRealButton.MouseButton1Down:Connect(function()
				--print("watafak")
				if DropOpen then
					DropOpen = false
					game.TweenService:Create(drop_frame, 

						TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), 

						{Size = UDim2.new(0,102,0,0),}):Play()
					
					game.TweenService:Create(open_btn, 

						TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), 

						{Rotation = 0,}):Play()
					wait(.6)
					drop_frame.Visible = false
					wait(.2)
					UpdateTabSize()
				elseif not DropOpen then
					DropOpen = true
					drop_frame.Visible = true
					game.TweenService:Create(open_btn, 

						TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), 

						{Rotation = -90,}):Play()
					
					game.TweenService:Create(drop_frame, 

						TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), 

						{Size = UDim2.new(0,102,0,115),}):Play()
					
					wait(.2)
					tab.CanvasSize = UDim2.new(0,0,tab.CanvasSize.Y.Scale + .32,tab.CanvasSize.Y.Offset)
				end
			end)
			
			
				
		
			
			UpdateTabSize()
		end
		
		function Elements:aaa(ButtonTitle,ButtonText,callback)
			callback = callback or function() end

			UpdateTabSize()
		end

			
			return Elements

	end
	return Tabs

end
return Lib
