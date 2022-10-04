-- removed the whitelist part.

getgenv().Settings = {
    Operator = {},
    Prefix = "?",
    AdMsg = "encrypt goated",
    AdDelay = 5,
    FPS_CAP = 10,
    BlackScreen = true,
    WebhookURL = "",
}
getgenv().Alts = {}

if not game:IsLoaded() then
	game.Loaded:Wait()
end
if Settings['advertisement'] then
    game.Players.LocalPlayer:Kick("\nNew Script has been added!\n\nHey, "..game.Players.LocalPlayer.Name.." there is a new script in encrypt for this alt control. Please join discord.gg/encrypt to get the new script, all whitelists are the same.")
end
game.Players.LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),game.Workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),game.Workspace.CurrentCamera.CFrame)
end)
local function formatnum(a)
    a = tostring(a)
    return a:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end
local player = game.Players.LocalPlayer
if Settings['BlackScreen'] == true and not table.find(Settings['Operator'],player.UserId) then
    game:GetService("RunService"):Set3dRenderingEnabled(false)
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local TextLabel_2 = Instance.new("TextLabel")
    local TextLabel_3 = Instance.new("TextLabel")
    local TextLabel_4 = Instance.new("TextLabel")
    ScreenGui.Parent = game.CoreGui
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
    TextLabel.Text = "Encrypt Alt Control Revamped"
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

local function notify(a,b,c)
    game.StarterGui:SetCore("SendNotification",{
        Title = a;
        Text = b;
        Duration = c;
    })
end

local IsAOperator = false

if table.find(Settings['Operator'],player.UserId) then
    IsAOperator = true
    notify("Operator!","Executed!",10)
end

if not IsAOperator then
    setfpscap(Settings['FPS_CAP'])
end

local IngameSettings = {
    advertisement = false,
    Dropping = false,
    loop_destroy = false,
    NoClip = false,
    UCDropping = false,
    GravityToggleMode = false,
    MoneyGunActive = false,
    CustomDropDropping = false,
}

game:GetService("RunService").Stepped:Connect(function()
    if IngameSettings['Dropping'] == true then
        game.ReplicatedStorage.MainEvent:FireServer("DropMoney",10000)
    end
    if IngameSettings['loop_destroy'] == true then
        for i,v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
            if v:IsA("Part") then
                v:Destroy()
            end
        end
    end
end)

local function CheckPlr(_id_)
    for i,v in pairs(game.Players:GetChildren()) do
        if v.UserId == _id_ then
            return true
        end
    end
    return false
end

local function RecreateAlts()
    local t = {}
    for i,v in pairs(Alts) do
        if CheckPlr(v) == true then
            table.insert(t,tonumber(v))
        end
    end
    return t
end

local function saymsg(msg)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, 'All')
end

function IndexName(plr_)
    for i,v in pairs(game.Players:GetChildren()) do
        if (string.sub(string.lower(v.Name),1,string.len(plr_))) == string.lower(plr_) then
            return v.Name
        end
    end
    return nil
end

local CustomSetups = {
    SurroundSetup = {"4.5,0,0","0,0,4.5","-4.5,0,0","0,0,-4.5","3,0,3","-3,0,3","-3,0,-3","3,0,-3","6.5,0,0","5,0,3","3.5,0,5","0,0,6.5","-5,0,3","-3.5,0,5","-6.5,0,0","-5,0,-3","-3.5,0,-5","0,0,-6.5","5,0,-3","3.5,0,-5","4.5,7,0","0,7,4.5","-4.5,7,0","0,7,-4.5","3,7,3","-3,7,3","-3,7,-3","3,7,-3","6.5,7,0","5,7,3","3.5,7,5","0,7,6.5","-5,7,3","-3.5,7,5","-6.5,7,0","-5,7,-3","-3.5,7,-5","0,7,-6.5","5,7,-3","3.5,7,-5"},
    ArmyLineSetup = {"20,0,-32.5","20,0,-24.5","20,0,-16.5","20,0,-8.5","20,0,0.5","20,0,8.5","20,0,16.5","20,0,24.5","20,0,32.5","25,0,-32.5","25,0,-24.5","25,0,-16.5","25,0,-8.5","25,0,0.5","25,0,8.5","25,0,16.5","25,0,24.5","25,0,32.5","30,0,-32.5","30,0,-24.5","30,0,-16.5","30,0,-8.5","30,0,0.5","30,0,8.5","30,0,16.5","30,0,24.5","30,0,32.5","35,0,-32.5","35,0,-24.5","35,0,-16.5","35,0,-8.5","35,0,0.5","35,0,8.5","35,0,16.5","35,0,24.5","35,0,32.5","15,0,8.5","15,0,0.5","15,0,-8.5"},
    HeartSetup = {"15,0,0","19,0,2.3","23,0,4.6","27,0,6.9","29,0,11","30.5,0,16.6","29.5,0,22.1","27,0,27.6","22,0,33.1","17,0,35","12,0,33.4","7,0,30","2,0,25.6","-3,0,21.2","-8,0,16.8","-13,0,12.4","-18,0,7","-23,0,3","-29,0,0","19,0,-2.3","23,0,-4.6","27,0,-6.9","29,0,-11","30.5,0,-16.6","29.5,0,-22.1","27,0,-27.6","22,0,-33.1","17,0,-35","12,0,-33.4","7,0,-30","2,0,-25.6","-3,0,-21.2","-8,0,-16.8","-13,0,-12.4","-18,0,-7","-23,0,-3","45,0,0","45,0,16.6","45,0,-16.6"},
    PizzaSetup = {"-14,0,0","-14,0,-6","-14,0,-12","-14,0,-18","-14,0,-24","-14,0,6","-14,0,12","-14,0,18","-14,0,24","-9,0,-22","-4,0,-20","1,0,-18","6,0,-16","11,0,-14","16,0,-12","21,0,-10","26,0,-8","31,0,-6","36,0,-4","41,0,-2","46,0,0","-9,0,22","-4,0,20","1,0,18","6,0,16","11,0,14","16,0,12","21,0,10","26,0,8","31,0,6","36,0,4","41,0,2","-7,0,14","-7,0,-14","16,0,-4","16,0,4","4,0,9","4,0,-9","-7,0,0"},
    SquareSetup = {"20,0,0","-20,0,0","0,0,20","0,0,-20","5,0,-20","10,0,-20","15,0,-20","20,0,-20","-5,0,-20","-10,0,-20","-15,0,-20","-20,0,-20","-5,0,20","-10,0,20","-15,0,20","-20,0,20","5,0,20","10,0,20","15,0,20","20,0,20","-20,0,5","-20,0,10","-20,0,15","-20,0,-5","-20,0,-10","-20,0,-15","20,0,5","20,0,10","20,0,15","20,0,-5","20,0,-10","20,0,-15","15,0,-15","-15,0,-15","15,0,15","-15,0,15","0,0,10","0,0,-10"},
    HorizontalLine = {"8,0,0","-8,0,0","16,0,0","-16,0,0","24,0,0","-24,0,0","32,0,0","-32,0,0","40,0,0","-40,0,0","48,0,0","-48,0,0","56,0,0","-56,0,0","64,0,0","-64,0,0","72,0,0","-72,0,0","80,0,0","-80,0,0","88,0,0","-88,0,0","96,0,0","-96,0,0","104,0,0","-104,0,0","112,0,0","-112,0,0","120,0,0","-120,0,0","128,0,0","-128,0,0","136,0,0","-136,0,0","144,0,0","-144,0,0","152,0,0","-152,0,0","160,0,0","-160,0,0"},
    VeriticalLine = {"0,0,8","0,0,-8","0,0,16","0,0,-16","0,0,24","0,0,-24","0,0,32","0,0,-32","0,0,40","0,0,-40","0,0,48","0,0,-48","0,0,56","0,0,-56","0,0,64","0,0,-64","0,0,72","0,0,-72","0,0,80","0,0,-80","0,0,88","0,0,-88","0,0,96","0,0,-96","0,0,104","0,0,-104","0,0,112","0,0,-112","0,0,120","0,0,-120","0,0,128","0,0,-128","0,0,136","0,0,-136","0,0,144","0,0,-144","0,0,152","0,0,-152","0,0,160","0,0,-160"},
    DiamondSetup = {"0,0,15","5,0,15","-5,0,15","10,0,15","-10,0,15","15,0,15","-15,0,15","20,0,15","-20,0,15","-25,0,12","25,0,12","-30,0,8","30,0,8","-35,0,4","35,0,4","-32,0,0","32,0,0","-29,0,-4","29,0,-4","-26,0,-8","26,0,-8","-23,0,-12","23,0,-12","-20,0,-16","20,0,-16","-17,0,-20","17,0,-20","-14,0,-24","14,0,-24","-11,0,-28","11,0,-28","-8,0,-32","8,0,-32","-5,0,-36","5,0,-36","-2,0,-40","2,0,-40","15,0,0","-15,0,0"},
}

local locations = {
    Admin = {"-826,-40,-617","-826,-40,-605","-826,-40,-593","-826,-40,-581","-826,-40,-569","-826,-40,-557","-845,-40,-617","-845,-40,-605","-845,-40,-593","-845,-40,-581","-845,-40,-569","-845,-40,-557","-864,-40,-617","-864,-40,-605","-864,-40,-593","-864,-40,-581","-864,-40,-569","-864,-40,-557","-879,-40,-617","-879,-40,-605","-879,-40,-593","-879,-40,-581","-879,-40,-569","-879,-40,-557","-898,-40,-617","-898,-40,-605","-898,-40,-593","-898,-40,-581","-898,-40,-569","-898,-40,-557","-918,-40,-617","-918,-40,-605","-918,-40,-593","-918,-40,-581","-918,-40,-569","-918,-40,-557","-816,-33,-643","-927,-33,-642","-873,-33,-521"},
    Bank = {"-388,21,-336","-388,21,-327","-388,21,-318","-388,21,-309","-388,21,-300","-388,21,-291","-388,21,-282","-388,21,-273","-388,21,-264","-388,21,-255","-388,21,-246","-388,21,-237","-388,21,-228","-375,21,-336","-375,21,-327","-375,21,-318","-375,21,-309","-375,21,-300","-375,21,-291","-375,21,-282","-375,21,-273","-375,21,-264","-375,21,-255","-375,21,-246","-375,21,-237","-375,21,-228","-360,21,-336","-360,21,-327","-360,21,-318","-360,21,-309","-360,21,-300","-360,21,-291","-360,21,-282","-360,21,-273","-360,21,-264","-360,21,-255","-360,21,-246","-360,21,-237","-360,21,-228"},
    Jailyard = {"-343,21,-70","-333,21,-70","-323,21,-70","-343,21,-65","-333,21,-65","-323,21,-65","-343,21,-60","-333,21,-60","-323,21,-60","-343,21,-55","-333,21,-55","-323,21,-55","-343,21,-50","-333,21,-50","-323,21,-50","-343,21,-45","-333,21,-45","-323,21,-45","-343,21,-40","-333,21,-40","-323,21,-40","-343,21,-35","-333,21,-35","-323,21,-35","-343,21,-30","-333,21,-30","-323,21,-30","-343,21,-25","-333,21,-25","-323,21,-25","-343,21,-20","-333,21,-20","-323,21,-20","-343,21,-15","-333,21,-15","-323,21,-15"},
    Jailcell = {"-309,21,-69","-305,21,-69","-301,21,-69","-297,21,-69","-293,21,-69","-289,21,-69","-285,21,-69","-281,21,-69","-309,21,-67","-305,21,-67","-301,21,-67","-297,21,-67","-293,21,-67","-289,21,-67","-285,21,-67","-281,21,-67","-309,21,-65","-305,21,-65","-301,21,-65","-297,21,-65","-293,21,-65","-289,21,-65","-285,21,-65","-281,21,-65"},
    Club = {"-282,-7,-348","-274,-7,-348","-266,-7,-348","-258,-7,-348","-250,-7,-348","-282,-7,-357","-274,-7,-357","-266,-7,-357","-258,-7,-357","-250,-7,-357","-282,-7,-362","-274,-7,-362","-266,-7,-362","-258,-7,-362","-250,-7,-362","-282,-7,-367","-274,-7,-367","-266,-7,-367","-258,-7,-367","-250,-7,-367","-282,-7,-372","-274,-7,-372","-266,-7,-372","-258,-7,-372","-250,-7,-372","-282,-7,-377","-274,-7,-377","-266,-7,-377","-258,-7,-377","-250,-7,-377","-282,-7,-382","-274,-7,-382","-266,-7,-382","-258,-7,-382","-250,-7,-382","-248,0,-342","-260,0,-341","-271,0,-341","-281,0,-341"},
    Highschool = {"-659,47,312","-651,47,312","-643,47,312","-635,47,312","-627,47,312","-619,47,312","-611,47,312","-603,47,312","-595,47,312","-587,47,312","-579,47,312","-571,47,312","-659,47,321","-651,47,321","-643,47,321","-635,47,321","-627,47,321","-619,47,321","-611,47,321","-603,47,321","-595,47,321","-587,47,321","-579,47,321","-571,47,321","-659,47,330","-651,47,330","-643,47,330","-635,47,330","-627,47,330","-619,47,330","-611,47,330","-603,47,330","-595,47,330","-587,47,330","-579,47,330","-571,47,330"},
    Subway = {"671,47,-42","660,47,-42","649,47,-42","638,47,-42","627,47,-42","616,47,-42","605,47,-42","594,47,-42","671,47,-51","660,47,-51","649,47,-51","638,47,-51","627,47,-51","616,47,-51","605,47,-51","594,47,-51","671,47,-60","660,47,-60","649,47,-60","638,47,-60","627,47,-60","616,47,-60","605,47,-60","594,47,-60","671,47,-69","660,47,-69","649,47,-69","638,47,-69","627,47,-69","616,47,-69","605,47,-69","594,47,-69","671,47,-78","660,47,-78","649,47,-78","638,47,-78","627,47,-78","616,47,-78","605,47,-78","594,47,-78"},
    Traintracks = {"553,35,-56","553,35,-66","553,35,-76","553,35,-86","553,35,-96","553,35,-106","568,35,-56","568,35,-66","568,35,-76","568,35,-86","568,35,-96","568,35,-106","688,35,-141","679,35,-141","670,35,-141","661,35,-141","652,35,-141","643,35,-141","634,35,-141","625,35,-141","616,35,-141","607,35,-141","688,35,-156","679,35,-156","670,35,-156","661,35,-156","652,35,-156","643,35,-156","634,35,-156","625,35,-156","616,35,-156","607,35,-156","586,34,-142","579,34,-135","566,34,-122","572,34,-115","583,34,-127","593,34,-138"},
    Admin2 = {"-883,-40,-567","-883,-40,-572","-883,-40,-577","-883,-40,-582","-883,-40,-587","-883,-40,-592","-883,-40,-597","-883,-40,-602","-883,-40,-607","-883,-40,-612","-875,-40,-567","-875,-40,-572","-875,-40,-577","-875,-40,-582","-875,-40,-587","-875,-40,-592","-875,-40,-597","-875,-40,-602","-875,-40,-607","-875,-40,-612","-867,-40,-567","-867,-40,-572","-867,-40,-577","-867,-40,-582","-867,-40,-587","-867,-40,-592","-867,-40,-597","-867,-40,-602","-867,-40,-607","-867,-40,-612","-860,-40,-567","-860,-40,-572","-860,-40,-577","-860,-40,-582","-860,-40,-587","-860,-40,-592","-860,-40,-597","-860,-40,-602","-860,-40,-607","-860,-40,-612"},
}

function SurroundPlr(target)
    if IndexName(target) == nil then
        saymsg("Player not found.")
        return
    end
    target = game.Players:FindFirstChild(IndexName(target))
    local newalts = RecreateAlts()
    local surroundplr = CustomSetups['SurroundSetup']
    local s,e = pcall(function()
        for i,v in pairs(newalts) do
            if v == player.UserId then
                local x,y,z = tonumber(string.split(surroundplr[i],",")[1])+target.Character.HumanoidRootPart.CFrame.X,tonumber(string.split(surroundplr[i],",")[2])+target.Character.HumanoidRootPart.CFrame.Y,tonumber(string.split(surroundplr[i],",")[3])+target.Character.HumanoidRootPart.CFrame.Z
                player.Character.HumanoidRootPart.CFrame = CFrame.new(tonumber(x),tonumber(y),tonumber(z))
            end
        end
    end)
end

local OperatorPos = {
    Admin = "-873,-33,-535",
    Bank = "-376,21,-353",
    Train = "598,47,-113"
}

player.Chatted:Connect(function(msg)
    if IsAOperator == true then
        msg = string.lower(msg)
        local baseprefix = "/e"
        msg = string.split(msg," ")
        if msg[1] == baseprefix then
            if msg[2] == "cashcounter" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/grandpascripts/error502/main/Packages/DaHood/AltControl/CashCounterScript.lua"))()
            elseif msg[2] == "gui" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/grandpascripts/error502/main/Packages/DaHood/AltControl/AltControlSellerGuiPackage.lua"))()
            elseif msg[2] == "fly" then
                getgenv().FLYMODE = "Default"
                loadstring(game:HttpGet("https://raw.githubusercontent.com/LPrandom/lua-projects/master/open_sources/freefly.lua"))()
            elseif msg[2] == "chatspy" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/grandpascripts/error502/main/Packages/DaHood/AltControl/AltControlChatSpy.lua"))()
            elseif msg[2] == "place" then
                local function BreakCFrame(cords)
                    local pos = OperatorPos[cords]
                    local x,y,z = string.split(pos,",")[1],string.split(pos,",")[2],string.split(pos,",")[3]
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(x,y,z)
                end
                if msg[3] == "admin" then
                    BreakCFrame("Admin")
                elseif msg[3] == "bank" then
                    BreakCFrame("Bank")
                elseif msg[3] == "train" then
                    BreakCFrame("Train")
                end
            elseif msg[2] == "tp" then
                for i,v in pairs(game.Players:GetChildren()) do
                    if (string.sub(string.lower(v.Name),1,string.len(msg[3]))) == string.lower(msg[3]) then
                        player.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(v.Name).Character.HumanoidRootPart.CFrame
                        return
                    end
                end
            end
        end
    end
end)

local function MergeAlts()
    local whitelisted = {}
    table.insert(whitelisted,game.Players.LocalPlayer.Name)
    table.insert(whitelisted,operator.Name)
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
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(operator.Character.HumanoidRootPart.CFrame.X+5,operator.Character.HumanoidRootPart.CFrame.Y,operator.Character.HumanoidRootPart.CFrame.Z)
end

function calculator(___arg___)
    local chars = {"k","b","m"}
    function break_string(____string____)
        local string_ = {}
        ____string____:gsub(".",function(item)
            table.insert(string_,item)
        end)
        return string_
    end
    local broken_string = break_string(___arg___)
    local indicator = "None"
    for i,v in pairs(chars) do
        for i2,v2 in pairs(broken_string) do
            if v2 == v then
                indicator = v
            end
        end
    end
    if indicator == "None" then
        ___arg___ = tonumber(___arg___)
        return ___arg___
    end
    local cnt = 0
    for i,v in pairs(broken_string) do
        cnt = cnt + 1
    end
    table.remove(broken_string,cnt)
    local final_ = ""
    for i,v in pairs(broken_string) do
        final_ = final_..""..v
    end
    final_ = tonumber(final_)
    if string.lower(indicator) == "k" then
        return final_*1000
    elseif string.lower(indicator) == "m" then
        return final_*1000000
    elseif string.lower(indicator) == "b" then
        return final_*1000000000
    else
        return false
    end
end

local origin_Hide_PLACE
local function cmds(msg,plr)
    if IsAOperator == false or table.find(Settings['Operator'],plr) then
        local operator = game.Players:GetPlayerByUserId(plr)
        if msg == Settings['Prefix'].."stop" then
            IngameSettings['CustomDropDropping'] = false
            saymsg("Stopped dropping - "..player.Name)
            wait(5)
            game.ReplicatedStorage.MainEvent:FireServer("Block",false)
        elseif msg == Settings['Prefix'].."infosend" then
            if Settings['WebhookURL'] == "None" or Settings['WebhookURL'] == "" then
                saymsg("No webhook found.")
                return
            end
            if player.UserId == Alts[1] then
                local success, err = pcall(function()
                    function TotalAlts()local a=0;for b,c in pairs(Alts)do a=a+1 end;return a end
                    function OnlineAlts()local a=0;function CheckPlr(b)for c,d in pairs(game.Players:GetChildren())do if d.UserId==b then return true end end;return false end;for c,d in pairs(Alts)do if CheckPlr(d)==true then a=a+1 end end;return a end
                    function GetPing()local a=game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()local b=string.split(a,'(')local c=tonumber(b[1])c=tonumber(string.format("%.0f",c))return c end
                    function GetDropped()local a=0;for b,c in pairs(game.Workspace.Ignored.Drop:GetChildren())do if c.Name=="MoneyDrop"and c:IsA("Part")then local d=c:FindFirstChild("BillboardGui"):FindFirstChild("TextLabel").Text;if d then d=d:gsub("%,","")d=d:gsub("%$","")a=a+tonumber(d)end end end;return a end
                    function ListOnlineAlts()local a=""function CheckPlr(b)for c,d in pairs(game.Players:GetChildren())do if d.UserId==b then return true end end;return false end;for c,d in pairs(Alts)do if CheckPlr(d)==true then a=a..""..game.Players:GetPlayerByUserId(d).Name.."\n"end end;if a==""then return"None"end;return a end
                    function getCashPot()local a=0;for b,c in pairs(game.Players:GetChildren())do if not game.Workspace.Players:FindFirstChild(c.Name)then repeat wait()until game.Workspace.Players:FindFirstChild(c.Name)end;a=a+c.DataFolder.Currency.Value end;return a end
                    local WebMsg = "**Operator: "..game.Players:GetPlayerByUserId(Settings['Operator'][1]).Name.."\nPredropped: $"..formatnum(GetDropped()).."\nCash Pot: $"..formatnum(getCashPot()).."\nPing: "..GetPing().."ms\n\nAlts ["..OnlineAlts().."/"..TotalAlts().."]:\n"..ListOnlineAlts().."**"
                    request = HttpPost or request or http_request or syn.request
                    request({
                        Url = Settings['WebhookURL'],
                        Body = game:GetService("HttpService"):JSONEncode({
                            content = "",
                            embeds = {
                                {
                                    ['title'] = "Encrypt Alt Control!",
                                    ['description'] = WebMsg,
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
                saymsg("Sent!")
            end
        end
        msg = string.split(msg," ")
        msg[1] = string.lower(msg[1])
        if not IsAOperator then
            if msg[1] == Settings['Prefix'].."bring" then
                if (string.sub(string.lower(player.Name),1,string.len(msg[2]))) == string.lower(msg[2]) or msg[2] == "." then
                    player.Character.HumanoidRootPart.CFrame = operator.Character.HumanoidRootPart.CFrame
                end
            elseif msg[1] == Settings['Prefix'].."setup" then
                local newalts = RecreateAlts()
                function SetupPlace(place)
                    local cnt = 0
                    for i,v in pairs(newalts) do
                        cnt = cnt + 1
                        if v == player.UserId then
                            local place_ = locations[place][cnt]
                            local x,y,z = string.split(place_,',')[1],string.split(place_,',')[2],string.split(place_,',')[3]
                            player.Character.HumanoidRootPart.CFrame = CFrame.new(tonumber(x),tonumber(y),tonumber(z))
                        end
                    end
                end
                function SetupRandom()
                    player.Character.HumanoidRootPart.CFrame = operator.Character.HumanoidRootPart.CFrame
                    wait(2)
                    local ch = {"One","Two","Three","Four"}
                    local choosen = ch[math.random(#ch)]
                    if choosen == "One" then
                        player.Character.HumanoidRootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.CFrame.X+math.random(5,10),player.Character.HumanoidRootPart.CFrame.Y,player.Character.HumanoidRootPart.CFrame.Z-math.random(5,10))
                    elseif choosen == "Two" then
                        player.Character.HumanoidRootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.CFrame.X-math.random(5,10),player.Character.HumanoidRootPart.CFrame.Y,player.Character.HumanoidRootPart.CFrame.Z+math.random(5,10))
                    elseif choosen == "Three" then
                        player.Character.HumanoidRootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.CFrame.X+math.random(5,10),player.Character.HumanoidRootPart.CFrame.Y,player.Character.HumanoidRootPart.CFrame.Z+math.random(5,10))
                    elseif choosen == "Four" then
                        player.Character.HumanoidRootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.CFrame.X-math.random(5,10),player.Character.HumanoidRootPart.CFrame.Y,player.Character.HumanoidRootPart.CFrame.Z-math.random(5,10))
                    end
                end
                if string.lower(msg[2]) == "admin" then
                    SetupPlace('Admin')
                elseif string.lower(msg[2]) == 'admin2' then
                    SetupPlace('Admin2')
                elseif string.lower(msg[2]) == 'bank' then
                    SetupPlace('Bank')
                elseif string.lower(msg[2]) == 'jailyard' then
                    SetupPlace('Jailyard')
                elseif string.lower(msg[2]) == 'jailcell' then
                    SetupPlace('Jailcell')
                elseif string.lower(msg[2]) == 'club' then
                    SetupPlace('Club')
                elseif string.lower(msg[2]) == 'subway' then
                    SetupPlace('Subway')
                elseif string.lower(msg[2]) == 'school' then
                    SetupPlace('Highschool')
                elseif string.lower(msg[2]) == 'random' then
                    SetupRandom()
                elseif string.lower(msg[2]) == 'host' then
                    SurroundPlr(operator.Name)
                end
            elseif msg[1] == Settings['Prefix'].."freeze" then
                if string.lower(msg[2]) == "on" then
                    player.Character.HumanoidRootPart.Anchored = true
                elseif string.lower(msg[2]) == "off" then
                    player.Character.HumanoidRootPart.Anchored = false
                end
            elseif msg[1] == Settings['Prefix'].."wallet" then
                if string.lower(msg[2]) == "on" then
                    player.Backpack:FindFirstChild("Wallet").Parent = player.Character
                elseif string.lower(msg[2]) == "off" then
                    player.Character:FindFirstChild("Wallet").Parent = player.Backpack
                end
            elseif msg[1] == Settings['Prefix'].."god" then
                if string.lower(msg[2]) == "on" then
                    if game.Players.LocalPlayer.Character:FindFirstChild("BodyEffects").Attacking then
                        game.Players.LocalPlayer.Character:FindFirstChild("BodyEffects").Attacking:Destroy()
                    end
                elseif string.lower(msg[2]) == "off" then
                    local origin = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if v:IsA("MeshPart") or v.Name == "HumanoidRootPart" or v.Name == "Humanoid" then
                            pcall(function()
                                v:Destroy()
                            end)
                        end
                    end
                    wait(1)
                    game.Players.LocalPlayer.CharacterAdded:Wait()
                    wait(5)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = origin
                end
            elseif msg[1] == Settings['Prefix'].."loopdestroy" then
                if string.lower(msg[2]) == "on" then
                    IngameSettings['loop_destroy'] = true
                elseif string.lower(msg[2]) == "off" then
                    IngameSettings['loop_destroy'] = false
                end
            elseif msg[1] == Settings['Prefix'].."advert" then
                if string.lower(msg[2]) == "on" then
                    IngameSettings['advertisement'] = true
                    while IngameSettings['advertisement'] == true do
                        if Settings['AdMsg'] == "" or Settings['AdMsg'] == nil then
                            Settings['AdMsg'] = "discord.gg/encrypt"
                        end
                        saymsg(Settings['AdMsg'])
                        wait(Settings['AdDelay'])
                    end
                elseif string.lower(msg[2]) == "off" then
                    IngameSettings['advertisement'] = false
                end
            elseif msg[1] == Settings['Prefix'].."vibe" then
                if string.lower(msg[2]) == "on" then
                    local Dance1ani = Instance.new('Animation', AnimationsFolder)
                    Dance1ani.AnimationId = 'rbxassetid://3189773368'
                    local Dance1 = player.Character.Humanoid:LoadAnimation(Dance1ani)
                    Dance1:Play()
                elseif string.lower(msg[2]) == "off" then
                    for i,v in pairs(game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do 
                        if v.Name == "Animation" or v.Name == "Animation1" then
                            v:Stop()    
                        end
                    end
                end
            elseif msg[1] == Settings['Prefix'].."airlock" then
                if string.lower(msg[2]) == "on" then
                    local PartName = "FloatingPart"
                    local FolderName = "Encrypt"
                    if not workspace:FindFirstChild(FolderName) then
                        local Folder = Instance.new("Folder",workspace)
                        Folder.Name = FolderName
                    end
                    for i,v in pairs(workspace[FolderName]:GetChildren()) do
                        if v.Name == PartName then
                            v:Destroy()
                        end
                    end
                    local Part = Instance.new("Part",workspace[FolderName])
                    Part.Name = PartName
                    Part.Transparency = 1
                    Part.Size = Vector3.new(15,1,15)
                    Part.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y+7,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                    Part.Anchored = true
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y+9,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                elseif string.lower(msg[2]) == "off" then
                    for i,v in pairs(workspace['Encrypt']:GetChildren()) do
                        if v.Name == 'FloatingPart' then
                            v:Destroy()
                        end
                    end
                end
            elseif msg[1] == Settings['Prefix'].."drop" then
                if string.lower(msg[2]) == "on" then
                    IngameSettings['Dropping'] = true
                elseif string.lower(msg[2]) == "off" then
                    IngameSettings['Dropping'] = false
                end
            elseif msg[1] == Settings['Prefix'].."moneygun" then
                if string.lower(msg[2]) == "on" then
                    function BuyMoneyGun()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.Ignored.Shop:FindFirstChild("[Money Gun] - $777").Head.CFrame.X,game.Workspace.Ignored.Shop:FindFirstChild("[Money Gun] - $777").Head.CFrame.Y+2,game.Workspace.Ignored.Shop:FindFirstChild("[Money Gun] - $777").Head.CFrame.Z)
                        fireclickdetector(game.Workspace.Ignored.Shop:FindFirstChild("[Money Gun] - $777").ClickDetector)
                        for i,v in pairs(player.Backpack:GetChildren()) do
                            if v.Name == '[Money Gun]' then
                                v.Parent = player.Character
                            end
                        end
                    end
                    function CheckGuns()
                        local total = 0
                        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v.Name == "[Money Gun]" and v:IsA("Tool") then
                                total = total + 1
                            end
                        end
                        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if v.Name == "[Money Gun]" and v:IsA("Tool") then
                                total = total + 1
                            end
                        end
                        return total
                    end
                    local gunners = player.Character:FindFirstChild("[Money Gun]") or player.Backpack:FindFirstChild("[Money Gun]")
                    if not gunners then
                        local origin = player.Character.HumanoidRootPart.CFrame
                        repeat BuyMoneyGun() wait() until CheckGuns() >= 2 
                        player.Character.HumanoidRootPart.CFrame = origin
                    end
                    for i,v in pairs(player.Backpack:GetChildren()) do
                        if v.Name == '[Money Gun]' then
                            v.Parent = player.Character
                        end
                    end
                    IngameSettings['MoneyGunActive'] = true
                    while IngameSettings['MoneyGunActive'] == true do
                        if not IngameSettings['MoneyGunActive'] then break end
                        for i,v in pairs(player.Character:GetChildren()) do
                            if v.Name == '[Money Gun]' then
                                v:Activate()
                            end
                        end
                        wait(0.01)
                    end
                elseif string.lower(msg[2]) == "off" then
                    IngameSettings['MoneyGunActive'] = false
                    for i,v in pairs(player.Character:GetChildren()) do
                        if v.Name == '[Money Gun]' then
                            v.Parent = player.Backpack
                        end
                    end
                end
            elseif msg[1] == Settings['Prefix'].."mask" then
                if string.lower(msg[2]) == "on" then
                    if not player.Character:FindFirstChild('In-gameMask') then
                        local itemMask_ = player.Backpack:FindFirstChild("Mask") or player.Character:FindFirstChild("Mask")
                        if not itemMask_ then
                            local origin = player.Character.HumanoidRootPart.CFrame
                            repeat
                                player.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop:FindFirstChild("[Surgeon Mask] - $25").Head.CFrame
                                fireclickdetector(game.Workspace.Ignored.Shop:FindFirstChild("[Surgeon Mask] - $25").ClickDetector)
                                wait()
                            until player.Backpack:FindFirstChild("Mask") or player.Character:FindFirstChild("Mask")
                        end
                        if player.Backpack:FindFirstChild("Mask") then
                            player.Backpack:FindFirstChild("Mask").Parent = player.Character
                        end
                        local mask_item = player.Character:FindFirstChild("Mask")
                        mask_item:Activate()
                        if player.Character:FindFirstChild("Mask") then
                            player.Character:FindFirstChild("Mask").Parent = player.Backpack
                        end
                    end
                elseif string.lower(msg[2]) == "off" then
                    if player.Backpack:FindFirstChild("Mask") then
                        player.Backpack:FindFirstChild("Mask").Parent = player.Character
                        player.Character:FindFirstChild("Mask"):Activate()
                        player.Character:FindFirstChild("Mask").Parent = player.Backpack
                    end
                end
            elseif msg[1] == Settings['Prefix'].."crash" then
                if string.lower(msg[2]) == "encrypt" then
                    if player.UserId == Alts[1] or player.UserId == Alts[2] or player.UserId == Alts[3] then
                        setfpscap(60)
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/LPrandom/lua-projects/master/dahoodcrasher.lua"))()
                    end
                elseif string.lower(msg[2]) == "swag" then
                    if player.UserId == Alts[1] or player.UserId == Alts[2] or player.UserId == Alts[3] then
                        setfpscap(60)
                        loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SuperCustomServerCrasher'))()
                    end
                end
            elseif msg[1] == Settings['Prefix'].."hide" then
                if string.lower(msg[2]) == "on" then
                    if player.Character.HumanoidRootPart.Anchored == true then
                        player.Character.HumanoidRootPart.Anchored = false
                    end
                    origin_Hide_PLACE = player.Character.HumanoidRootPart.CFrame
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(-869,-43,-1165)
                elseif string.lower(msg[2]) == "off" then
                    player.Character.HumanoidRootPart.CFrame = operator.Character.HumanoidRootPart.CFrame
                end
            elseif msg[1] == Settings['Prefix'].."say" then
                local success, err = pcall(function()
                    local final_msg = ""
                    local new_msg = {}
                    for i,v in pairs(msg) do
                        print(v)
                        table.insert(new_msg,v)
                    end
                    
                    table.remove(new_msg,1)
                    for i,v in pairs(new_msg) do
                        final_msg = final_msg..""..v.." "
                    end
                    saymsg(final_msg)
                end)
            elseif msg[1] == Settings['Prefix'].."fps" then
                setfpscap(msg[2])
                saymsg(player.Name.." FPS is now capped at "..msg[2])
            elseif msg[1] == Settings['Prefix'].."dropuntil" then
                local amt = calculator(string.lower(msg[2]))
                if amt == false then
                    saymsg("Internal error has occured, command "..msg[1])
                    return
                end
                function GetGroundCash()
                    local total = 0
                    for i, v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
                        if v.Name == "MoneyDrop" and v:IsA("Part") then
                            local bg = v:FindFirstChild("BillboardGui"):FindFirstChild("TextLabel").Text
                            if bg then
                                bg = bg:gsub("%,", "")
                                bg = bg:gsub("%$", "")
                                total = total + tonumber(bg)
                            end
                        end
                    end
                    return total
                end
                IngameSettings['CustomDropDropping'] = true
                while IngameSettings['CustomDropDropping'] == true do
                    wait()
                    if IngameSettings['CustomDropDropping'] == false then break end
                    if GetGroundCash() >= amt then
                        IngameSettings['CustomDropDropping'] = false
                        saymsg(string.lower(msg[2]).." has been dropped!")
                        game.ReplicatedStorage.MainEvent:FireServer("Block",false)
                        break
                    end
                    game.ReplicatedStorage.MainEvent:FireServer("DropMoney",10000)
                    game.ReplicatedStorage.MainEvent:FireServer("Block",true)
                end
            elseif msg[1] == Settings['Prefix'].."present" then
                local newalts = RecreateAlts()
                function SetUpCustom(method_place)
                    local area = CustomSetups[method_place]
                    for i,v in pairs(newalts) do
                        if v == player.UserId then
                            local x,y,z = tonumber(string.split(area[i],",")[1])+operator.Character.HumanoidRootPart.CFrame.X,tonumber(string.split(area[i],",")[2])+operator.Character.HumanoidRootPart.CFrame.Y,tonumber(string.split(area[i],",")[3])+operator.Character.HumanoidRootPart.CFrame.Z
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(tonumber(x),tonumber(y),tonumber(z))
                        end
                    end
                end
                if string.lower(msg[2]) == "army" then
                    SetUpCustom('ArmyLineSetup')
                elseif string.lower(msg[2]) == "heart" then
                    SetUpCustom('HeartSetup')
                elseif string.lower(msg[2]) == "pizza" then
                    SetUpCustom('PizzaSetup')
                elseif string.lower(msg[2]) == "square" then
                    SetUpCustom('SquareSetup')
                elseif string.lower(msg[2]) == "diamond" then
                    SetUpCustom('DiamondSetup')
                elseif string.lower(msg[2]) == "line" then
                    SetUpCustom('HorizontalLine')
                elseif string.lower(msg[2]) == "line2" then
                    SetUpCustom('DiamondSetup')
                elseif string.lower(msg[2]) == "merge" then
                    MergeAlts()
                end
            elseif msg[1] == Settings['Prefix'].."surround" then
                SurroundPlr(msg[2])
            elseif msg[1] == Settings['Prefix'].."reset" then
                if (string.sub(string.lower(player.Name),1,string.len(msg[2]))) == string.lower(msg[2]) or msg[2] == "." then
                    local origin = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    for i,v in pairs(player.Character:GetChildren()) do
                        if v:IsA("MeshPart") or v.Name == "Humanoid" or v.Name == "HumanoidRootPart" then
                            v:Destroy()
                        end
                    end
                    wait(2)
                    player.CharacterAdded:Wait()
                    wait(5)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = origin
                end
            elseif msg[1] == Settings['Prefix'].."ucdrop" then
                if string.lower(msg[2]) == "on" then
                    MergeAlts()
                    local newplc = CFrame.new(operator.Character.HumanoidRootPart.CFrame.X,operator.Character.HumanoidRootPart.CFrame.Y,operator.Character.HumanoidRootPart.CFrame.Z+10)
                    player.Character.HumanoidRootPart.CFrame = newplc
                    for i,v in pairs(workspace:GetChildren()) do
                        if v.Name == "1_Part_1" then
                            v:Destroy()
                        end
                    end
                    local Part = Instance.new("Part",workspace)
                    Part.Name = "1_Part_1"
                    Part.Transparency = 1
                    Part.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y-11,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                    Part.Anchored = true
                    Part.Size = Vector3.new(Part.Size.X + 50,Part.Size.Y+1,Part.Size.Z+50)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y-10,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                    wait(2.5)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
                elseif string.lower(msg[2]) == "off" then
                    IngameSettings['Dropping'] = false
                end
            end
        end
    end
end

game.ReplicatedStorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(messageData) 
    local user = game:service"Players":GetPlayerByUserId(game.Players:GetUserIdFromNameAsync(messageData.FromSpeaker)).Name
    local msg = messageData.Message
    if table.find(Settings['Operator'],game:service"Players"[user].UserId) then
        cmds(msg, game:service"Players"[user].UserId)
    end
end)