local function waitForLoadingScreen()
	local players = game:GetService("Players")
	local coreGui = game:GetService("CoreGui")

	if not game:IsLoaded() then
		game.Loaded:Wait()
	end

	local player = players.LocalPlayer
	while not player do
		players:GetPropertyChangedSignal("LocalPlayer"):Wait()
		player = players.LocalPlayer
	end

	local playerGui = player:WaitForChild("PlayerGui")
	local function isActiveLoadingGui(object)
		local normalizedName = object.Name:lower():gsub("[%s_%-]", "")
		if normalizedName ~= "loadingscreen" and not normalizedName:find("loadingscreen", 1, true) then
			return false
		end

		local current = object
		while current and current ~= playerGui and current ~= coreGui do
			if current:IsA("LayerCollector") and not current.Enabled then
				return false
			end
			if current:IsA("GuiObject") and not current.Visible then
				return false
			end
			current = current.Parent
		end
		return object:IsDescendantOf(playerGui) or object:IsDescendantOf(coreGui)
	end

	local clearSince
	repeat
		local loading = false
		for _, root in ipairs({playerGui, coreGui}) do
			for _, object in ipairs(root:GetDescendants()) do
				if isActiveLoadingGui(object) then
					loading = true
					break
				end
			end
			if loading then break end
		end

		clearSince = loading and nil or (clearSince or os.clock())
		task.wait(0.1)
	until clearSince and os.clock() - clearSince >= 0.5
end

waitForLoadingScreen()

-- ========== EXECUTOR COMPATIBILITY LAYER (Delta iOS support) ==========
local function safeGet(name, fallback)
	local ok, val = pcall(function() return _G[name] or getgenv()[name] end)
	return ok and val or fallback
end

local cloneref = safeGet("cloneref", function(obj) return obj end)
local hookfunction = safeGet("hookfunction", function(fn, replacement) return fn end)
local newcclosure = safeGet("newcclosure", function(fn) return fn end)
local setthreadidentity = safeGet("setthreadidentity", function() end)
local getrenv = safeGet("getrenv", function() return _G end)
local getrawmetatable = safeGet("getrawmetatable", function(t) return getmetatable(t) end)
local setrawmetatable = safeGet("setrawmetatable", function(t, mt) return setmetatable(t, mt) end)
local debug_traceback = safeGet("debug", {traceback = function() return "" end}).traceback
local isexecutorclosure = safeGet("isexecutorclosure", function() return false end)
local checkcaller = safeGet("checkcaller", function() return false end)
local getcallingscript = safeGet("getcallingscript", function() return nil end)

local safeNewcclosure = function(fn)
	return newcclosure(fn)
end

-- ========== END COMPATIBILITY LAYER ==========

do
    if not getgenv().__LionStartupHooks then
        getgenv().__LionStartupHooks = true
        pcall(function() setthreadidentity(8) end)

        local okEnv, renv = pcall(getrenv)
        local setmetatableTarget = okEnv and renv and renv.setmetatable
        if hookfunction and setmetatableTarget then
            local oldSetmetatable = setmetatableTarget
            local okHook, hooked = pcall(hookfunction, setmetatableTarget, safeNewcclosure(function(Table, Metatable)
                if Metatable and type(Metatable) == "table" and rawget(Metatable, "__mode") then
                    local mode = rawget(Metatable, "__mode")
                    if mode == "kv" or mode == "v" or mode == "k" then
                        local okTrace, trace = pcall(debug_traceback)
                        trace = okTrace and trace or ""
                        if trace:find("MiscellaneousController", 1, true)
                            or trace:find("CameraSecurity", 1, true)
                            or trace:find("AnalyticsPipelineController", 1, true) then
                            return oldSetmetatable({1, 2, 3}, {})
                        end
                    end
                end
                return oldSetmetatable(Table, Metatable)
            end))
            if okHook and hooked then
                oldSetmetatable = hooked
            end
        end

        local okPlayer, localPlayer = pcall(function()
            return cloneref(game:GetService("Players")).LocalPlayer
        end)
        if okPlayer and localPlayer and hookfunction then
            pcall(function()
                local oldKick
                oldKick = hookfunction(localPlayer.Kick, safeNewcclosure(function(self, ...)
                    if self == localPlayer then return nil end
                    return oldKick(self, ...)
                end))
            end)

            pcall(function()
                local oldGetMouse
                oldGetMouse = hookfunction(localPlayer.GetMouse, safeNewcclosure(function(self, ...)
                    if self == localPlayer then
                        local okTrace, trace = pcall(debug_traceback)
                        if okTrace and trace:find("MiscellaneousController", 1, true) then
                            local realMouse = oldGetMouse(self, ...)
                            local fakeMouse = {}
                            setmetatable(fakeMouse, {
                                __index = function(_, key)
                                    if key == "X" or key == "Y" then
                                        local loc = game:GetService("UserInputService"):GetMouseLocation()
                                        return key == "X" and loc.X or loc.Y
                                    end
                                    local val = realMouse[key]
                                    if type(val) == "function" then
                                        return function(_, ...) return val(realMouse, ...) end
                                    end
                                    return val
                                end,
                                __newindex = function(_, key, value)
                                    realMouse[key] = value
                                end
                            })
                            return fakeMouse
                        end
                    end
                    return oldGetMouse(self, ...)
                end))
            end)
        end
    end
end

print('[~]')

local function vec2floor(v)
	return Vector2.new(math.floor(v.X), math.floor(v.Y))
end
local function vec2fdiv(v, d)
	return Vector2.new(math.floor(v.X / d), math.floor(v.Y / d))
end

local eattheF = getfenv()
local eattheG = getgenv()


local C = (cloneref(game:GetService("Players"))).LocalPlayer;
local g = C.PlayerScripts;


local cameraSecurity = require(g.Modules.CameraSecurity);
local mt = getrawmetatable(cameraSecurity)
local b = {};


local originalIndex = rawget(getmetatable(cameraSecurity) or {}, "__index");
local originalTostring = rawget(getmetatable(cameraSecurity) or {}, "__tostring");
local originalNewindex = rawget(getmetatable(cameraSecurity) or {}, "__newindex");

mt.__index = function(...)
    return nil;
end;

mt.__tostring = function(...)
    return "LocalPlayer = nil";
end;

mt.__newindex = function(E, G, f, ...)
    return rawset(E, G, f);
end;


print(cameraSecurity, b)


local ReplicatedStorage = cloneref(game:GetService('ReplicatedStorage'))
local Players = cloneref(game:GetService("Players"))
local ReplicatedFirst = cloneref(game:GetService('ReplicatedFirst'))

local mainapi = setmetatable({
	Tabs = {};
	Keybind = {};
	Font = Enum.Font.BuilderSans;
	Loaded = false;
	Modules = {};
	Catalogs = {};
	Libraries = {};
	Binds = {};
	Place = game.PlaceId;
	ThreadFix = false;
	Scale = {Value = 1};
	GradientKeypoints = 5;
	TargetHudFrame = Instance.new("Frame");
	MainScreenGui = Instance.new("ScreenGui");
	ClickGuiStatus = false;
	SecurityDisabled = false;
	SearchText = "";

})

for _, service in pairs({Players, workspace, ReplicatedStorage, ReplicatedFirst}) do
	service.Name = service.Name .. " "
end

coroutine.wrap(function()
	while wait(1) do
		local status, err = pcall(function()
			return game:Kick()
		end)

		if status then
			print("[ANTI-CHEAT] Hook detected: game:Kick() returned successfully")
			--require(game:GetService("ReplicatedFirst"):WaitForChild("AnalyticsPipelineController"):WaitForChild("AnalyticsPipeline"))({}, {11, -11, 111})
		end
	end
end)()

task.spawn(function()
	local ServerPing = workspace:WaitForChild("ServerPing")
	local Remotes = ReplicatedStorage:FindFirstChild("Remotes")
	local PingRemote = Remotes and Remotes:FindFirstChild("Ping")

	while wait(12 * math.random()) do
		local rnd = math.random(1, 9999)
		local value = rnd == 6961 and 2137 or rnd == ServerPing.Value and 2138 or rnd

		if PingRemote then
			PingRemote:FireServer(value)
		end
	end
end)

task.spawn(function()
	while task.wait(1) do
		local ok, count = pcall(function()
			return #getmetatable(mainapi)
		end)

		if ok and count ~= 4 then
			print("[ANTI-CHEAT] Metatable tampering detected")
			--require(game:GetService("ReplicatedFirst"):WaitForChild("AnalyticsPipelineController"):WaitForChild("AnalyticsPipeline"))({-10}, {15, -150})
		end
	end
end)

mainapi.BindingBusy = false
mainapi.ActiveBindCancel = nil
mainapi.SuppressModuleClickUntil = 0
mainapi.SuppressBindToggleUntil = 0
local Modern = shared.Modern

local cloneref = cloneref or function(obj)
	return obj
end


local UserInputService = cloneref(game:GetService('UserInputService'))
local TextChatService = cloneref(game:GetService("TextChatService"))
local TweenService = cloneref(game:GetService('TweenService'))
local TextService = cloneref(game:GetService('TextService'))
local GuiService = cloneref(game:GetService('GuiService'))
local RunService = cloneref(game:GetService('RunService'))
local HttpService = cloneref(game:GetService('HttpService'))
local CoreGui = cloneref(game:GetService('CoreGui'))
local Lighting = cloneref(game:GetService("Lighting"))
local Players = cloneref(game:GetService('Players'))
local ReplicatedStorage = cloneref(game:GetService('ReplicatedStorage'))
local VirtualInputManager = cloneref(game:GetService('VirtualInputManager'))
local GroupService = cloneref(game:GetService('GroupService'))
local MarketplaceService = cloneref(game:GetService('MarketplaceService'))
local ContextService = cloneref(game:GetService("ContextActionService"))
local LocalPlayer = Players.LocalPlayer
local fontsize = Instance.new('GetTextBoundsParams')
fontsize.Width = math.huge

local shootingRangeCache, shootingRangeChecked = false, 0
local function isShootingRange()
    local now = os.clock()
    if now - shootingRangeChecked < 0.5 then return shootingRangeCache end
    shootingRangeChecked = now

    local function matches(value)
        if value == nil then return false end
        local text = tostring(value):lower():gsub("[%s_%-]", "")
        return text:find("shootingrange", 1, true) ~= nil
            or text:find("firingrange", 1, true) ~= nil
            or text:find("사격장", 1, true) ~= nil
    end

    for _, object in ipairs({workspace, LocalPlayer}) do
        for _, attribute in ipairs({"Map", "MapName", "Mode", "GameMode", "Arena", "Environment", "EnvironmentName", "ShootingRange"}) do
            local value = object:GetAttribute(attribute)
            if (value == true and attribute == "ShootingRange") or matches(value) then
                shootingRangeCache = true
                return true
            end
        end
    end

    for _, object in ipairs({workspace, LocalPlayer}) do
        for _, attribute in ipairs({"Map", "MapName", "Mode", "GameMode", "Arena", "Environment", "EnvironmentName", "ShootingRange"}) do
            local value = object:GetAttribute(attribute)
            if (value == true and attribute == "ShootingRange") or matches(value) then
                shootingRangeCache = true
                return true
            end
        end
    end

    local character = LocalPlayer.Character
    local current = character
    while current and current ~= workspace do
        if matches(current.Name) then
            shootingRangeCache = true
            return true
        end
        current = current.Parent
    end

    local root = character and character:FindFirstChild("HumanoidRootPart")
    local function matchingAreaIsNear(object)
        if not matches(object.Name) or not root then return false end
        local part = object:IsA("BasePart") and object or object:FindFirstChildWhichIsA("BasePart", true)
        return part and (part.Position - root.Position).Magnitude < 2000
    end
    for _, child in ipairs(workspace:GetChildren()) do
        if matchingAreaIsNear(child) then
            shootingRangeCache = true
            return true
        end
        for _, grandchild in ipairs(child:GetChildren()) do
            if matchingAreaIsNear(grandchild) then
                shootingRangeCache = true
                return true
            end
        end
    end

    shootingRangeCache = false
    return false
end

local MenuBlur = Lighting:FindFirstChild("LionMenuBlur")
if not MenuBlur or not MenuBlur:IsA("BlurEffect") then
    MenuBlur = Instance.new("BlurEffect")
    MenuBlur.Name = "LionMenuBlur"
    MenuBlur.Parent = Lighting
end