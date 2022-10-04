getgenv().Settings = {
    Owner = 3468453287, -- user ID
    MimicID = 3468454569, -- ID for the alt
    FPS = 10, -- fps for the alt
}

getgenv().Commands = {
    --[[ You can change any of these commands ]]--
    AppearCommand = "a", -- Makes the mimic/alt appear.
    ScareCommand = "s", -- Makes the mimic/alt scare players.
    HideCommand = "h", -- Makes the mimic/alt hide from people.
    ThroughCommand = "t", -- Makes the mimic/alt walk throguh people and scares them.
    TauntCommand = "tu", -- Makes the mimic/alt taunt.
    SetupCommand = "hu", -- Makes the mimic/alt huge [titan max muscles required] also removes the legs [FE].
    TrollCommand = "tr", -- Makes the mimic/alt sping and play taunting/scary music.
    ResetCommand = "r", -- Resets the mimic/alt.
    StopCommand = "st", -- Stops all music.
}

if not game:IsLoaded() then
    game.Loaded:Wait()
end
repeat wait() until workspace.Players:FindFirstChild(game.Players.LocalPlayer.Name)

local player = game:service"Players".LocalPlayer
player.Idled:Connect(function()
    game:service"VirtualUser":Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:service"VirtualUser":Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local IsAStand = false
if player.UserId == Settings['Owner'] then
    IsAStand = true
end
if player.UserId == Settings['MimicID'] then
    --loadstring(game:HttpGet("https://raw.githubusercontent.com/omgfreesources/DaHood/main/LowGFX.lua"))()
    setfpscap(Settings['FPS'])
end

local function StopSound()
    if game:service"Players".LocalPlayer.Backpack:FindFirstChild("[Boombox]") then
        game:service"Players".LocalPlayer.Backpack:FindFirstChild("[Boombox]").Parent = game:service"Players".LocalPlayer.Character
    end
    game.ReplicatedStorage.MainEvent:FireServer("BoomboxStop")
    if game:service"Players".LocalPlayer.Character:FindFirstChild("[Boombox]") then
        game:service"Players".LocalPlayer.Character:FindFirstChild("[Boombox]").Parent = game:service"Players".LocalPlayer.Backpack
    end
end
local function PlaySound(SoundID)
    if game:service"Players".LocalPlayer.Backpack:FindFirstChild("[Boombox]") then
        game:service"Players".LocalPlayer.Backpack:FindFirstChild("[Boombox]").Parent = game:service"Players".LocalPlayer.Character
    end
    game.ReplicatedStorage.MainEvent:FireServer("Boombox",SoundID)
    if game:service"Players".LocalPlayer.Character:FindFirstChild("[Boombox]") then
        game:service"Players".LocalPlayer.Character:FindFirstChild("[Boombox]").Parent = game:service"Players".LocalPlayer.Backpack
    end
end

local ActionsRightNow = {
    Taunting = false,
}

local origin
local r = 20
local rps = math.pi
local orbiter = player.Character.HumanoidRootPart
local angle = 0
game:GetService'RunService'.Heartbeat:Connect(function(dt)
    if ActionsRightNow['Taunting'] == true then
        angle = (angle + dt * rps) % (2 * math.pi)
        orbiter.CFrame = origin * CFrame.new(math.cos(angle) * r, -5, math.sin(angle) * r)
    end
end)

game:service"RunService".Stepped:Connect(function()
    if game:service"Players".LocalPlayer.Character:FindFirstChild("BOOMBOXHANDLE") then
        game:service"Players".LocalPlayer.Character:FindFirstChild("BOOMBOXHANDLE"):Destroy()
    end
    if game:service"Players".LocalPlayer.Character.BodyEffects:FindFirstChild("Attacking") then
        game:service"Players".LocalPlayer.Character.BodyEffects:FindFirstChild("Attacking"):Destroy()
    end
    if ActionsRightNow['Taunting'] == true then
        origin = game.Players:GetPlayerByUserId(Settings['Owner']).Character.HumanoidRootPart.CFrame
    end
    if game.Players.LocalPlayer.Character:FindFirstChild("Christmas_Sock") then
        game.Players.LocalPlayer.Character:FindFirstChild("Christmas_Sock"):Destroy()
    end
end)

local Part = Instance.new("Part",workspace)
Part.Name = "IdkThisPart"
Part.Size = Vector3.new(100,1,100)
Part.Transparency = 1
Part.CFrame = CFrame.new(2000,1000,2000)
Part.Anchored = true

local function NoClip(boolean)
    if boolean == true then
        for i,v in pairs(player.Character:GetChildren()) do
            if v:IsA("MeshPart") then
                v.CanCollide = false
            end
        end
    elseif boolean == false then
        for i,v in pairs(player.Character:GetChildren()) do
            if v:IsA("MeshPart") then
                v.CanCollide = true
            end
        end
    end
end

local function cmds(msg, plr)
    if IsAStand == false then
        local Stand = game:service"Players":GetPlayerByUserId(plr)
        if Commands["AppearCommand"]:lower() == msg:lower() then
            player.Character.HumanoidRootPart.CFrame = Stand.Character.HumanoidRootPart.CFrame*CFrame.new(0,3,0)
            wait(.2)
            PlaySound(1843029144)
            wait(3.2)
            StopSound()
        end
        if Commands["ScareCommand"]:lower() == msg:lower() then
            local range = 15
            local Pos = player.Character.HumanoidRootPart.CFrame
            local FloatPart = Instance.new("Part",workspace)
            FloatPart.Size = Vector3.new(5,1,5)
            FloatPart.Transparency = 1
            FloatPart.CFrame = Stand.Character.HumanoidRootPart.CFrame*CFrame.new(0,3,-range)
            FloatPart.Anchored = true
            player.Character.HumanoidRootPart.CFrame = FloatPart.CFrame+Vector3.new(0,1,0)
            PlaySound(6662575481)
            wait(.3)
            StopSound()
            wait(.9)
            player.Character.HumanoidRootPart.CFrame = Pos
            FloatPart:Destroy()
        end
        if Commands["HideCommand"]:lower() == msg:lower() then
            player.Character.HumanoidRootPart.CFrame = game.Workspace:FindFirstChild("IdkThisPart").CFrame+Vector3.new(0,12,0)
            StopSound()
        end
        if Commands["ThroughCommand"]:lower() == msg:lower() then
            StopSound()
            player.Character.HumanoidRootPart.CFrame = Stand.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-12)
            PlaySound(11984351)
            wait()
            for i=1,22 do
                player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-1)
                wait(0.02)
            end
            player.Character.HumanoidRootPart.CFrame = game.Workspace:FindFirstChild("IdkThisPart").CFrame+Vector3.new(0,12,0)
            StopSound()
        end
        if Commands["TauntCommand"]:lower() == msg:lower() then
            player.Character.HumanoidRootPart.CFrame = Stand.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-12)
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(";)", "All")
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v:IsA("Sound") then 
                    v:Play()
                end
            end
            wait(10)
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v:IsA("Sound") then 
                    v:Stop()
                end
            end
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("ye. ;)", "All");
            player.Character.HumanoidRootPart.CFrame = game.Workspace:FindFirstChild("IdkThisPart").CFrame+Vector3.new(0,12,0)
            StopSound()
        end
        if Commands["SetupCommand"]:lower() == msg:lower() then
            local H = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
            local function DeleteOriginal()
                for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v.Name == 'OriginalSize' then
                        v:Destroy()
                    end
                    if v.Name == 'OriginalPosition' then 
                        v:Destroy()
                    end
                end
            end
            local Delay = 0.8
            wait(Delay)
            DeleteOriginal()
            H:FindFirstChild("BodyDepthScale"):Destroy()
            wait(Delay)
            DeleteOriginal()
            H:FindFirstChild("BodyWidthScale"):Destroy()
            wait(Delay)
            DeleteOriginal()
            H:FindFirstChild("HeadScale"):Destroy()
            wait(Delay)
            DeleteOriginal()
            H:FindFirstChild("BodyTypeScale"):Destroy()
            local BodyParts = {
                "LeftLowerLeg","LeftUpperLeg","LeftFoot",
                "RightLowerLeg","RightUpperLeg","RightFoot"
            }
            for i,v in pairs(BodyParts) do
                if player.Character:FindFirstChild(v) then
                    player.Character:FindFirstChild(v):Destroy()
                end
            end
        end
        if Commands["ResetCommand"]:lower() == msg:lower() then
            for i,v in pairs(player.Character:GetChildren()) do
                if v:IsA("MeshPart") then
                    v:Destroy()
                end
            end
        end
        if Commands["TrollCommand"]:lower() == msg:lower() then
            NoClip(true)
            origin = game.Players:GetPlayerByUserId(plr).Character.HumanoidRootPart.CFrame
            ActionsRightNow['Taunting'] = true
            PlaySound(11984351)
        end
        if Commands["StopCommand"]:lower() == msg:lower() then
            NoClip(false)
            origin = game.Players:GetPlayerByUserId(plr).Character.HumanoidRootPart.CFrame
            ActionsRightNow['Taunting'] = false
            StopSound()
        end
    end
end

for _, plr in pairs(game:service"Players":GetChildren()) do
    if plr.UserId == Settings['Owner'] then
        plr.Chatted:Connect(function(msg)
            cmds(msg,plr.UserId)
        end)
    end
end

game:service"Players".PlayerAdded:Connect(function(plr)
    if plr.UserId == Settings['Owner'] then
        plr.Chatted:Connect(function(msg)
            cmds(msg,plr.UserId)
        end)
    end
end)