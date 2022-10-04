getgenv().Settings = {
    Enable = "p", -- Start Button
    Speed = 2 -- Highly recommend 2.
}

--[[
Keybinds:
Q - Appear
E - Jumpscare
T - Taunt
C - Walking sound
P - Toggle on
Y - Humming sound
B - Piano goofy song

Commands:
/e ok - TP/reset back the area if your glitched.
Rage! - Makes you hulk [Already enabled if your maxed out on muscles]
]]

-- 7481193560 -- Jumpscare
-- 9045389581 -- Piano music

if not game:IsLoaded() then
    game.Loaded:Wait()
end
game.StarterGui:SetCore("SendNotification",{
    Title = "Loading please wait...";
    Text = "Mimic script for dahood made by remorse#9230";
    Duration = 10;
})
repeat wait() until workspace.Players:FindFirstChild(game.Players.LocalPlayer.Name)
game.StarterGui:SetCore("SendNotification",{
    Title = "Loaded!";
    Text = "Enjoy!";
    Duration = 10;
})
local HasStarted = false
local player = game:service"Players".LocalPlayer
local HideSpot = Instance.new("Part",workspace)
HideSpot.Name = "Hide"
HideSpot.Size = Vector3.new(2000,2,2000)
HideSpot.CFrame = CFrame.new(250,100,200014)
HideSpot.Transparency = 1
HideSpot.Anchored = true

local CFrameSpeed = false
local SaveLocation = nil
local ModelName = player.Name.."_FAKE"
local WalkSpeed, RigIdle, RigWalk = true, nil, nil
local WalkAnimation = Instance.new("Animation", workspace)
WalkAnimation.AnimationId = "rbxassetid://2510198475"
local Idle = Instance.new("Animation", workspace)
Idle.AnimationId = "rbxassetid://507766388"


for i,v in pairs(game:GetDescendants()) do if v:IsA("Seat") then v:Destroy() end end

loadstring(game:HttpGet("https://raw.githubusercontent.com/skidshub/DaHoodPackages/main/AntiCheat.lua"))()

local function FakeModel()
    if not workspace:FindFirstChild(ModelName) then
        local Model = Instance.new("Model", workspace)
        Model.Name = ModelName

        player.Character.Humanoid:UnequipTools()

        for i, v in pairs(Model:GetChildren()) do 
            if v:IsA("BasePart")  or v:IsA("MeshPart") and v.Parent:FindFirstChildOfClass("Humanoid") and v.Name ~= "HumanoidRootPart" then
                local Part = v:Clone()
                Part.Parent = Model
                Part.Name = v.Name
                Part.Material = Enum.Material.ForceField
                Part.CFrame = v.CFrame
                Part.Transparency = 0.5 
                Part.BrickColor = BrickColor.Red()
                Part.CanCollide = false
                Part.Anchored = true
                for i, v  in pairs(Part:GetChildren()) do 
                    if v.ClassName ~= "SpecialMesh" then
                        v:Destroy()
                    end
                end
            end
        end
        local NewCharacter = game:GetObjects("rbxassetid://6547055500")[1]
        NewCharacter.Parent = Model
        NewCharacter.Name = "Nigger"
        for i,v in pairs(NewCharacter:GetChildren()) do
            if v:IsA("MeshPart") or v.Name == "Head" then
                v.BrickColor = BrickColor.new(0,0,0)
            end
        end

        SaveLocation = player.Character.HumanoidRootPart.CFrame
        NewCharacter.HumanoidRootPart.CFrame = SaveLocation

        RigIdle = NewCharacter:WaitForChild("Humanoid"):LoadAnimation(Idle)
        RigIdle.Looped = true
        RigIdle.Priority = Enum.AnimationPriority.Action
        RigWalk = NewCharacter:WaitForChild("Humanoid"):LoadAnimation(WalkAnimation)
        RigWalk.Looped = true
        RigWalk.Priority = Enum.AnimationPriority.Action
        WalkSpeed = true
        RigIdle:Play()
        workspace.Camera.CameraSubject = NewCharacter.Humanoid
    else
        WalkSpeed = false
        workspace.Camera.CameraSubject =  player.Character.Humanoid
        player.Character.HumanoidRootPart.CFrame =  workspace:FindFirstChild(ModelName).Nigger.HumanoidRootPart.CFrame
        workspace:FindFirstChild(ModelName):Destroy()
    end
end

local Chunk_1, Chunk_2 = 0, 0

game:service"RunService".Stepped:Connect(function()
    if WalkSpeed == true then
        workspace:FindFirstChild(ModelName):FindFirstChild("Nigger").HumanoidRootPart.CFrame=workspace:FindFirstChild(ModelName):FindFirstChild("Nigger").HumanoidRootPart.CFrame*CFrame.new(Chunk_2,0,Chunk_1)
    end
end)

local function IdleAnim()
    if RigIdle and RigWalk.IsPlaying and Chunk_2 == 0 and Chunk_1 == 0 then
        wait(.1)
        RigWalk:Stop()
        RigIdle:Play()
    end
end

local function MovingAnim()
    if RigWalk and RigIdle.IsPlaying then
        RigIdle:Stop()
        RigWalk:Play()
    end
end

local ChangedPOV = false
local function ChangePOV()
    local Ghost = workspace:FindFirstChild(ModelName).Nigger.HumanoidRootPart
    if ChangedPOV == false then
        ChangedPOV = true

        player.Character.HumanoidRootPart.CFrame = Ghost.CFrame+Vector3.new(0,15,0)
        Ghost.CFrame = HideSpot.CFrame+Vector3.new(0,5,0)
        workspace.Camera.CameraSubject = player.Character.Humanoid
    else
        ChangedPOV = false
        Ghost.CFrame = player.Character.HumanoidRootPart.CFrame
        player.Character.HumanoidRootPart.CFrame = HideSpot.CFrame+Vector3.new(0,5,0)
        workspace.Camera.CameraSubject = Ghost.Parent.Humanoid
    end
end

local KeyCodes = {
    Appear = "q",
    Scare = "e",
    WalkingSound = "c",
    Taunt = "t",
    Hum = "y",
    Piano = "b",
    FastScare = "g",
    KillAura = "n",
}

local IsHuge = 1
local function GetMousePos()
    local mouse = player:GetMouse()
    if mouse.Target then 
        local part = mouse.Target
        local partSize = part.Size
        local halfSize = partSize.Y/2
        local stringHere = tostring(mouse.Hit.X)..","..tostring(part.Position.Y + halfSize + IsHuge)..","..tostring(mouse.Hit.Z)
        return stringHere
    end
    return nil
end

local CurrentEvents = {
    Appearing = false,
    Scaring = false,
    WalkingNoise = false,
    Taunting = false,
    Humming = false,
    Pianoing = false,
    FastScaring = false,
    KillPeople = false,
}

local godmode = false

game:service"RunService".Heartbeat:Connect(function(dt)
    if player.Character.BodyEffects:FindFirstChild("Attacking") and godmode == true then
        player.Character.BodyEffects:FindFirstChild("Attacking"):Destroy()
    end
    if player.Character:FindFirstChild("Christmas_Sock") then
        player.Character:FindFirstChild("Christmas_Sock"):Destroy()
    end
    if player.Character.UpperTorso:FindFirstChild("ElectricuteParticle") then
        player.Character.UpperTorso:FindFirstChild("ElectricuteParticle"):Destroy()
    end
    if player.Character.UpperTorso:FindFirstChild("FlamethrowerFireParticle") then
        player.Character.UpperTorso:FindFirstChild("FlamethrowerFireParticle"):Destroy()
    end
    if player.Character:FindFirstChild("BOOMBOXHANDLE"):FindFirstChild("Mesh") then
        player.Character:FindFirstChild("BOOMBOXHANDLE"):FindFirstChild("Mesh"):Destroy()
    end
    if workspace:FindFirstChild(ModelName):FindFirstChild("Nigger") then
        if player.Character:FindFirstChild("BOOMBOXHANDLE") and CurrentEvents['Laughing'] == true then
            player.Character:FindFirstChild("BOOMBOXHANDLE").Parent = workspace:FindFirstChild(ModelName):FindFirstChild("Nigger").UpperTorso
        end
    end
    if CurrentEvents['WalkingNoise'] == true then
        local YDOWN = 7
        if IsHuge ~= 1 then
            YDOWN = 19
        end
        local val = YDOWN-dt
        player.Character.HumanoidRootPart.CFrame = workspace[ModelName]['Nigger'].HumanoidRootPart.CFrame*CFrame.new(0,-YDOWN,0)
    end
    if CurrentEvents['Laughing'] == true then
        local YDOWN = 7
        if IsHuge ~= 1 then
            YDOWN = 19
        end
        local val = YDOWN-dt
        player.Character.HumanoidRootPart.CFrame = workspace[ModelName]['Nigger'].HumanoidRootPart.CFrame*CFrame.new(0,-YDOWN,0)
    end
    if CurrentEvents['Humming'] == true then
        local YDOWN = 7
        if IsHuge ~= 1 then
            YDOWN = 19
        end
        local val = YDOWN-dt
        player.Character.HumanoidRootPart.CFrame = workspace[ModelName]['Nigger'].HumanoidRootPart.CFrame*CFrame.new(0,-YDOWN,0)
    end
    if CurrentEvents['Pianoing'] == true then
        local YDOWN = 7
        if IsHuge ~= 1 then
            YDOWN = 19
        end
        local val = YDOWN-dt
        player.Character.HumanoidRootPart.CFrame = workspace[ModelName]['Nigger'].HumanoidRootPart.CFrame*CFrame.new(0,-YDOWN,0)
    end
end)

game:service"RunService".Stepped:Connect(function()
    for i,v in pairs(player.Character.Humanoid:GetPlayingAnimationTracks()) do
        if v.Name == "Animation" then
            v:Stop()
        end
    end
end)

local function PlayAudio(ID)
    local LP = game:service"Players".LocalPlayer
    if LP.Backpack:FindFirstChild("[Boombox]") then
        LP.Backpack:FindFirstChild("[Boombox]").Parent = LP.Character
    end
    game:service"ReplicatedStorage".MainEvent:FireServer("Boombox",ID)
    LP.Character:FindFirstChild("[Boombox]").Parent = LP.Backpack
end

local function StopAudio()
    local LP = game:service"Players".LocalPlayer
    if LP.Backpack:FindFirstChild("[Boombox]") then
        LP.Backpack:FindFirstChild("[Boombox]").Parent = LP.Character
    end
    game:service"ReplicatedStorage".MainEvent:FireServer("BoomboxStop")
    LP.Character:FindFirstChild("[Boombox]").Parent = LP.Backpack
end

local function notify(a,b,c)
    game.StarterGui:SetCore("SendNotification",{
        Title = a;
        Text = b;
        Duration = c;
    })
end

local function noclip()
    for i,v in pairs(player.Character:GetChildren()) do
        if v:IsA("MeshPart") or v:IsA("BasePart") then
            v.CanCollide = false
        end
    end
end

local NoClipping = false
local CurrentAction = ""

game:service"RunService".Stepped:Connect(function()
    if NoClipping == true then
        noclip()
    end
end)

local HandSize = player.Character.LeftHand.Size

local function reach(boolean)
    if boolean == true then
        for i,v in pairs(player.Character:GetChildren()) do
            if string.find(v.Name,"Hand") then
                pcall(function()
                    v.Massless = true
                    v.Transparency = 1
                    v.Size = Vector3.new(20,20,20)
                    V.CanCollide = true
                end)
            end
        end
    elseif boolean == false then
        for i,v in pairs(player.Character:GetChildren()) do
            if string.find(v.Name,"Hand") then
                pcall(function()
                    v.Size = HandSize
                    v.Transparency = 0
                    V.CanCollide = true
                end)
            end
        end
    end
end

local reaching = false

game:service"RunService".Stepped:Connect(function()
    if reaching == true then
        reach(true)
    end
end)

player:GetMouse().KeyDown:Connect(function(key)
    if key:lower() == KeyCodes['Appear']:lower() and HasStarted == true then
        if CurrentAction == "" then
            CurrentAction = "Appear"
        else
            if CurrentAction ~= "Appear" then
                notify("Error!","Another function is already running, please toggle off the function to countinue.",5)
                return
            end 
        end
        if CurrentEvents['Appearing'] == false then
            CurrentEvents['Appearing'] = true
            PlayAudio(1843116030)
            ChangePOV()
        else
            CurrentAction = ""
            ChangePOV()
            StopAudio()
            CurrentEvents['Appearing'] = false
        end
    elseif key:lower() == KeyCodes['Scare']:lower() and HasStarted == true then
        if CurrentAction == "" then
            CurrentAction = "Scare"
        else
            if CurrentAction ~= "Scare" then
                notify("Error!","Another function is already running, please toggle off the function to countinue.",5)
                return
            end 
        end
        if CurrentEvents['Scaring'] == false then
            CurrentEvents['Scaring'] = true
            local Audios = {1592934514,11984351,224299497,1409001904,1319496541}
            ChangePOV()
            PlayAudio(Audios[math.random(#Audios)])
        else
            CurrentAction = ""
            CurrentEvents['Scaring'] = false
            StopAudio()
            ChangePOV()
        end
    elseif key:lower() == KeyCodes['WalkingSound']:lower() and HasStarted == true then
        if CurrentAction == "" then
            CurrentAction = "WalkingSound"
        else
            if CurrentAction ~= "WalkingSound" then
                notify("Error!","Another function is already running, please toggle off the function to countinue.",5)
                return
            end 
        end
        if CurrentEvents['WalkingNoise'] == false then
            NoClipping = true
            CurrentEvents['WalkingNoise'] = true
            PlayAudio(6995424132)
        else
            CurrentAction = ""
            CurrentEvents['WalkingNoise'] = false
            StopAudio()
            for i,v in pairs(player.Character:GetChildren()) do
                if v:IsA("MeshPart") or v:IsA("BasePart") then
                    v.CanCollide = true
                end
            end
            NoClipping = false
            player.Character.HumanoidRootPart.CFrame = HideSpot.CFrame+Vector3.new(0,5,0)
        end
    elseif key:lower() == KeyCodes['Taunt']:lower() and HasStarted == true then
        if CurrentAction == "" then
            CurrentAction = "Taunt"
        else
            if CurrentAction ~= "Taunt" then
                notify("Error!","Another function is already running, please toggle off the function to countinue.",5)
                return
            end 
        end
        local POS = GetMousePos()
        if POS ~= nil then
            if CurrentEvents['Taunting'] == false then
                CurrentEvents['Taunting'] = true
                player.Character.HumanoidRootPart.CFrame = CFrame.new(POS:split(",")[1],tonumber(POS:split(",")[2])+4,POS:split(",")[3])
                PlayAudio(5721957175)
            else
                CurrentAction = ""
                CurrentEvents['Taunting'] = false
                StopAudio()
                player.Character.HumanoidRootPart.CFrame = HideSpot.CFrame+Vector3.new(0,5,0)
            end 
        end
    elseif key:lower() == KeyCodes['Hum']:lower() and HasStarted == true then
        if CurrentAction == "" then
            CurrentAction = "Hum"
        else
            if CurrentAction ~= "Hum" then
                notify("Error!","Another function is already running, please toggle off the function to countinue.",5)
                return
            end 
        end
        if CurrentEvents['Humming'] == false then
            NoClipping = true
            CurrentEvents['Humming'] = true
            PlayAudio(7481193560)
        else
            CurrentAction = ""
            CurrentEvents['Humming'] = false
            StopAudio()
            NoClipping = false
            player.Character.HumanoidRootPart.CFrame = HideSpot.CFrame+Vector3.new(0,5,0)
        end
    elseif key:lower() == KeyCodes['Piano']:lower() and HasStarted == true then
        if CurrentAction == "" then
            CurrentAction = "Piano"
        else
            if CurrentAction ~= "Piano" then
                notify("Error!","Another function is already running, please toggle off the function to countinue.",5)
                return
            end 
        end
        if CurrentEvents['Pianoing'] == false then
            NoClipping = true
            CurrentEvents['Pianoing'] = true
            PlayAudio(9045389581)
        else
            CurrentAction = ""
            CurrentEvents['Pianoing'] = false
            StopAudio()
            NoClipping = false
            player.Character.HumanoidRootPart.CFrame = HideSpot.CFrame+Vector3.new(0,5,0)
        end
    elseif key:lower() == KeyCodes['FastScare']:lower() and HasStarted == true then
        if CurrentAction == "" then
            CurrentAction = "FastScare"
        else
            if CurrentAction ~= "FastScare" then
                notify("Error!","Another function is already running, please toggle off the function to countinue.",5)
                return
            end 
        end
        if CurrentEvents['FastScaring'] == false then
            CurrentEvents['FastScaring'] = true
            player.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild(ModelName):FindFirstChild("Nigger").HumanoidRootPart.CFrame+Vector3.new(0,15,0)
            PlayAudio(7481193560)
            for i=1,145 do
                player.Character.HumanoidRootPart.CFrame=player.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-1)
                game:service"RunService".Stepped:Wait()
            end
            player.Character.HumanoidRootPart.CFrame = HideSpot.CFrame+Vector3.new(0,5,0)
            CurrentEvents['FastScaring'] = false
            CurrentAction = ""
        else
            CurrentAction = ""
            CurrentEvents['FastScaring'] = false
            StopAudio()
            player.Character.HumanoidRootPart.CFrame = HideSpot.CFrame+Vector3.new(0,5,0)
        end
    end
end)

for i,v in pairs(game.Players.LocalPlayer.Character.Animate:GetDescendants()) do
    if v:IsA("Animation") then
        v.AnimationId = "0"
    end
end

player.CharacterAdded:Connect(function()
    wait(.5)
    for i,v in pairs(game.Players.LocalPlayer.Character.Animate:GetDescendants()) do
        if v:IsA("Animation") then
            v.AnimationId = "0"
        end
    end
end)

local KillLOL = Instance.new("Tool",player.Backpack)
KillLOL.Name = "Scare!"
KillLOL.RequiresHandle = false
KillLOL.CanBeDropped = false
KillLOL.Equipped:Connect(function()
    if CurrentAction == "" then
        CurrentAction = "KillAura"
    else
        if CurrentAction ~= "KillAura" then
            notify("Error!","Another function is already running, please toggle off the function to countinue.",5)
            return
        end 
    end
    if CurrentEvents['KillPeople'] == false then
        local s,e = pcall(function()
            CurrentEvents['KillPeople'] = true
            reaching = true
            if player.Backpack:FindFirstChild("Combat") then
                player.Backpack:FindFirstChild("Combat").Parent = player.Character
            end
            player.Character:FindFirstChild("Combat"):Activate()
            wait(1)
            ChangePOV()
            PlayAudio(1592934514)
            wait(1)
            CurrentAction = ""
            player.Character:FindFirstChild("Combat").Parent = player.Backpack
            player.Character:FindFirstChild("Scare!").Parent = player.Backpack
            ChangePOV()
            CurrentEvents['KillPeople'] = false
            reach(false)
            reaching = false
        end)
        if e then print(e) end
    else
        CurrentEvents['KillPeople'] = false
        reach(false)
        reaching = false
    end
end)

player.CharacterAdded:Connect(function()
    wait(.5)
    local KillLOL = Instance.new("Tool",player.Backpack)
    KillLOL.Name = "Scare!"
    KillLOL.RequiresHandle = false
    KillLOL.CanBeDropped = false
    KillLOL.Equipped:Connect(function()
        if CurrentAction == "" then
            CurrentAction = "KillAura"
        else
            if CurrentAction ~= "KillAura" then
                notify("Error!","Another function is already running, please toggle off the function to countinue.",5)
                return
            end 
        end
        if CurrentEvents['KillPeople'] == false then
            local s,e = pcall(function()
                CurrentEvents['KillPeople'] = true
                reaching = true
                if player.Backpack:FindFirstChild("Combat") then
                    player.Backpack:FindFirstChild("Combat").Parent = player.Character
                end
                player.Character:FindFirstChild("Combat"):Activate()
                wait(1)
                ChangePOV()
                PlayAudio(1592934514)
                wait(1)
                CurrentAction = ""
                player.Character:FindFirstChild("Combat").Parent = player.Backpack
                player.Character:FindFirstChild("Scare!").Parent = player.Backpack
                ChangePOV()
                CurrentEvents['KillPeople'] = false
                reach(false)
                reaching = false
            end)
            if e then print(e) end
        else
            CurrentEvents['KillPeople'] = false
            reach(false)
            reaching = false
        end
    end)
end)

-- Movement

player:GetMouse().KeyDown:Connect(function(key)
    if key:lower() == Settings['Enable']:lower() and HasStarted == false then
        FakeModel()
        HasStarted = true
        repeat wait() until workspace:FindFirstChild(ModelName):FindFirstChild("Nigger"):FindFirstChild("HumanoidRootPart")
        player.Character.HumanoidRootPart.CFrame = HideSpot.CFrame+Vector3.new(0,5,0)
    elseif key:lower() == "w" then
        Chunk_1 = -Settings['Speed']
        MovingAnim()
    elseif key:lower() == "a" then
        Chunk_2 = -Settings['Speed']
        MovingAnim()
    elseif key:lower() == "s" then
        Chunk_1 = Settings['Speed']
        MovingAnim()
    elseif key:lower() == "d" then
        Chunk_2 = Settings['Speed']
        MovingAnim()
    end
end)

player:GetMouse().KeyUp:Connect(function(key)
    if key:lower() == "w" then
        Chunk_1 = 0
        IdleAnim()
    elseif key:lower() == "a" then
        Chunk_2 = 0
        IdleAnim()
    elseif key:lower() == "s" then
        Chunk_1 = 0
        IdleAnim()
    elseif key:lower() == "d" then
        Chunk_2 = 0
        IdleAnim()
    end
end)

local function Hulk()
    IsHuge = 8
    local H = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid')
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
    
    DeleteOriginal()
    H:FindFirstChild("BodyTypeScale"):Destroy()
    wait(Delay)
    DeleteOriginal()
    H:FindFirstChild("BodyWidthScale"):Destroy()
    wait(Delay)
    DeleteOriginal()
    H:FindFirstChild("BodyDepthScale"):Destroy()
    wait(Delay)
    DeleteOriginal()
    H:FindFirstChild("HeadScale"):Destroy()

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

if player.DataFolder.Information:FindFirstChild("MuscleInformation").Value == "15000" then
    Hulk()
else
    notify("LOL!","I recommend maxing out muscles on this account.",10)
end

local FollowTarget = ""
local Following = false
local function FindUser(arg)
    for i,v in pairs(game:service"Players":GetChildren()) do
        if v.Name ~= player.Name then
            if string.sub(string.lower(v.Name),1,string.len(arg)) == string.lower(arg) then
                return v.Name
            end
        end
    end
    for i,v in pairs(game:service"Players":GetChildren()) do
        if v.Name ~= player.Name then
            if string.sub(string.lower(v.DisplayName),1,string.len(arg)) == string.lower(arg) then
                return v.Name
            end
        end
    end
    return nil
end

game:service"RunService".Heartbeat:Connect(function(dt)
    if Following == true then
        if game:service"Players"[FollowTarget].Character then
            local yval = 9-dt
            player.Character.HumanoidRootPart.CFrame = game:service"Players"[FollowTarget].Character.HumanoidRootPart.CFrame*CFrame.new(-5,yval,4)
        end
    end
end)

player.Chatted:Connect(function(msg)
    if msg:lower() == "/e huge" or msg:lower() == "/e h" or msg:lower() == "rage!" then
        Hulk()
    elseif msg:lower() == "/e ok" then
        player.Character.HumanoidRootPart.CFrame = HideSpot.CFrame+Vector3.new(0,5,0)
        workspace:FindFirstChild(ModelName):FindFirstChild("Nigger").HumanoidRootPart.CFrame = CFrame.new(-322,22,-449)
    end
    msg = msg:lower():split(" ")
    if msg[1] and msg[2] then
        if msg[2]:lower() == "f" then
            if CurrentAction == "" then
                CurrentAction = "FollowGoofy"
            else
                if CurrentAction ~= "FollowGoofy" then
                    notify("Error!","Another function is already running, please toggle off the function to countinue.",5)
                    return
                end 
            end
            local target = FindUser(msg[3])
            if target then
                FollowTarget = target
                Following = true
            end
        elseif msg[2]:lower() == "unf" then
            Following = false
            FollowTarget = ""
            CurrentAction = ""
            player.Character.HumanoidRootPart.CFrame = HideSpot.CFrame+Vector3.new(0,5,0)
        end
    end
end)