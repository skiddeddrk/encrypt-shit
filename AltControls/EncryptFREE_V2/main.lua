getgenv().Host = 123456
getgenv().FPS = 3
getgenv().Prefix = "/"
getgenv().Alts = {}

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local player = game.Players.LocalPlayer
local function notify(a,b,c)
    game.StarterGui:SetCore("SendNotification",{
        Title = a;
        Text = b;
        Duration = c;
    })
end
local isaoperator = false
if player.UserId == Host then
    isaoperator = true
    notify("Operator!","Permissions granted!",5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/grandpascripts/error502/main/Packages/DaHood/AltControl/CashCounterScript.lua"))()
end

game.Players.LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),game.Workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),game.Workspace.CurrentCamera.CFrame)
end)

if isaoperator == false then
    setfpscap(FPS)
    local OFF = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local TextLabel_2 = Instance.new("TextLabel")

    OFF.Name = "OFF"
    OFF.Parent = game.CoreGui
    OFF.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Parent = OFF
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 100
    Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    Frame.Size = UDim2.new(1, 0, 1, 0)

    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Position = UDim2.new(0.365336657, 0, 0.175939858, 0)
    TextLabel.Size = UDim2.new(0, 431, 0, 50)
    TextLabel.Font = Enum.Font.GothamSemibold
    TextLabel.Text = "FREE VERSION"
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 30.000

    TextLabel_2.Parent = Frame
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.BackgroundTransparency = 1.000
    TextLabel_2.Position = UDim2.new(0.365336657, 0, 0.251127839, 0)
    TextLabel_2.Size = UDim2.new(0, 431, 0, 50)
    TextLabel_2.Font = Enum.Font.GothamSemibold
    TextLabel_2.Text = "NAME"
    TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.TextSize = 30.000

    local function MAFU_fake_script() -- TextLabel_2.LocalScript 
        local script = Instance.new('LocalScript', TextLabel_2)

        script.Parent.Text = game.Players.LocalPlayer.Name
    end
    coroutine.wrap(MAFU_fake_script)()
    for i,v in pairs(game:GetDescendants()) do
        if v:IsA("Part") then
            v.Transparency = 1
        end
    end
    settings().Rendering.QualityLevel = "Level01"
end

local SetupPos = {
    "16,0,10",
    "10,0,10",
    "4,0,10",
    "-2,0,10",
    "-8,0,10",
    "-14,0,10",
    "16,0,-10",
    "10,0,-10",
    "4,0,-10",
    "-2,0,-10",
    "-8,0,-10",
    "-14,0,-10",
}

local Settings_ = {
    Dropping = false,
    Blocking = false
}

game:GetService("RunService").Stepped:Connect(function()
    if Settings_['Dropping'] == true then
        game.ReplicatedStorage.MainEvent:FireServer("DropMoney",10000)
    end
    if Settings_['Blocking'] == true or Settings_['Dropping'] == true then
        game.ReplicatedStorage.MainEvent:FireServer("Block",true)
    end
end)

local function cmds(msg,plr)
    if isaoperator == false or plr == Host then
        local operator = game.Players:GetPlayerByUserId(plr)
        if string.lower(msg) == Prefix.."bring" then
            if not isaoperator then
                player.Character.HumanoidRootPart.CFrame = operator.Character.HumanoidRootPart.CFrame
            end
        elseif string.lower(msg) == Prefix.."freeze" then
            if not isaoperator then
                player.Character.HumanoidRootPart.Anchored = true
            end
        elseif string.lower(msg) == Prefix.."unfreeze" then
            if not isaoperator then
                player.Character.HumanoidRootPart.Anchored = false
            end
        elseif string.lower(msg) == Prefix.."drop" then
            if not isaoperator then
                Settings_['Dropping'] = true
            end
        elseif string.lower(msg) == Prefix.."undrop" then
            if not isaoperator then
                Settings_['Dropping'] = false
                wait(2)
                game.ReplicatedStorage.MainEvent:FireServer("Block",false)
            end
        elseif string.lower(msg) == Prefix.."block" then
            if not isaoperator then
                Settings_['Blocking'] = true
            end
        elseif string.lower(msg) == Prefix.."unblock" then
            if not isaoperator then
                Settings_['Blocking'] = false
                wait(2)
                game.ReplicatedStorage.MainEvent:FireServer("Block",false)
            end
        elseif string.lower(msg) == Prefix.."setup" then
            if not isaoperator then
                function ContructNewTable()
                    local t = {}
                    function CheckPlr(_id_)
                        for i,v in pairs(game.Players:GetChildren()) do
                            if v.UserId == _id_ then
                                return true
                            end
                        end
                        return false
                    end
                    for i,v in pairs(Alts) do
                        if CheckPlr(v) == true then
                            table.insert(t,v)
                        end
                    end
                    return t
                end
                local betterAlts = ContructNewTable()
                for i=1,#betterAlts do
                    if betterAlts[i] == player.UserId then
                        player.Character.HumanoidRootPart.CFrame = CFrame.new(tonumber(string.split(SetupPos[i],",")[1])+operator.Character.HumanoidRootPart.CFrame.X,tonumber(string.split(SetupPos[i],",")[2])+operator.Character.HumanoidRootPart.CFrame.Y,tonumber(string.split(SetupPos[i],",")[3])+operator.Character.HumanoidRootPart.CFrame.Z)
                    end
                end
            end
        elseif string.lower(msg) == Prefix.."airlock" then
            if not isaoperator then
                for i,v in pairs(workspace:GetChildren()) do
                    if v.Name == "MAN___" then
                        v:Destroy()
                    end
                end
                local Part = Instance.new("Part",workspace)
                Part.Name = "MAN___"
                Part.Size = Vector3.new(10,1,10)
                Part.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y+8,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                Part.Anchored = true
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y+10,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                wait(5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
                wait(4)
                for i,v in pairs(workspace:GetChildren()) do
                    if v.Name == "MAN___" then
                        v:Destroy()
                    end
                end
            end
        elseif string.lower(msg) == Prefix.."unairlock" then
            if not isaoperator then
                for i,v in pairs(workspace:GetChildren()) do
                    if v.Name == "MAN___" then
                        v:Destroy()
                    end
                end
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            end
        end
    end
end

game.ReplicatedStorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(messageData) 
    local user = game:service"Players":GetPlayerByUserId(game.Players:GetUserIdFromNameAsync(messageData.FromSpeaker))
    local msg = messageData.Message
    if user.UserId == Host then
        cmds(msg, user.UserId)
    end
end)