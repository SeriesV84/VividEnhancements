local VividEnhancements = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TopBar = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local MinimizeBtn = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local CloseBtn = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local TabsFrame = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local TabButtons = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local EditorTab = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local ScriptsTab = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local SettingsTab = Instance.new("TextButton")
local UICorner_8 = Instance.new("UICorner")
local PanelsFrame = Instance.new("Frame")
local EditorPanel = Instance.new("Frame")
local EditorScroll = Instance.new("ScrollingFrame")
local CodeEditor = Instance.new("TextBox")
local LineNumbers = Instance.new("TextLabel")
local ExecuteBtn = Instance.new("TextButton")
local UICorner_9 = Instance.new("UICorner")
local ClearBtn = Instance.new("TextButton")
local UICorner_10 = Instance.new("UICorner")
local FormatBtn = Instance.new("TextButton")
local UICorner_11 = Instance.new("UICorner")
local ScriptsPanel = Instance.new("Frame")
local ScriptsScroll = Instance.new("ScrollingFrame")
local UIListLayout_2 = Instance.new("UIListLayout")
local SettingsPanel = Instance.new("Frame")
local SettingsScroll = Instance.new("ScrollingFrame")
local UIListLayout_3 = Instance.new("UIListLayout")
local DragHandle = Instance.new("Frame")
local UICorner_12 = Instance.new("UICorner")
local DragIcon = Instance.new("ImageLabel")

-- v2.1 - smaller mobile UI

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
local screenSize = workspace.CurrentCamera.ViewportSize
local isSmallScreen = screenSize.X < 600 or screenSize.Y < 800

VividEnhancements.Name = "VividEnhancements"
VividEnhancements.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
VividEnhancements.ResetOnSpawn = false
VividEnhancements.IgnoreGuiInset = true
VividEnhancements.DisplayOrder = 999999

local frameWidth = isSmallScreen and screenSize.X - 10 or (isMobile and math.min(800, screenSize.X - 10) or 800)
local frameHeight = isSmallScreen and screenSize.Y - 10 or (isMobile and math.min(600, screenSize.Y - 10) or 600)

MainFrame.Name = "MainFrame"
MainFrame.Parent = VividEnhancements
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, frameWidth, 0, frameHeight)
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, isMobile and 12 or 10)
UICorner.Parent = MainFrame

TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, isMobile and 44 or 40)

UICorner_2.CornerRadius = UDim.new(0, isMobile and 12 or 10)
UICorner_2.Parent = TopBar

Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 12, 0, 0)
Title.Size = UDim2.new(1, -100, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "Vivid Enhancements"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = isMobile and 16 or 14
Title.TextXAlignment = Enum.TextXAlignment.Left

MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Parent = TopBar
MinimizeBtn.AnchorPoint = Vector2.new(1, 0.5)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MinimizeBtn.Position = UDim2.new(1, -52, 0.5, 0)
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Text = "—"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
MinimizeBtn.TextSize = isMobile and 20 or 16

UICorner_3.CornerRadius = UDim.new(0, 6)
UICorner_3.Parent = MinimizeBtn

CloseBtn.Name = "CloseBtn"
CloseBtn.Parent = TopBar
CloseBtn.AnchorPoint = Vector2.new(1, 0.5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CloseBtn.Position = UDim2.new(1, -12, 0.5, 0)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 51, 51)
CloseBtn.TextSize = isMobile and 22 or 18

UICorner_4.CornerRadius = UDim.new(0, 6)
UICorner_4.Parent = CloseBtn

TabsFrame.Name = "TabsFrame"
TabsFrame.Parent = MainFrame
TabsFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
TabsFrame.BorderSizePixel = 0
TabsFrame.Position = UDim2.new(0, 0, 0, isMobile and 44 or 40)
TabsFrame.Size = UDim2.new(1, 0, 0, isMobile and 42 or 38)

UICorner_5.CornerRadius = UDim.new(0, 0)
UICorner_5.Parent = TabsFrame

TabButtons.Name = "TabButtons"
TabButtons.Parent = TabsFrame
TabButtons.BackgroundTransparency = 1
TabButtons.Size = UDim2.new(1, 0, 1, 0)

UIListLayout.Parent = TabButtons
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.Padding = UDim.new(0, isMobile and 4 or 3)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local tabWidth = isSmallScreen and (frameWidth / 3 - 6) or (isMobile and 110 or 95)

EditorTab.Name = "EditorTab"
EditorTab.Parent = TabButtons
EditorTab.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
EditorTab.Size = UDim2.new(0, tabWidth, 1, -6)
EditorTab.Font = Enum.Font.GothamBold
EditorTab.Text = "EDITOR"
EditorTab.TextColor3 = Color3.fromRGB(0, 0, 0)
EditorTab.TextSize = isMobile and 11 or 10

UICorner_6.CornerRadius = UDim.new(0, 6)
UICorner_6.Parent = EditorTab

ScriptsTab.Name = "ScriptsTab"
ScriptsTab.Parent = TabButtons
ScriptsTab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ScriptsTab.Size = UDim2.new(0, tabWidth, 1, -6)
ScriptsTab.Font = Enum.Font.GothamBold
ScriptsTab.Text = "SCRIPTS"
ScriptsTab.TextColor3 = Color3.fromRGB(170, 170, 170)
ScriptsTab.TextSize = isMobile and 11 or 10

UICorner_7.CornerRadius = UDim.new(0, 6)
UICorner_7.Parent = ScriptsTab

SettingsTab.Name = "SettingsTab"
SettingsTab.Parent = TabButtons
SettingsTab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SettingsTab.Size = UDim2.new(0, tabWidth, 1, -6)
SettingsTab.Font = Enum.Font.GothamBold
SettingsTab.Text = "SETTINGS"
SettingsTab.TextColor3 = Color3.fromRGB(170, 170, 170)
SettingsTab.TextSize = isMobile and 11 or 10

UICorner_8.CornerRadius = UDim.new(0, 6)
UICorner_8.Parent = SettingsTab

PanelsFrame.Name = "PanelsFrame"
PanelsFrame.Parent = MainFrame
PanelsFrame.BackgroundTransparency = 1
PanelsFrame.Position = UDim2.new(0, 0, 0, (isMobile and 44 or 40) + (isMobile and 42 or 38))
PanelsFrame.Size = UDim2.new(1, 0, 1, -((isMobile and 44 or 40) + (isMobile and 42 or 38)))

EditorPanel.Name = "EditorPanel"
EditorPanel.Parent = PanelsFrame
EditorPanel.BackgroundTransparency = 1
EditorPanel.Size = UDim2.new(1, 0, 1, 0)
EditorPanel.Visible = true

EditorScroll.Name = "EditorScroll"
EditorScroll.Parent = EditorPanel
EditorScroll.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
EditorScroll.BorderSizePixel = 0
EditorScroll.Position = UDim2.new(0, isMobile and 8 or 10, 0, isMobile and 8 or 10)
EditorScroll.Size = UDim2.new(1, -(isMobile and 16 or 20), 1, -(isMobile and 80 or 70))
EditorScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
EditorScroll.ScrollBarThickness = isMobile and 6 or 4
EditorScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)

CodeEditor.Name = "CodeEditor"
CodeEditor.Parent = EditorScroll
CodeEditor.BackgroundTransparency = 1
CodeEditor.Position = UDim2.new(0, isMobile and 38 or 44, 0, 0)
CodeEditor.Size = UDim2.new(1, -(isMobile and 38 or 44), 1, 0)
CodeEditor.ClearTextOnFocus = false
CodeEditor.Font = Enum.Font.Code
CodeEditor.MultiLine = true
CodeEditor.Text = "-- Vivid Enhancements Executor\n-- Type your script here...\n\nprint('Hello from Vivid Enhancements!')"
CodeEditor.TextColor3 = Color3.fromRGB(255, 255, 255)
CodeEditor.TextSize = isMobile and 13 or 12
CodeEditor.TextXAlignment = Enum.TextXAlignment.Left
CodeEditor.TextYAlignment = Enum.TextYAlignment.Top
CodeEditor.TextWrapped = false

LineNumbers.Name = "LineNumbers"
LineNumbers.Parent = EditorScroll
LineNumbers.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
LineNumbers.BorderSizePixel = 0
LineNumbers.Size = UDim2.new(0, isMobile and 38 or 44, 1, 0)
LineNumbers.Font = Enum.Font.Code
LineNumbers.Text = "1"
LineNumbers.TextColor3 = Color3.fromRGB(100, 100, 100)
LineNumbers.TextSize = isMobile and 13 or 12
LineNumbers.TextYAlignment = Enum.TextYAlignment.Top

ExecuteBtn.Name = "ExecuteBtn"
ExecuteBtn.Parent = EditorPanel
ExecuteBtn.AnchorPoint = Vector2.new(1, 1)
ExecuteBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
ExecuteBtn.Position = UDim2.new(1, -(isMobile and 8 or 10), 1, -(isMobile and 8 or 10))
ExecuteBtn.Size = UDim2.new(0, isMobile and 100 or 90, 0, isMobile and 38 or 34)
ExecuteBtn.Font = Enum.Font.GothamBold
ExecuteBtn.Text = "EXECUTE"
ExecuteBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ExecuteBtn.TextSize = isMobile and 13 or 12

UICorner_9.CornerRadius = UDim.new(0, 6)
UICorner_9.Parent = ExecuteBtn

ClearBtn.Name = "ClearBtn"
ClearBtn.Parent = EditorPanel
ClearBtn.AnchorPoint = Vector2.new(1, 1)
ClearBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ClearBtn.Position = UDim2.new(1, -(isMobile and 118 or 110), 1, -(isMobile and 8 or 10))
ClearBtn.Size = UDim2.new(0, isMobile and 100 or 90, 0, isMobile and 38 or 34)
ClearBtn.Font = Enum.Font.GothamBold
ClearBtn.Text = "CLEAR"
ClearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearBtn.TextSize = isMobile and 13 or 12

UICorner_10.CornerRadius = UDim.new(0, 6)
UICorner_10.Parent = ClearBtn

FormatBtn.Name = "FormatBtn"
FormatBtn.Parent = EditorPanel
FormatBtn.AnchorPoint = Vector2.new(1, 1)
FormatBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
FormatBtn.Position = UDim2.new(1, -(isMobile and 228 or 210), 1, -(isMobile and 8 or 10))
FormatBtn.Size = UDim2.new(0, isMobile and 100 or 90, 0, isMobile and 38 or 34)
FormatBtn.Font = Enum.Font.GothamBold
FormatBtn.Text = "FORMAT"
FormatBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FormatBtn.TextSize = isMobile and 13 or 12

UICorner_11.CornerRadius = UDim.new(0, 6)
UICorner_11.Parent = FormatBtn

ScriptsPanel.Name = "ScriptsPanel"
ScriptsPanel.Parent = PanelsFrame
ScriptsPanel.BackgroundTransparency = 1
ScriptsPanel.Size = UDim2.new(1, 0, 1, 0)
ScriptsPanel.Visible = false

ScriptsScroll.Name = "ScriptsScroll"
ScriptsScroll.Parent = ScriptsPanel
ScriptsScroll.BackgroundTransparency = 1
ScriptsScroll.Size = UDim2.new(1, 0, 1, 0)
ScriptsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
ScriptsScroll.ScrollBarThickness = isMobile and 6 or 4
ScriptsScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)

UIListLayout_2.Parent = ScriptsScroll
UIListLayout_2.Padding = UDim.new(0, isMobile and 8 or 6)
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

SettingsPanel.Name = "SettingsPanel"
SettingsPanel.Parent = PanelsFrame
SettingsPanel.BackgroundTransparency = 1
SettingsPanel.Size = UDim2.new(1, 0, 1, 0)
SettingsPanel.Visible = false

SettingsScroll.Name = "SettingsScroll"
SettingsScroll.Parent = SettingsPanel
SettingsScroll.BackgroundTransparency = 1
SettingsScroll.Size = UDim2.new(1, 0, 1, 0)
SettingsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
SettingsScroll.ScrollBarThickness = isMobile and 6 or 4
SettingsScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)

UIListLayout_3.Parent = SettingsScroll
UIListLayout_3.Padding = UDim.new(0, isMobile and 8 or 6)
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder

DragHandle.Name = "DragHandle"
DragHandle.Parent = VividEnhancements
DragHandle.AnchorPoint = Vector2.new(0.5, 0.5)
DragHandle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
DragHandle.BorderSizePixel = 2
DragHandle.BorderColor3 = Color3.fromRGB(255, 215, 0)
DragHandle.Position = UDim2.new(1, -(isMobile and 50 or 70), 1, -(isMobile and 50 or 70))
DragHandle.Size = UDim2.new(0, isMobile and 56 or 48, 0, isMobile and 56 or 48)
DragHandle.Active = true
DragHandle.Draggable = true
DragHandle.Visible = true

UICorner_12.CornerRadius = UDim.new(1, 0)
UICorner_12.Parent = DragHandle

DragIcon.Name = "DragIcon"
DragIcon.Parent = DragHandle
DragIcon.AnchorPoint = Vector2.new(0.5, 0.5)
DragIcon.BackgroundTransparency = 1
DragIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
DragIcon.Size = UDim2.new(0, isMobile and 28 or 22, 0, isMobile and 28 or 22)
DragIcon.Image = "rbxassetid://3926305904"
DragIcon.ImageColor3 = Color3.fromRGB(255, 215, 0)
DragIcon.ImageRectOffset = Vector2.new(404, 164)
DragIcon.ImageRectSize = Vector2.new(36, 36)

local isMinimized = false
local isOpen = true
local currentTab = "Editor"
local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://6895079853"
clickSound.Volume = 0.3
clickSound.Parent = VividEnhancements

local scripts = {
	{name = "Infinite Yield", desc = "Popular command script", category = "Commands"},
	{name = "Dex Explorer", desc = "Instance explorer & property viewer", category = "Tools"},
	{name = "Remote Spy", desc = "Monitor remote events/functions", category = "Debug"},
	{name = "Hydroxide", desc = "Script analyzer & decompiler", category = "Analysis"},
	{name = "Simple Spy", desc = "Lightweight remote logger", category = "Debug"},
	{name = "Orca", desc = "Modern UI library for hubs", category = "UI"}
}

local dragStartPos = nil
local dragStartTime = 0
local isDraggingHandle = false

local function playClick()
	pcall(function() clickSound:Play() end)
end

local function switchTab(tabName)
	currentTab = tabName
	EditorPanel.Visible = tabName == "Editor"
	ScriptsPanel.Visible = tabName == "Scripts"
	SettingsPanel.Visible = tabName == "Settings"

	EditorTab.BackgroundColor3 = tabName == "Editor" and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(30, 30, 30)
	EditorTab.TextColor3 = tabName == "Editor" and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(170, 170, 170)
	ScriptsTab.BackgroundColor3 = tabName == "Scripts" and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(30, 30, 30)
	ScriptsTab.TextColor3 = tabName == "Scripts" and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(170, 170, 170)
	SettingsTab.BackgroundColor3 = tabName == "Settings" and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(30, 30, 30)
	SettingsTab.TextColor3 = tabName == "Settings" and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(170, 170, 170)

	playClick()
end

local function updateLineNumbers()
	local text = CodeEditor.Text
	local lines = 1
	for _ in text:gmatch("\n") do
		lines = lines + 1
	end
	local nums = {}
	for i = 1, lines do
		table.insert(nums, tostring(i))
	end
	LineNumbers.Text = table.concat(nums, "\n")
	EditorScroll.CanvasSize = UDim2.new(0, 0, 0, math.max(EditorScroll.AbsoluteSize.Y, lines * (isMobile and 24 or 22)))
end

local function createScriptCard(scriptData)
	local card = Instance.new("Frame")
	card.Name = scriptData.name
	card.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	card.BorderSizePixel = 0
	card.Size = UDim2.new(1, -(isMobile and 16 or 12), 0, isMobile and 80 or 70)

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = card

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(58, 58, 58)
	stroke.Thickness = 1
	stroke.Parent = card

	local nameLabel = Instance.new("TextLabel")
	nameLabel.BackgroundTransparency = 1
	nameLabel.Position = UDim2.new(0, 12, 0, 8)
	nameLabel.Size = UDim2.new(1, -24, 0, 20)
	nameLabel.Font = Enum.Font.GothamBold
	nameLabel.Text = scriptData.name
	nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	nameLabel.TextSize = isMobile and 15 or 14
	nameLabel.TextXAlignment = Enum.TextXAlignment.Left
	nameLabel.Parent = card

	local descLabel = Instance.new("TextLabel")
	descLabel.BackgroundTransparency = 1
	descLabel.Position = UDim2.new(0, 12, 0, 28)
	descLabel.Size = UDim2.new(1, -24, 0, 18)
	descLabel.Font = Enum.Font.Gotham
	descLabel.Text = scriptData.desc
	descLabel.TextColor3 = Color3.fromRGB(170, 170, 170)
	descLabel.TextSize = isMobile and 12 or 11
	descLabel.TextXAlignment = Enum.TextXAlignment.Left
	descLabel.Parent = card

	local categoryLabel = Instance.new("TextLabel")
	categoryLabel.BackgroundTransparency = 1
	categoryLabel.Position = UDim2.new(0, 12, 0, 46)
	categoryLabel.Size = UDim2.new(0, 80, 0, 18)
	categoryLabel.Font = Enum.Font.GothamBold
	categoryLabel.Text = scriptData.category
	categoryLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
	categoryLabel.TextSize = isMobile and 10 or 9
	categoryLabel.TextXAlignment = Enum.TextXAlignment.Left
	categoryLabel.Parent = card

	card.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			CodeEditor.Text = string.format("-- %s\n-- %s\n-- Category: %s\n\n-- Load script here (requires executor environment)\n-- Example: loadstring(game:HttpGet('https://raw.githubusercontent.com/...'))()", scriptData.name, scriptData.desc, scriptData.category)
			updateLineNumbers()
			switchTab("Editor")
		end
	end)

	return card
end

local function createSettingRow(name, desc, defaultValue)
	local row = Instance.new("Frame")
	row.BackgroundTransparency = 1
	row.Size = UDim2.new(1, -(isMobile and 16 or 12), 0, isMobile and 50 or 44)

	local label = Instance.new("TextLabel")
	label.BackgroundTransparency = 1
	label.Position = UDim2.new(0, 12, 0, 0)
	label.Size = UDim2.new(1, -70, 0, isMobile and 24 or 20)
	label.Font = Enum.Font.GothamBold
	label.Text = name
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.TextSize = isMobile and 14 or 12
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = row

	local descLabel = Instance.new("TextLabel")
	descLabel.BackgroundTransparency = 1
	descLabel.Position = UDim2.new(0, 12, 0, isMobile and 24 or 20)
	descLabel.Size = UDim2.new(1, -70, 0, isMobile and 18 or 16)
	descLabel.Font = Enum.Font.Gotham
	descLabel.Text = desc
	descLabel.TextColor3 = Color3.fromRGB(170, 170, 170)
	descLabel.TextSize = isMobile and 11 or 10
	descLabel.TextXAlignment = Enum.TextXAlignment.Left
	descLabel.Parent = row

	local toggle = Instance.new("TextButton")
	toggle.AnchorPoint = Vector2.new(1, 0.5)
	toggle.BackgroundColor3 = defaultValue and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(58, 58, 58)
	toggle.Position = UDim2.new(1, -12, 0.5, 0)
	toggle.Size = UDim2.new(0, isMobile and 48 or 40, 0, isMobile and 26 or 22)
	toggle.Font = Enum.Font.GothamBold
	toggle.Text = ""
	toggle.TextSize = 12

	local toggleCorner = Instance.new("UICorner")
	toggleCorner.CornerRadius = UDim.new(1, 0)
	toggleCorner.Parent = toggle

	local knob = Instance.new("Frame")
	knob.AnchorPoint = Vector2.new(0, 0.5)
	knob.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	knob.Position = defaultValue and UDim2.new(1, -(isMobile and 24 or 20), 0.5, 0) or UDim2.new(0, 3, 0.5, 0)
	knob.Size = UDim2.new(0, isMobile and 20 or 16, 0, isMobile and 20 or 16)

	local knobCorner = Instance.new("UICorner")
	knobCorner.CornerRadius = UDim.new(1, 0)
	knobCorner.Parent = knob
	knob.Parent = toggle

	toggle.MouseButton1Click:Connect(function()
		defaultValue = not defaultValue
		TweenService:Create(toggle, TweenInfo.new(0.2), {BackgroundColor3 = defaultValue and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(58, 58, 58)}):Play()
		TweenService:Create(knob, TweenInfo.new(0.2), {Position = defaultValue and UDim2.new(1, -(isMobile and 24 or 20), 0.5, 0) or UDim2.new(0, 3, 0.5, 0)}):Play()
		playClick()
	end)

	toggle.Parent = row
	return row
end

local function openUI()
	isOpen = true
	MainFrame.Visible = true
	DragHandle.Visible = false
	MainFrame.Size = UDim2.new(0, 0, 0, 0)
	TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, frameWidth, 0, frameHeight)}):Play()
	playClick()
end

local function closeUI()
	isOpen = false
	TweenService:Create(MainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
	task.wait(0.2)
	MainFrame.Visible = false
	DragHandle.Visible = true
	playClick()
end

local function toggleMinimize()
	isMinimized = not isMinimized
	if isMinimized then
		TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, frameWidth, 0, isMobile and 44 or 40)}):Play()
		PanelsFrame.Visible = false
		TabsFrame.Visible = false
		MinimizeBtn.Text = "+"
	else
		TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, frameWidth, 0, frameHeight)}):Play()
		PanelsFrame.Visible = true
		TabsFrame.Visible = true
		MinimizeBtn.Text = "—"
	end
	playClick()
end

DragHandle.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragStartPos = Vector2.new(input.Position.X, input.Position.Y)
		dragStartTime = tick()
		isDraggingHandle = false
	end
end)

DragHandle.InputChanged:Connect(function(input)
	if dragStartPos and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = Vector2.new(input.Position.X, input.Position.Y) - dragStartPos
		if delta.Magnitude > 10 then
			isDraggingHandle = true
		end
	end
end)

DragHandle.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		if not isDraggingHandle and (tick() - dragStartTime) < 0.5 then
			openUI()
		end
		dragStartPos = nil
		isDraggingHandle = false
	end
end)

CloseBtn.MouseButton1Click:Connect(closeUI)
MinimizeBtn.MouseButton1Click:Connect(toggleMinimize)

EditorTab.MouseButton1Click:Connect(function() switchTab("Editor") end)
ScriptsTab.MouseButton1Click:Connect(function() switchTab("Scripts") end)
SettingsTab.MouseButton1Click:Connect(function() switchTab("Settings") end)

CodeEditor:GetPropertyChangedSignal("Text"):Connect(updateLineNumbers)

ExecuteBtn.MouseButton1Click:Connect(function()
	playClick()
	local code = CodeEditor.Text
	if code and code ~= "" then
		local success, err = pcall(function()
			loadstring(code)()
		end)
		if not success then
			warn("Execution error: " .. tostring(err))
		end
	end
end)

ClearBtn.MouseButton1Click:Connect(function()
	playClick()
	CodeEditor.Text = ""
	updateLineNumbers()
end)

FormatBtn.MouseButton1Click:Connect(function()
	playClick()
	local text = CodeEditor.Text
	local indent = 0
	local tabSize = 4
	local lines = text:split("\n")
	local formatted = {}
	for _, line in ipairs(lines) do
		local trimmed = line:match("^%s*(.-)%s*$")
		if trimmed:match("^end") or trimmed:match("^else") or trimmed:match("^elseif") or trimmed:match("^until") then
			indent = math.max(0, indent - 1)
		end
		table.insert(formatted, string.rep(" ", indent * tabSize) .. trimmed)
		if trimmed:match("^(if|for|while|function|repeat|do)%s") and not trimmed:match("end$") then
			indent = indent + 1
		elseif trimmed:match("^else") or trimmed:match("^elseif") then
			indent = indent + 1
		end
	end
	CodeEditor.Text = table.concat(formatted, "\n")
	updateLineNumbers()
end)

for _, scriptData in ipairs(scripts) do
	local card = createScriptCard(scriptData)
	card.Parent = ScriptsScroll
end

ScriptsScroll.CanvasSize = UDim2.new(0, 0, 0, #scripts * (isMobile and 88 or 76))

createSettingRow("Click Sounds", "Play sound on button interactions", true).Parent = SettingsScroll
createSettingRow("Auto Save", "Persist script to storage", true).Parent = SettingsScroll
createSettingRow("Minimize to Tray", "Hide to drag handle on minimize", true).Parent = SettingsScroll
createSettingRow("Line Numbers", "Show line numbers in editor", true).Parent = SettingsScroll

SettingsScroll.CanvasSize = UDim2.new(0, 0, 0, 4 * (isMobile and 58 or 50))

updateLineNumbers()

local parentGui = nil
pcall(function()
	parentGui = game:GetService("CoreGui")
end)
if not parentGui then
	pcall(function()
		parentGui = LocalPlayer:WaitForChild("PlayerGui", 5)
	end)
end
if not parentGui then
	parentGui = game:GetService("StarterGui")
end

VividEnhancements.Parent = parentGui