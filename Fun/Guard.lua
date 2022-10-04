--[[
    Made by remorse#9230
    Make sure the owner and guard are in the same crew.
]]

getgenv().Settings = {
    Owner = 3468453287,
    FPS = 60,
    LowGFX = true,
}

getgenv().Commands = {
    EnableGuard = "Guard!",
    DisableGuard = "Unguard!",
    HideGuard = "Hide!",
}

--[[ CODE ]]--

if not game:IsLoaded() then
	game.Loaded:Wait()
end
repeat wait() until game.Workspace.Players:FindFirstChild(game.Players.LocalPlayer.Name)

local player = game:service"Players".LocalPlayer
local IsOwner = false
if player.UserId == Settings['Owner'] then
    IsOwner = true
else
    if Settings['LowGFX'] == true then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/omgfreesources/DaHood/main/LowGFX.lua"))()
    end
    IsOwner = false
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/skidshub/DaHoodPackages/main/AntiCheat.lua"))()

local HideSpot = Instance.new("Part",workspace)
HideSpot.Name = "HideSpot"
HideSpot.Size = Vector3.new(100,1,100)
HideSpot.Transparency = 1
HideSpot.CFrame = CFrame.new(1000,1000,1000)
HideSpot.Anchored = true

local Actions = {
    Guarding = false,
    GuardWho = "",
    Targeting = false,
    Target = "",
    AttackModule = false,
}

local function HidePlayer()
    Actions['Guarding'] = false
    Actions['Targeting'] = false
    Actions['AttackModule'] = false
    Actions['GuardWho'] = ""
    Actions['Target'] = ""
    player.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild("HideSpot").CFrame+Vector3.new(0,1.5,0)
end

local function NoClip(boolean)
    for i,v in pairs(player.Character:GetChildren()) do
        if v:IsA("MeshPart") then
            v.CanCollide = boolean
        end
    end
end

local function FindPlr(arg)
    arg = tostring(arg:lower())
    for i,v in pairs(game:service"Players":GetChildren()) do
        if string.find(v.Name,arg) then
            return v.Name
        end 
    end
    return "None"
end

local HandSize = player.Character:FindFirstChild("LeftHand").Size

local function AttackModule()
    if Actions['AttackModule'] == true then
        player.Character:FindFirstChild("RightHand").Massless = true
        player.Character:FindFirstChild("RightHand").Size = Vector3.new(25,25,25)
        player.Character:FindFirstChild("RightHand").Transparency = 0.99
        while Actions['AttackModule'] == true do
            wait(0.01)
            if player.Backpack:FindFirstChild("Combat") then
                player.Backpack:FindFirstChild("Combat").Parent = player.Character
            end
            player.Character:FindFirstChild("Combat"):Activate()
        end
    end
end

local origin
local r = 12
local rps = math.pi
local orbiter = player.Character.HumanoidRootPart
local angle = 0
game:service'RunService'.Heartbeat:Connect(function(dt)
    if Actions['Guarding'] == true then
        angle = (angle + dt * rps) % (2 * math.pi)
        orbiter.CFrame = origin * CFrame.new(math.cos(angle) * r, -8, math.sin(angle) * r)
    end
end)

game:service"RunService".Stepped:Connect(function()
    if Actions['Guarding'] == true then
        origin = game:service"Players"[Actions['GuardWho']].Character.HumanoidRootPart.CFrame
    end
end)

local function cmds(msg, plr)
    if IsOwner == false then
        local Owner = game:service"Players":GetPlayerByUserId(plr)
        if msg:lower() == Commands['EnableGuard']:lower() then
            NoClip(false)
            origin = Owner.Character.HumanoidRootPart.CFrame
            Actions['GuardWho'] = Owner.Name 
            Actions['Guarding'] = true
            Actions['AttackModule'] = true
            AttackModule()
        elseif msg:lower() == Commands['DisableGuard']:lower() then
            NoClip(true)
            AttackModule()
            HidePlayer()
        elseif msg:lower() == Commands['HideGuard']:lower() then
            HidePlayer()
        end
    end
end

for _, plr in pairs(game:service"Players":GetChildren()) do
    if Settings['Owner'] == plr.UserId then
        plr.Chatted:Connect(function(msg)
            cmds(msg, plr.UserId)
        end)
    end
end

game:service"Players".PlayerAdded:Connect(function(plr)
    if Settings['Owner'] == plr.UserId then
        plr.Chatted:Connect(function(msg)
            cmds(msg, plr.UserId)
        end)
    end
end)