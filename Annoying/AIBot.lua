-- // Config
local Prefix = "/"
-- // Vars
local player = game:service"Players".LocalPlayer
local ts = game:service"TweenService"
local Playing, Stopped, Shooting = false, false, false
-- // Dependencies
-- Anti Cheat --
loadstring(game:HttpGet("https://raw.githubusercontent.com/omgfreesources/DaHood/main/AntiCheatBypass.lua"))()
-- Anti Afk --
loadstring(game:HttpGet("https://raw.githubusercontent.com/omgfreesources/DaHood/main/AntiAfk.lua"))()

-- // Retarded services

local function BuyItem(mode)
    local WeaponsLib = {
        db = {
            1400,
            "[Double-Barrel SG]",
            "[Double-Barrel SG] - $1400",
            75,
            "12 [Revolver Ammo] - $75",
        },
        rev = {
            1300,
            "[Revolver]",
            "[Revolver] - $1300",
            60,
            "18 [Double-Barrel SG Ammo] - $60",
        },
    }
    local FoodLib = {
        7,
        "[Chicken]",
        "[Chicken] - $7",
    }
    local origin = player.Character.HumanoidRootPart.CFrame
    if mode:lower() == "food" then
        local food = player.Character:FindFirstChild(FoodLib[2]) or player.Backpack:FindFirstChild(FoodLib[2])
        if not food then
            if player.DataFolder.Currency.Value >= FoodLib[1] then
                repeat
                    player.Character.HumanoidRootPart.CFrame = workspace.Ignored.Shop:FindFirstChild(FoodLib[3]).Head.CFrame*CFrame.new(0,1.5,0)
                    fireclickdetector(workspace.Ignored.Shop:FindFirstChild(FoodLib[3]):FindFirstChild("ClickDetector"))
                    wait(0.001)
                until player.Character:FindFirstChild(FoodLib[2]) or player.Backpack:FindFirstChild(FoodLib[2])
                player.Character.HumanoidRootPart.CFrame = origin
            end
        end
    elseif mode:lower() == "weapons" then
        for i,v in pairs(WeaponsLib) do
            local weapon = player.Character:FindFirstChild(WeaponsLib[i][2]) or player.Backpack:FindFirstChild(WeaponsLib[i][2])
            if not weapon then
                if player.DataFolder.Currency.Value >= (WeaponsLib[i][1]) then
                    repeat
                        player.Character.HumanoidRootPart.CFrame = workspace.Ignored.Shop:FindFirstChild(WeaponsLib[i][3]).Head.CFrame*CFrame.new(0,1.5,0)
                        fireclickdetector(workspace.Ignored.Shop:FindFirstChild(WeaponsLib[i][3]):FindFirstChild("ClickDetector"))
                        wait(0.001)
                    until player.Character:FindFirstChild(WeaponsLib[i][2]) or player.Backpack:FindFirstChild(WeaponsLib[i][2])
                    player.Character.HumanoidRootPart.CFrame = origin
                end
            end
        end
    elseif mode:lower() == "ammo" then
        for i,v in pairs(WeaponsLib) do
            local weapon = player.Character:FindFirstChild(WeaponsLib[i][2]) or player.Backpack:FindFirstChild(WeaponsLib[i][2])
            if weapon then
                if player.DataFolder.Currency.Value >= (WeaponsLib[i][4]) then
                    local orignCash = player.DataFolder.Currency.Value
                    repeat
                        player.Character.HumanoidRootPart.CFrame = workspace.Ignored.Shop:FindFirstChild(WeaponsLib[i][5]).Head.CFrame*CFrame.new(0,1.5,0)
                        fireclickdetector(workspace.Ignored.Shop:FindFirstChild(WeaponsLib[i][5]):FindFirstChild("ClickDetector"))
                        wait(0.001)
                    until orignCash > player.DataFolder.Currency.Value
                    player.Character.HumanoidRootPart.CFrame = origin
                end
            end
        end
    end
end

local function say(msg)
    game:service"ReplicatedStorage".DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
end

local function EquipGun()
    local DB = player.Character:FindFirstChild("[Double-Barrel SG]") or player.Backpack:FindFirstChild("[Double-Barrel SG]")
    local Rev player.Character:FindFirstChild("[Revolver]") or player.Backpack:FindFirstChild("[Revolver]")
    if DB then
        if player.Backpack:FindFirstChild("[Double-Barrel SG]") then
            player.Backpack:FindFirstChild("[Double-Barrel SG]").Parent = player.Character
        end
        return true
    elseif Rev then
        if player.Backpack:FindFirstChild("[Revolver]") then
            player.Backpack:FindFirstChild("[Revolver]").Parent = player.Character
        end
        return true
    else
        say("No gun. run "..Prefix.."buy")
        return false
    end
end

local function UneqipAll()
    for i,v in pairs(player.Character:GetChildren()) do
        if v:IsA("Tool") then
            v.Parent = player.Character
        end
    end
end

-- // aimlock

local mt = getrawmetatable(game)
local pos = Vector3.new(0,0,0)
local TargetLocked = nil
local old = mt.__namecall
setreadonly(mt,false)
mt.__namecall = newcclosure(function(self, ...)
    local args = {...}
    if getnamecallmethod() == 'FireServer' and self.Name == 'MainEvent' then
        if tostring(args[1]) == 'UpdateMousePos' then
            if TargetLocked ~= nil then
                args[2] = pos
            end
        end
    end
    return old(self, unpack(args))
end)

-- // Idk jump

game:service"RunService".Stepped:Connect(function()
    if Shooting == true then
        local x,z,increase = 0,0,0.60
        TargetLocked
    end
end)

coroutine.resume(coroutine.create(function()
    while wait(0.5) do
        if Stopped == false then
            local num_1, num_2 = math.random(1,3), math.random(1,3)
            if num_1 == num_2 then
                Shooting = true
                pcall(function() player.Character.Humanoid.Jump = true end)
            end
        end
    end
end))

-- // command post [ all manual commands ]

local PLAYERS = {3609699365} -- whitelisted users that can interact with the AI.
local function cmds(msg, plr)
    if msg and plr then
        if msg:lower() == Prefix.."position" then
            if player.Character then
                player.Character.HumanoidRootPart.CFrame = game:service"Players":GetPlayerByUserId(plr).Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-10)
                player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame*CFrame.Angles(0, math.rad(180), 0)
            end
        elseif msg:lower() == Prefix.."start" then
            TargetLocked = game:service"Players":GetPlayerByUserId(plr).Name
            Stopped = false
            Playing = false
            local data = EquipGun()
            if data == false then
                return
            else
                print("k")
            end
            local cnt = 0
            say("Start when I jump.")
            for i,v in pairs(workspace:GetChildren()) do
                if v:IsA("Part") or v.Name:lower():find("handler") then
                    v:Destroy()
                end
            end
            for i=1,700 do
                local Nums = {"-26","26","-15","15"}
                local rand = Nums[math.random(#Nums)]
                local rand_2 = math.random(-4,0)
                local Part = Instance.new("Part",workspace)
                Part.Name = "HANDLER_"..tostring(i)
                Part.Size = Vector3.new(1,1,1)
                Part.CanCollide = false
                Part.Color = Color3.fromRGB(255,0,0)
                Part.Transparency = 0.85
                Part.CFrame = player.Character.HumanoidRootPart.CFrame*CFrame.new(tonumber(rand),0,tonumber(rand_2))
                Part.Anchored = true
            end
            for i=1,700 do
                if Stopped == true then break end
                repeat wait() until Playing == false
                Playing = true
                local Target = workspace:FindFirstChild("HANDLER_"..tostring(i))
                if Target then
                    player.Character.Humanoid:MoveTo(Target.Position)
                    player.Character.Humanoid.MoveToFinished:Connect(function()
                        Playing = false
                        pcall(function() v:Destroy() end)
                    end)
                end
            end
        elseif msg:lower() == Prefix.."stop" then
            for i,v in pairs(workspace:GetChildren()) do
                if v:IsA("Part") or v.Name == "HANDLER" then
                    v:Destroy()
                end
            end
            Stopped = true
            Playing = false
            say("BRUHHH")
        end
        local oldmsg = msg
        msg = msg:lower():split(" ")
        if msg[1] then
        end
    end
end

game:service"ReplicatedStorage".DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(data) 
    local user = data.FromSpeaker
    local msg = data.Message
    if table.find(PLAYERS,game:service"Players"[user].UserId) then
        cmds(msg, game:service"Players"[user].UserId)
    end
end)