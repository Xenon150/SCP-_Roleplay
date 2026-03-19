-- ============================================
-- XENON | SCP: Roleplay
-- Adapted for XenonLib
-- ============================================

-- Cleanup previous instances
if getgenv().XenonLoaded then
    if getgenv().XenonScreenGui then getgenv().XenonScreenGui:Destroy() end
    if getgenv().MobileButton then getgenv().MobileButton:Destroy() end
end
getgenv().XenonLoaded = true

-- Key System
local VALID_KEY = "Jkfq12lvwfwg51vdc"
local GETKEY_LINK = "https://discord.gg/9Fyh42Hs"
local hasAccess = false

if not hasAccess then
    local TweenService = game:GetService("TweenService")
    local gui = Instance.new("ScreenGui")
    gui.Name = "XenonKeyUI"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.Parent = game.CoreGui
    
    local blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = game.Lighting
    TweenService:Create(blur, TweenInfo.new(0.4), {Size = 20}):Play()
    
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1,0,1,0)
    bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
    bg.BackgroundTransparency = 1
    bg.Parent = gui
    TweenService:Create(bg, TweenInfo.new(0.4), {BackgroundTransparency = 0.4}):Play()
    
    local main = Instance.new("Frame")
    main.Size = UDim2.new(0, 0, 0, 0)
    main.Position = UDim2.new(0.5,0,0.5,0)
    main.AnchorPoint = Vector2.new(0.5,0.5)
    main.BackgroundColor3 = Color3.fromRGB(15,15,15)
    main.Parent = gui
    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)
    
    local grad = Instance.new("UIGradient", main)
    grad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(20,20,20)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(10,10,10))
    }
    
    TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
        Size = UDim2.new(0, 340, 0, 220)
    }):Play()
    
    local line = Instance.new("Frame", main)
    line.Size = UDim2.new(1,0,0,2)
    line.BackgroundColor3 = Color3.fromRGB(0,160,255)
    
    local title = Instance.new("TextLabel", main)
    title.Size = UDim2.new(1,0,0,50)
    title.BackgroundTransparency = 1
    title.Text = "XENON"
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 20
    title.TextColor3 = Color3.fromRGB(255,255,255)
    
    local sub = Instance.new("TextLabel", main)
    sub.Size = UDim2.new(1,0,0,20)
    sub.Position = UDim2.new(0,0,0,35)
    sub.BackgroundTransparency = 1
    sub.Text = "SCP: Roleplay"
    sub.Font = Enum.Font.Gotham
    sub.TextSize = 12
    sub.TextColor3 = Color3.fromRGB(130,130,130)
    
    local input = Instance.new("TextBox", main)
    input.Size = UDim2.new(0.8,0,0,40)
    input.Position = UDim2.new(0.1,0,0.45,0)
    input.BackgroundColor3 = Color3.fromRGB(25,25,25)
    input.Text = ""
    input.PlaceholderText = "Enter your key..."
    input.Font = Enum.Font.Gotham
    input.TextSize = 14
    input.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", input).CornerRadius = UDim.new(0,10)
    Instance.new("UIStroke", input).Color = Color3.fromRGB(40,40,40)
    
    local unlock = Instance.new("TextButton", main)
    unlock.Size = UDim2.new(0.8,0,0,35)
    unlock.Position = UDim2.new(0.1,0,0.68,0)
    unlock.Text = "Unlock"
    unlock.Font = Enum.Font.GothamBold
    unlock.TextSize = 14
    unlock.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", unlock).CornerRadius = UDim.new(0,10)
    local unlockGrad = Instance.new("UIGradient", unlock)
    unlockGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,160,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0,90,200))
    }
    Instance.new("UIStroke", unlock).Color = Color3.fromRGB(0,160,255)
    
    local getkey = Instance.new("TextButton", main)
    getkey.Size = UDim2.new(0.8,0,0,28)
    getkey.Position = UDim2.new(0.1,0,0.85,0)
    getkey.Text = "Get Key"
    getkey.Font = Enum.Font.Gotham
    getkey.TextSize = 12
    getkey.TextColor3 = Color3.fromRGB(200,200,200)
    getkey.BackgroundColor3 = Color3.fromRGB(30,30,30)
    Instance.new("UICorner", getkey).CornerRadius = UDim.new(0,10)
    Instance.new("UIStroke", getkey).Color = Color3.fromRGB(60,60,60)
    
    local status = Instance.new("TextLabel", main)
    status.Size = UDim2.new(1,0,0,18)
    status.Position = UDim2.new(0,0,1,-18)
    status.BackgroundTransparency = 1
    status.Text = ""
    status.Font = Enum.Font.Gotham
    status.TextSize = 12
    status.TextColor3 = Color3.fromRGB(255,80,80)
    
    getkey.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(GETKEY_LINK)
            status.TextColor3 = Color3.fromRGB(100,255,100)
            status.Text = "Link copied!"
        else
            status.Text = "Clipboard not supported"
        end
    end)
    
    local unlocked = false
    unlock.MouseButton1Click:Connect(function()
        if input.Text == VALID_KEY then
            status.TextColor3 = Color3.fromRGB(100,255,100)
            status.Text = "Access granted"
            unlocked = true
            TweenService:Create(main, TweenInfo.new(0.3), {Size = UDim2.new(0,0,0,0)}):Play()
            task.wait(0.3)
            gui:Destroy()
            blur:Destroy()
        else
            status.Text = "Invalid key"
        end
    end)
    repeat task.wait() until unlocked
end

-- Load XenonLib
local XenonLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Xenon150/Xenon-GUI/refs/heads/main/GUI.lua"))()
local Notification = XenonLib:CreateNotification()
local Logging = XenonLib:CreateLogger()

-- Services
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local camera = workspace.CurrentCamera
local LP = Players.LocalPlayer

-- Mobile Detection
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
local autoScale = isMobile and XenonLib.Scales.Mobile or XenonLib.Scales.Default

-- Create Window
local window = XenonLib:CreateWindow({
    Logo = XenonLib.GlobalLogo,
    Name = "Xenon",
    Content = "SCP: Roleplay",
    Size = autoScale,
    ConfigFolder = "XenonConfigs",
    Enable3DRenderer = false,
    Keybind = "K"
})

getgenv().XenonScreenGui = XenonLib.ScreenGui

if isMobile then
    task.wait(0.2)
    window:SetSize(XenonLib.Scales.Mobile)
end

-- Hide Xenon branding
pcall(function()
    for _, v in pairs(XenonLib.ScreenGui:GetDescendants()) do
        if v:IsA("Frame") and v:FindFirstChild("pencil-square") then v.Visible = false end
        if v:IsA("TextLabel") and v.Text == "pencil-square" then
            local parent = v.Parent
            if parent then parent.Visible = false end
        end
    end
end)

-- Mobile Button
if isMobile then
    local mobileButton = Instance.new("ScreenGui")
    mobileButton.Name = "XenonMobileButton"
    mobileButton.ResetOnSpawn = false
    mobileButton.Parent = game:GetService("CoreGui")
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 60, 0, 60)
    button.Position = UDim2.new(0.5, -30, 0.9, -30)
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    button.BackgroundTransparency = 0.3
    button.Text = "Menu"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 20
    button.Font = Enum.Font.SourceSansBold
    button.BorderSizePixel = 0
    button.Parent = mobileButton
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 30)
    corner.Parent = button
    
    local dragToggle, dragStart, startPos = nil, nil, nil
    local function updateDrag(input)
        local delta = input.Position - dragStart
        local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        button.Position = newPos
    end
    
    button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            dragToggle = true
            dragStart = input.Position
            startPos = button.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragToggle = false end
            end)
        end
    end)
    
    button.InputChanged:Connect(function(input)
        if dragToggle and input.UserInputType == Enum.UserInputType.Touch then updateDrag(input) end
    end)
    
    button.MouseButton1Click:Connect(function() window:ToggleInterface() end)
    getgenv().MobileButton = mobileButton
end

-- Helper Functions
local function getChar() return LP.Character end
local function getRoot(c) return c and c:FindFirstChild("HumanoidRootPart") end
local function getHum(c) return c and c:FindFirstChildOfClass("Humanoid") end

-- ============================================
-- UTILITY FUNCTIONS
-- ============================================
local function isAlly(player)
    if player == LP then return true end
    local myTeam, theirTeam = LP.Team, player.Team
    if not myTeam or not theirTeam then return false end
    
    local myT, theirT = myTeam.Name:lower(), theirTeam.Name:lower()
    local classD = {"class d","class-d","classd","d-class","dclass","d class"}
    local ci = {"ci","chaos insurgency","chaos","insurgency","chaos insurgent","engineer"}
    local foundation = {"o5","o-5","overseer","mtf","mobile task force","security","guard","rapid response","foundation"}
    local scientific = {"scientist","scientific","science","researcher","research","medic","medical","doctor","nurse","paramedic"}
    
    local function chk(t, list) for _,p in ipairs(list) do if t:find(p) then return true end end return false end
    
    local mCD, mCI, mF, mS = chk(myT,classD), chk(myT,ci), chk(myT,foundation), chk(myT,scientific)
    local tCD, tCI, tF, tS = chk(theirT,classD), chk(theirT,ci), chk(theirT,foundation), chk(theirT,scientific)
    
    if (mCD and tCI) or (mCI and tCD) or (mCD and tCD) or (mCI and tCI) then return true end
    if (mF and tF) or (mF and tS) or (mS and tF) or (mS and tS) then return true end
    return false
end

local function getPlayerRole(player)
    if not player or not player.Team then return "Unknown" end
    local tn = player.Team.Name:lower()
    if tn:find("scp") then return "SCP" end
    if tn:find("mtf") or tn:find("mobile") then return "MTF" end
    if tn:find("chaos") then return "Chaos" end
    if tn:find("scientist") then return "Scientist" end
    if tn:find("class") or tn:find("d%-") then return "ClassD" end
    if tn:find("guard") then return "Guard" end
    if tn:find("tutorial") then return "Tutorial" end
    if tn:find("spectator") then return "Spectator" end
    return "Unknown"
end

local function playerHasWeapon(player)
    if not player or not player.Character then return false end
    local char = player.Character
    if char:FindFirstChildOfClass("Tool") or char:FindFirstChildOfClass("HopperBin") then return true end
    for _, child in ipairs(char:GetChildren()) do
        if child:IsA("BasePart") and (child.Name:lower():find("gun") or child.Name:lower():find("weapon") or child.Name:lower():find("rifle")) then
            return true
        end
    end
    return false
end

local function isModerator(player)
    local name = player.Name:lower()
    local patterns = {"%[mod%]","%[admin%]","%[owner%]","%[dev%]","moderator","administrator","owner","dev"}
    for _, p in ipairs(patterns) do if name:find(p) then return true end end
    local char = player.Character
    if char and (char:FindFirstChild("Admin") or char:FindFirstChild("Moderator")) then return true end
    return false
end

local function getPlayerTeamColor(player)
    return player.Team and player.TeamColor.Color or Color3.fromRGB(255,255,255)
end

local function getHealthColor(health, maxHealth)
    if health <= 0 or maxHealth <= 0 then return Color3.fromRGB(0,0,0) end
    local pct = health / maxHealth
    return Color3.new(math.clamp(2*(1-pct),0,1), math.clamp(2*pct,0,1), 0)
end

-- ============================================
-- CONFIG SYSTEM
-- ============================================
local CONFIG_FOLDER = "XenonConfigs"
local function ensureFolder() if not isfolder(CONFIG_FOLDER) then makefolder(CONFIG_FOLDER) end end

-- Variables for config
local fullbrightEnabled, boxesEnabled, rayTracingEnabled = false, false, false
local aimbotEnabled, fovEnabled, checkWalls, ignoreTeam, ignoreUnarmedClassD = false, true, true, true, true
local fovRadius, maxDistance = 150, 1000
local rayThickness, rayTransparency = 1, 0.8
local boxConfig = {ShowTeamColor=true, ShowHealthBar=true, TextSize=14, BoxThickness=1, BoxTransparency=0.5, TextTransparency=0, HealthBarThickness=2, HealthBarWidth=50, HealthBarHeight=5, MaxDistance=1000}
local rayColor, rayTeamColor = Color3.fromRGB(255,0,0), Color3.fromRGB(0,255,0)
local clickDelay, autoGrilleEnabled = 100, false
local moderatorCheckInterval = 30

local function getCurrentData()
    return {
        fullbrightEnabled = fullbrightEnabled,
        boxesEnabled = boxesEnabled,
        rayTracingEnabled = rayTracingEnabled,
        aimbotEnabled = aimbotEnabled,
        fovEnabled = fovEnabled,
        checkWalls = checkWalls,
        ignoreTeam = ignoreTeam,
        ignoreUnarmedClassD = ignoreUnarmedClassD,
        fovRadius = fovRadius,
        maxDistance = maxDistance,
        rayThickness = rayThickness,
        rayTransparency = rayTransparency,
        boxConfig = boxConfig,
        rayColor = {rayColor.R, rayColor.G, rayColor.B},
        rayTeamColor = {rayTeamColor.R, rayTeamColor.G, rayTeamColor.B},
        clickDelay = clickDelay,
        autoGrilleEnabled = autoGrilleEnabled,
        moderatorCheckInterval = moderatorCheckInterval
    }
end

local function applyData(data, toggles)
    if not data then return end
    if data.fullbrightEnabled ~= nil then fullbrightEnabled = data.fullbrightEnabled; setFullbright(fullbrightEnabled) end
    if data.boxesEnabled ~= nil then boxesEnabled = data.boxesEnabled end
    if data.rayTracingEnabled ~= nil then rayTracingEnabled = data.rayTracingEnabled; if rayTracingEnabled then enableRayTracing() else disableRayTracing() end end
    if data.aimbotEnabled ~= nil then aimbotEnabled = data.aimbotEnabled end
    if data.fovEnabled ~= nil then fovEnabled = data.fovEnabled end
    if data.checkWalls ~= nil then checkWalls = data.checkWalls end
    if data.ignoreTeam ~= nil then ignoreTeam = data.ignoreTeam end
    if data.ignoreUnarmedClassD ~= nil then ignoreUnarmedClassD = data.ignoreUnarmedClassD end
    if data.fovRadius ~= nil then fovRadius = data.fovRadius end
    if data.maxDistance ~= nil then maxDistance = data.maxDistance; boxConfig.MaxDistance = maxDistance end
    if data.rayThickness ~= nil then rayThickness = data.rayThickness end
    if data.rayTransparency ~= nil then rayTransparency = data.rayTransparency end
    if data.boxConfig ~= nil then boxConfig = data.boxConfig end
    if data.rayColor ~= nil then rayColor = Color3.new(data.rayColor[1], data.rayColor[2], data.rayColor[3]) end
    if data.rayTeamColor ~= nil then rayTeamColor = Color3.new(data.rayTeamColor[1], data.rayTeamColor[2], data.rayTeamColor[3]) end
    if data.clickDelay ~= nil then clickDelay = data.clickDelay end
    if data.autoGrilleEnabled ~= nil then autoGrilleEnabled = data.autoGrilleEnabled end
    if data.moderatorCheckInterval ~= nil then moderatorCheckInterval = data.moderatorCheckInterval end
    
    if toggles then
        if toggles.Fullbright then toggles.Fullbright:SetValue(fullbrightEnabled) end
        if toggles.BoxESP then toggles.BoxESP:SetValue(boxesEnabled) end
        if toggles.Raytracing then toggles.Raytracing:SetValue(rayTracingEnabled) end
        if toggles.Aimbot then toggles.Aimbot:SetValue(aimbotEnabled) end
        if toggles.FOVShow then toggles.FOVShow:SetValue(fovEnabled) end
        if toggles.WallCheck then toggles.WallCheck:SetValue(checkWalls) end
        if toggles.IgnoreTeam then toggles.IgnoreTeam:SetValue(ignoreTeam) end
        if toggles.IgnoreUnarmed then toggles.IgnoreUnarmed:SetValue(ignoreUnarmedClassD) end
        if toggles.AutoGrille then toggles.AutoGrille:SetValue(autoGrilleEnabled) end
    end
end

local function saveConfig(name)
    if not name or name == "" then Logging.new("triangle-exclamation", "Enter config name", 3); return end
    ensureFolder()
    local ok, encoded = pcall(function() return HttpService:JSONEncode(getCurrentData()) end)
    if ok then writefile(CONFIG_FOLDER.."/"..name..".json", encoded); Logging.new("folder", "Saved: "..name, 3) end
end

local function getConfigList()
    ensureFolder()
    local list = {}
    local ok, files = pcall(listfiles, CONFIG_FOLDER)
    if not ok then return list end
    for _, path in pairs(files) do
        local name = string.match(path, "([^/\\]+)%.json$")
        if name then table.insert(list, name) end
    end
    return list
end

-- ============================================
-- CONNECTIONS CLEANUP
-- ============================================
if getgenv().XenonConnections then
    for _, c in pairs(getgenv().XenonConnections) do pcall(function() c:Disconnect() end) end
end
getgenv().XenonConnections = {}

-- ============================================
-- FULLBRIGHT
-- ============================================
local fullbrightConnection = nil
local function setFullbright(state)
    if state then
        pcall(function()
            Lighting.Ambient = Color3.fromRGB(255,255,255)
            Lighting.Brightness = 1
            Lighting.FogEnd = 1e10
            for _, v in pairs(Lighting:GetDescendants()) do
                if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") then v.Enabled = false end
            end
            if not fullbrightConnection then
                fullbrightConnection = Lighting.Changed:Connect(function()
                    if fullbrightEnabled then
                        Lighting.Ambient = Color3.fromRGB(255,255,255)
                        Lighting.Brightness = 1
                        Lighting.FogEnd = 1e10
                    end
                end)
            end
            task.spawn(function()
                while fullbrightEnabled do
                    local char = LP.Character
                    if char and char:FindFirstChild("HumanoidRootPart") and not char.HumanoidRootPart:FindFirstChildWhichIsA("PointLight") then
                        local light = Instance.new("PointLight", char.HumanoidRootPart)
                        light.Brightness = 1; light.Range = 60
                    end
                    task.wait(2)
                end
            end)
        end)
    else
        Lighting.Ambient = Color3.fromRGB(127,127,127)
        Lighting.Brightness = 1
        Lighting.FogEnd = 100000
        if fullbrightConnection then fullbrightConnection:Disconnect(); fullbrightConnection = nil end
    end
end

-- ============================================
-- DOOR REMOVER
-- ============================================
local doorKeywords = {"Door","Gate","door","gate","DOOR","GATE"}
local function containsKeyword(name)
    for _, kw in ipairs(doorKeywords) do if string.find(name, kw) then return true end end
    return false
end
local function deleteAll(parent)
    local count = 0
    for _, obj in ipairs(parent:GetChildren()) do
        if containsKeyword(obj.Name) then obj:Destroy(); count = count + 1
        else count = count + deleteAll(obj) end
    end
    return count
end

-- ============================================
-- ESP / RAYTRACING
-- ============================================
local rayLines, boxes = {}, {}

local function createRayLine(player)
    if rayLines[player.Name] then rayLines[player.Name]:Remove(); rayLines[player.Name] = nil end
    local line = Drawing.new("Line")
    line.Visible = false; line.From = Vector2.new(0,0); line.To = Vector2.new(0,0)
    line.Color = isAlly(player) and rayTeamColor or rayColor
    line.Thickness = rayThickness; line.Transparency = rayTransparency
    rayLines[player.Name] = line
end

local function updateRayTracing()
    if not rayTracingEnabled then for _, line in pairs(rayLines) do line.Visible = false end; return end
    local camPos = camera.CFrame.Position
    local screenBottom = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y)
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LP and player.Character then
            local root = player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local dist = (root.Position - camPos).Magnitude
                if dist <= maxDistance then
                    local screenPos, onScreen = camera:WorldToViewportPoint(root.Position)
                    if onScreen and rayLines[player.Name] then
                        rayLines[player.Name].From = screenBottom
                        rayLines[player.Name].To = Vector2.new(screenPos.X, screenPos.Y)
                        rayLines[player.Name].Color = isAlly(player) and rayTeamColor or rayColor
                        rayLines[player.Name].Visible = true
                    elseif rayLines[player.Name] then rayLines[player.Name].Visible = false end
                elseif rayLines[player.Name] then rayLines[player.Name].Visible = false end
            elseif rayLines[player.Name] then rayLines[player.Name].Visible = false end
        end
    end
end

local function enableRayTracing()
    rayTracingEnabled = true
    for _, player in ipairs(Players:GetPlayers()) do if player ~= LP then createRayLine(player) end end
end

local function disableRayTracing()
    rayTracingEnabled = false
    for _, line in pairs(rayLines) do line:Remove() end
    rayLines = {}
end

-- 2D Box ESP
local function createBoxForPlayer(player)
    if player == LP or boxes[player] then return end
    local esp = {}
    esp.Box = Drawing.new("Square"); esp.Box.Visible = false; esp.Box.Thickness = boxConfig.BoxThickness
    esp.Box.Transparency = boxConfig.BoxTransparency; esp.Box.Filled = false
    esp.Text = Drawing.new("Text"); esp.Text.Visible = false; esp.Text.Size = boxConfig.TextSize
    esp.Text.Center = true; esp.Text.Outline = true; esp.Text.Transparency = boxConfig.TextTransparency
    esp.HealthBG = Drawing.new("Square"); esp.HealthBG.Visible = false; esp.HealthBG.Thickness = boxConfig.HealthBarThickness
    esp.HealthBG.Filled = true; esp.HealthBG.Color = Color3.fromRGB(100,100,100); esp.HealthBG.Transparency = 0.7
    esp.HealthBar = Drawing.new("Square"); esp.HealthBar.Visible = false; esp.HealthBar.Thickness = boxConfig.HealthBarThickness
    esp.HealthBar.Filled = true; esp.HealthBar.Transparency = 0.7
    boxes[player] = esp
    player.AncestryChanged:Connect(function()
        if not player:IsDescendantOf(game) and boxes[player] then
            for _, obj in pairs(boxes[player]) do obj:Remove() end
            boxes[player] = nil
        end
    end)
end

local function renderBoxes()
    if not boxesEnabled then for _, esp in pairs(boxes) do for _, obj in pairs(esp) do obj.Visible = false end end; return end
    for player, esp in pairs(boxes) do
        local char = player.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") or not char:FindFirstChild("Humanoid") then
            for _, obj in pairs(esp) do obj.Visible = false end; continue end
        local root, humanoid = char:FindFirstChild("HumanoidRootPart"), char:FindFirstChild("Humanoid")
        local health, maxHealth = humanoid.Health, humanoid.MaxHealth
        if maxHealth <= 0 then maxHealth = 1 end; if health < 0 then health = 0 end
        local vec, onScreen = camera:WorldToViewportPoint(root.Position)
        local dist = (root.Position - camera.CFrame.Position).Magnitude
        if onScreen and dist <= boxConfig.MaxDistance then
            local topPos, bottomPos = root.Position + Vector3.new(0,3,0), root.Position - Vector3.new(0,3,0)
            local topVec, bottomVec = camera:WorldToViewportPoint(topPos), camera:WorldToViewportPoint(bottomPos)
            local height = math.abs(topVec.Y - bottomVec.Y); local width = height * 0.6
            local boxPos = Vector2.new(vec.X - width/2, vec.Y - height/2); local boxSize = Vector2.new(width, height)
            esp.Box.Position = boxPos; esp.Box.Size = boxSize
            esp.Box.Color = boxConfig.ShowTeamColor and getPlayerTeamColor(player) or Color3.fromRGB(255,255,255); esp.Box.Visible = true
            esp.Text.Position = Vector2.new(vec.X, boxPos.Y - 20)
            esp.Text.Text = string.format("%s [%.0f%%]", player.Name, (health/maxHealth)*100)
            esp.Text.Color = esp.Box.Color; esp.Text.Visible = true
            if boxConfig.ShowHealthBar then
                esp.HealthBG.Position = Vector2.new(vec.X - boxConfig.HealthBarWidth/2, boxPos.Y - 10)
                esp.HealthBG.Size = Vector2.new(boxConfig.HealthBarWidth, boxConfig.HealthBarHeight); esp.HealthBG.Visible = true
                local barW = boxConfig.HealthBarWidth * (health / maxHealth)
                esp.HealthBar.Position = esp.HealthBG.Position
                esp.HealthBar.Size = Vector2.new(math.max(0, barW), boxConfig.HealthBarHeight)
                esp.HealthBar.Color = getHealthColor(health, maxHealth); esp.HealthBar.Visible = true
            else esp.HealthBG.Visible = false; esp.HealthBar.Visible = false end
        else for _, obj in pairs(esp) do obj.Visible = false end end
    end
end

-- ============================================
-- AIMBOT (ОРИГИНАЛЬНЫЙ - ПРЯМОЕ ПРИЦЕЛИВАНИЕ)
-- ============================================
local partPriority = {Head=1, UpperTorso=2, LowerTorso=3, Torso=2, LeftHand=4, RightHand=4, ["Left Arm"]=4, ["Right Arm"]=4, LeftFoot=5, RightFoot=5, ["Left Leg"]=5, ["Right Leg"]=5}
local fovCircle = Drawing.new("Circle")
local lastTargetTime, lastTargetPlayer, lastTargetPart = 0, nil, nil

local function hasWeapon()
    local char = LP.Character
    if not char then return false end
    if char:FindFirstChildOfClass("Tool") or char:FindFirstChildOfClass("HopperBin") then return true end
    return false
end

local function getAvailableParts(character)
    local parts = {}
    for name, _ in pairs(partPriority) do
        local part = character:FindFirstChild(name)
        if part and part:IsA("BasePart") then table.insert(parts, part) end
    end
    return parts
end

local function isPartVisible(part, targetPlayer)
    if not checkWalls then return true end
    local camPos = camera.CFrame.Position
    local direction = (part.Position - camPos).Unit
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = {LP.Character, camera}
    local result = workspace:Raycast(camPos, direction * (part.Position - camPos).Magnitude, params)
    if result then return result.Instance:IsDescendantOf(targetPlayer.Character) end
    return true
end

local function isHeadVisible(headPart, targetPlayer)
    if not checkWalls then return true end
    local camPos = camera.CFrame.Position; local size = headPart.Size
    local offsets = {Vector3.new(0,0,0), Vector3.new(0,size.Y/2,0), Vector3.new(0,-size.Y/2,0), Vector3.new(size.X/2,0,0), Vector3.new(-size.X/2,0,0)}
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = {LP.Character, camera}
    for _, offset in ipairs(offsets) do
        local wp = headPart.CFrame:PointToWorldSpace(offset)
        local dir = (wp - camPos).Unit
        local res = workspace:Raycast(camPos, dir * (wp - camPos).Magnitude, params)
        if not res or res.Instance:IsDescendantOf(targetPlayer.Character) then return true end
    end
    return false
end

local function getBestTargetPart(player)
    local char = player.Character
    if not char then return nil end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then return nil end
    local parts = getAvailableParts(char)
    if #parts == 0 then return nil end
    table.sort(parts, function(a,b) return (partPriority[a.Name] or 99) < (partPriority[b.Name] or 99) end)
    for _, part in ipairs(parts) do
        local vis = (part.Name == "Head") and isHeadVisible(part, player) or isPartVisible(part, player)
        if vis then return part end
    end
    return nil
end

local function getTarget()
    local now = tick()
    if now - lastTargetTime < 0.1 then return lastTargetPlayer, lastTargetPart end
    lastTargetTime = now
    if not hasWeapon() then return nil, nil end
    local char = LP.Character
    if not char then return nil, nil end
    local bestTarget, bestPart, bestDist = nil, nil, fovEnabled and fovRadius or math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p == LP then continue end
        if ignoreTeam and isAlly(p) then continue end
        if ignoreUnarmedClassD and getPlayerRole(p) == "ClassD" and not playerHasWeapon(p) then continue end
        local part = getBestTargetPart(p)
        if part then
            local pos, onScreen = camera:WorldToViewportPoint(part.Position)
            if onScreen then
                local center = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)
                local dist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                if (fovEnabled and dist <= fovRadius or not fovEnabled) and dist < bestDist then
                    bestDist, bestTarget, bestPart = dist, p, part
                end
            end
        end
    end
    lastTargetPlayer, lastTargetPart = bestTarget, bestPart
    return bestTarget, bestPart
end

-- ============================================
-- AUTO GRILLE
-- ============================================
local lastClick = 0
local function isGrille(obj)
    if not obj then return false end
    local n = obj.Name:lower()
    return n:find("grille") or n:find("vent") or n:find("gate") or n:find("lattice") or n:find("решёт")
end

-- ============================================
-- MODERATOR ALERT
-- ============================================
local alertedModerators = {}
local moderatorIndicator = nil

local function onModJoined(player)
    if isModerator(player) and not alertedModerators[player] then
        alertedModerators[player] = true
        Logging.new("alert-triangle", "⚠️ MOD: "..player.Name.." joined!", 3)
    end
end

-- ============================================
-- UI SETUP
-- ============================================
local Watermark = window:Watermark()
Watermark:AddBlock("cube-vertexes", "Xenon"):Input(function() window:ToggleInterface() end)
Watermark:AddBlock(isMobile and "smartphone-portrait" or "teletype", isMobile and "Mobile" or "PC")

-- MAIN TAB
local MainTab = window:AddTab({Icon = "home", Name = "Main"})
local MainSection = MainTab:AddSection({Name = "General"})

local toggles = {}
toggles.Fullbright = MainSection:AddLabel("Enable Fullbright"):AddToggle({
    Default = false, Flag = "Fullbright",
    Callback = function(v) fullbrightEnabled = v; setFullbright(v) end
})

local DoorSection = MainTab:AddSection({Name = "Door Remover"})
DoorSection:AddButton({Name = "Delete Doors Now", Icon = "trash-can", Callback = function()
    local deleted = deleteAll(workspace)
    Logging.new("trash-can", "Deleted: "..deleted.." doors", deleted > 0 and 3 or 2)
end})

local ModSection = MainTab:AddSection({Name = "Moderator Alert"})
ModSection:AddLabel("Alert Interval (sec)"):AddSlider({
    Default = 30, Min = 10, Max = 120, Rounding = 0,
    Callback = function(v) moderatorCheckInterval = v end
})

-- ESP TAB
local ESPTab = window:AddTab({Icon = "eye", Name = "ESP"})
local ESPSection = ESPTab:AddSection({Name = "Player ESP"})

toggles.Raytracing = ESPSection:AddLabel("Raytracing (Tracelines)"):AddToggle({
    Default = false, Flag = "Raytracing",
    Callback = function(v) if v then enableRayTracing() else disableRayTracing() end end
})

toggles.BoxESP = ESPSection:AddLabel("2D Box ESP"):AddToggle({
    Default = false, Flag = "BoxESP",
    Callback = function(v) boxesEnabled = v end
})

ESPSection:AddLabel("Show Team Colors"):AddToggle({
    Default = true, Flag = "TeamColor",
    Callback = function(v) boxConfig.ShowTeamColor = v end
})

ESPSection:AddLabel("Show Health Bar"):AddToggle({
    Default = true, Flag = "HealthBar",
    Callback = function(v) boxConfig.ShowHealthBar = v end
})

ESPSection:AddLabel("Box Thickness"):AddSlider({
    Default = 1, Min = 1, Max = 5, Rounding = 0,
    Callback = function(v) boxConfig.BoxThickness = v; for _, esp in pairs(boxes) do if esp.Box then esp.Box.Thickness = v end end end
})

ESPSection:AddLabel("Box Transparency"):AddSlider({
    Default = 0.5, Min = 0, Max = 1, Rounding = 2,
    Callback = function(v) boxConfig.BoxTransparency = v; for _, esp in pairs(boxes) do if esp.Box then esp.Box.Transparency = v end end end
})

ESPSection:AddLabel("Text Size"):AddSlider({
    Default = 14, Min = 8, Max = 30, Rounding = 0,
    Callback = function(v) boxConfig.TextSize = v; for _, esp in pairs(boxes) do if esp.Text then esp.Text.Size = v end end end
})

ESPSection:AddLabel("Max Distance (m)"):AddSlider({
    Default = 1000, Min = 100, Max = 5000, Rounding = 0,
    Callback = function(v) maxDistance = v; boxConfig.MaxDistance = v end
})

ESPSection:AddLabel("Line Thickness"):AddSlider({
    Default = 1, Min = 1, Max = 5, Rounding = 0,
    Callback = function(v) rayThickness = v; for _, line in pairs(rayLines) do line.Thickness = v end end
})

ESPSection:AddLabel("Line Transparency"):AddSlider({
    Default = 0.8, Min = 0, Max = 1, Rounding = 2,
    Callback = function(v) rayTransparency = v; for _, line in pairs(rayLines) do line.Transparency = v end end
})

-- AIMBOT TAB
local AimbotTab = window:AddTab({Icon = "crosshair", Name = "Aimbot"})
local AimSection = AimbotTab:AddSection({Name = "Settings"})

toggles.Aimbot = AimSection:AddLabel("Enable Aimbot"):AddToggle({
    Default = false, Flag = "Aimbot",
    Callback = function(v) aimbotEnabled = v; if not v and fovCircle then fovCircle.Visible = false end end
})

toggles.FOVShow = AimSection:AddLabel("Show FOV"):AddToggle({
    Default = true, Flag = "FOVShow",
    Callback = function(v) fovEnabled = v end
})

AimSection:AddLabel("FOV Radius (px)"):AddSlider({
    Default = 150, Min = 50, Max = 500, Rounding = 0,
    Callback = function(v) fovRadius = v; if fovCircle then fovCircle.Radius = v end end
})

toggles.WallCheck = AimSection:AddLabel("Check Walls"):AddToggle({
    Default = true, Flag = "WallCheck",
    Callback = function(v) checkWalls = v end
})

toggles.IgnoreTeam = AimSection:AddLabel("Ignore Teammates"):AddToggle({
    Default = true, Flag = "IgnoreTeam",
    Callback = function(v) ignoreTeam = v end
})

AimSection:AddLabel("Ignore Unarmed Class-D"):AddToggle({
    Default = true, Flag = "IgnoreUnarmed",
    Callback = function(v) ignoreUnarmedClassD = v end
})

-- AUTO TAB
local AutoTab = window:AddTab({Icon = "zap", Name = "Auto"})
local AutoSection = AutoTab:AddSection({Name = "Auto Grille"})

toggles.AutoGrille = AutoSection:AddLabel("Enable Auto Grille"):AddToggle({
    Default = false, Flag = "AutoGrille",
    Callback = function(v) autoGrilleEnabled = v end
})

AutoSection:AddLabel("Click Delay (ms)"):AddSlider({
    Default = 100, Min = 10, Max = 500, Rounding = 0,
    Callback = function(v) clickDelay = v end
})

-- CONFIG TAB
local CfgTab = window:AddTab({Icon = "folder", Name = "Config"})
local CfgSection = CfgTab:AddSection({Name = "SAVE / LOAD"})

local configNameInput = CfgSection:AddLabel("Config Name"):AddTextInput({
    Default = "", Placeholder = "Enter name...", Size = 120, Flag = "ConfigName", Callback = function() end
})

CfgSection:AddButton({Name = "Save Config", Icon = "arrow-down-to-line", Callback = function()
    local name = configNameInput:GetValue(); saveConfig(name)
end})

local CfgListSection = CfgTab:AddSection({Name = "CONFIGS"})
local configDropdown = CfgListSection:AddLabel("Select Config"):AddDropdown({
    Default = nil, Values = getConfigList(), AutoUpdate = true, Size = 120, Flag = "ConfigSelect", Callback = function() end
})

CfgListSection:AddButton({Name = "Load Selected", Icon = "arrow-right-from-portrait-rectangle", Callback = function()
    local name = configDropdown:GetValue()
    if not name or name == "" then Logging.new("triangle-exclamation", "Select a config", 3); return end
    local path = CONFIG_FOLDER.."/"..name..".json"
    if not isfile(path) then Logging.new("triangle-exclamation", "File not found", 3); return end
    local ok, data = pcall(function() return HttpService:JSONDecode(readfile(path)) end)
    if not ok or not data then Logging.new("triangle-exclamation", "Load error", 3); return end
    applyData(data, toggles); Logging.new("folder", "Loaded: "..name, 3)
end})

CfgListSection:AddButton({Name = "Delete Selected", Icon = "trash-can", Callback = function()
    local name = configDropdown:GetValue()
    if not name or name == "" then Logging.new("triangle-exclamation", "Select a config", 3); return end
    local path = CONFIG_FOLDER.."/"..name..".json"
    if isfile(path) then delfile(path); configDropdown:SetValues(getConfigList()); configDropdown:SetValue(nil); Logging.new("trash-can", "Deleted: "..name, 3) end
end})

CfgListSection:AddButton({Name = "Refresh List", Icon = "arrow-rotate-right", Callback = function()
    configDropdown:SetValues(getConfigList()); Logging.new("arrow-rotate-right", "List refreshed", 2)
end})

-- SETTINGS
window.UserSettings:AddLabel("Menu Keybind"):AddKeybind({
    Default = "K", Callback = function(v) window.Keybind = v; Logging.new("ps4-touchpad", "Keybind: "..tostring(v), 5) end
})

window.UserSettings:AddLabel("Menu Scale"):AddDropdown({
    Default = isMobile and "Mobile" or "Default", Values = {"Default", "Large", "Mobile", "Small"},
    Callback = function(v) window:SetSize(XenonLib.Scales[v]); Logging.new("crop", "Scale: "..tostring(v), 5) end
})

-- ============================================
-- GAME LOOPS
-- ============================================
-- FOV Circle
if Drawing and camera then
    fovCircle.Visible = false; fovCircle.Thickness = 1; fovCircle.NumSides = 60; fovCircle.Filled = false; fovCircle.Transparency = 0.7
    local hue = 0
    table.insert(getgenv().XenonConnections, RunService.RenderStepped:Connect(function()
        if fovCircle then
            fovCircle.Position = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)
            fovCircle.Radius = fovRadius
            if aimbotEnabled and fovEnabled and hasWeapon() then
                hue = (hue + 0.002) % 1; fovCircle.Color = Color3.fromHSV(hue, 1, 1); fovCircle.Visible = true
            else fovCircle.Visible = false end
        end
    end))
end

-- Aimbot Loop (ОРИГИНАЛЬНЫЙ - ПРЯМОЕ ПРИЦЕЛИВАНИЕ)
table.insert(getgenv().XenonConnections, RunService.RenderStepped:Connect(function()
    if not aimbotEnabled or not hasWeapon() then return end
    if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return end
    local targetPlayer, targetPart = getTarget()
    if targetPlayer and targetPart then
        camera.CFrame = CFrame.lookAt(camera.CFrame.Position, targetPart.Position)
    end
end))

-- ESP Render Loop
table.insert(getgenv().XenonConnections, RunService.RenderStepped:Connect(function()
    if rayTracingEnabled then pcall(updateRayTracing) end
    pcall(renderBoxes)
end))

-- Auto Grille Logic
table.insert(getgenv().XenonConnections, RunService.RenderStepped:Connect(function()
    if not autoGrilleEnabled then return end
    local mouse = LP:GetMouse()
    if mouse.Target and isGrille(mouse.Target) then
        local now = tick() * 1000
        if now - lastClick >= clickDelay then if mouse1click then mouse1click() end; lastClick = now end
    end
end))

-- Moderator Indicator
if Drawing and camera then
    moderatorIndicator = Drawing.new("Text")
    moderatorIndicator.Visible = true; moderatorIndicator.Center = true; moderatorIndicator.Outline = true
    moderatorIndicator.Size = 20; moderatorIndicator.Position = Vector2.new(camera.ViewportSize.X/2, 30)
    
    local function updateModStatus()
        local anyMod = false
        for _, p in ipairs(Players:GetPlayers()) do if p ~= LP and isModerator(p) then anyMod = true; break end end
        if moderatorIndicator then
            moderatorIndicator.Text = anyMod and "⚠️ MOD ONLINE" or "✅ NO MOD"
            moderatorIndicator.Color = anyMod and Color3.new(1,0,0) or Color3.new(0,1,0)
        end
    end
    Players.PlayerAdded:Connect(updateModStatus); Players.PlayerRemoving:Connect(updateModStatus)
    table.insert(getgenv().XenonConnections, RunService.RenderStepped:Connect(function()
        if moderatorIndicator and camera then moderatorIndicator.Position = Vector2.new(camera.ViewportSize.X/2, 30) end
    end))
    updateModStatus()
end

-- Moderator Alert System
for _, p in ipairs(Players:GetPlayers()) do if p ~= LP then onModJoined(p) end end
Players.PlayerAdded:Connect(onModJoined)
Players.PlayerRemoving:Connect(function(p) alertedModerators[p] = nil end)

table.insert(getgenv().XenonConnections, task.spawn(function()
    while true do
        task.wait(moderatorCheckInterval)
        local anyMod = false
        for _, p in ipairs(Players:GetPlayers()) do if p ~= LP and isModerator(p) then anyMod = true; break end end
        if anyMod then Logging.new("alert-triangle", "⚠️ Moderator online!", 3) end
    end
end))

-- Player Cleanup
Players.PlayerRemoving:Connect(function(player)
    if rayLines[player.Name] then rayLines[player.Name]:Remove(); rayLines[player.Name] = nil end
    if boxes[player] then for _, obj in pairs(boxes[player]) do obj:Remove() end; boxes[player] = nil end
end)

-- Initialize for existing players
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LP then
        createBoxForPlayer(player)
        if rayTracingEnabled then createRayLine(player) end
    end
end

-- Character Added
local charConn = LP.CharacterAdded:Connect(function(newChar)
    task.wait(1)
end)
table.insert(getgenv().XenonConnections, charConn)

-- Initial Notification
Notification.new({
    Title = "Xenon",
    Content = "SCP: Roleplay | "..(isMobile and "Mobile mode" or "Press K for menu"),
    Duration = 5
})

-- Load config on start
task.spawn(function()
    task.wait(1)
    ensureFolder()
    local list = getConfigList()
    if #list > 0 then
        local path = CONFIG_FOLDER.."/"..list[1]..".json"
        if isfile(path) then
            local ok, data = pcall(function() return HttpService:JSONDecode(readfile(path)) end)
            if ok and data then applyData(data, toggles) end
        end
    end
end)
