if not game:IsLoaded() then
	game.Loaded:Wait()
end

local StompBot = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local status = Instance.new("TextLabel")

StompBot.Name = "StompBot"
StompBot.Parent = game.CoreGui
StompBot.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = StompBot
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.45137161, 0, 0.637594044, 0)
Frame.Size = UDim2.new(0, 178, 0, 54)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.235093907, 0, 0.64846313, 0)
TextLabel.Size = UDim2.new(0, 94, 0, 18)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.Text = "Stomp Bot"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 20.000

UICorner.Parent = Frame

status.Name = "status"
status.Parent = Frame
status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
status.BackgroundTransparency = 1.000
status.Size = UDim2.new(0, 178, 0, 18)
status.Font = Enum.Font.GothamSemibold
status.Text = " Status: None"
status.TextColor3 = Color3.fromRGB(255, 255, 255)
status.TextSize = 14.000
status.TextXAlignment = Enum.TextXAlignment.Left

-- Scripts:

local function PZLZK_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	script.Parent.Active, script.Parent.Draggable = true, true
	game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(key)	
		if string.lower(key) == "k" then
			if script.Parent.Visible == true then
				script.Parent.Visible = false
			else
				script.Parent.Visible = true
			end
		end
	end)
end
coroutine.wrap(PZLZK_fake_script)()

status.Text = " Status: Loading..."

repeat wait() until game.Workspace.Players:FindFirstChild(game.Players.LocalPlayer.Name)

status.Text = " Status: Scanning..."

local function checkForDead()
    for i,v in pairs(game.Players:GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            if v.Character.BodyEffects:FindFirstChild("K.O").Value == true then
                return v.Name
            end
        end
    end
    return false
end
local function serverHop()
    local x = {}
    for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
        if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
            x[#x + 1] = v.id
        end
    end
    if #x > 0 then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
    else
        print('Error')
    end
end

game:GetService("RunService").Stepped:Connect(function()
    if checkForDead() == false then
        local success, err = pcall(serverHop)
        if err then serverHop() end
        wait(10)
        if err then serverHop() end
        wait(10)
        if err then serverHop() end
        wait(10)
        if err then serverHop() end
        wait(10)
        if err then serverHop() end
        wait(10)
    end
    if game.Players.LocalPlayer.Character.BodyEffects:FindFirstChild("K.O").Value == true then
        status.Text = " Status: Serverhopping"
        for i,v in pairs(game.Workspace.Players:FindFirstChild(game.Players.LocalPlayer.Name):GetChildren()) do
            if v:IsA("Accessory") or v:IsA("MeshPart") or v.Name == "HumanoidRootPart" then
                v:Destroy()
            end
        end
        local success, err = pcall(serverHop)
        if err then serverHop() end
        wait(10)
        if err then serverHop() end
        wait(10)
        if err then serverHop() end
        wait(10)
        if err then serverHop() end
        wait(10)
        if err then serverHop() end
        wait(10)
    end
end)

while true do wait()
    local target = checkForDead()
    if target == false then
        status.Text = " Status: Serverhopping"
        local success, err = pcall(serverHop)
        if err then serverHop() end
        wait(10)
        if err then serverHop() end
        wait(10)
        if err then serverHop() end
        wait(10)
        if err then serverHop() end
        wait(10)
        if err then serverHop() end
        wait(10)
    end
    for i=1,5 do
        wait(0.2)
        status.Text = " Status: Stomping..."
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players:FindFirstChild(target).Character.UpperTorso.Position.X,game.Players:FindFirstChild(target).Character.UpperTorso.Position.Y+3,game.Players:FindFirstChild(target).Character.UpperTorso.Position.Z)
        game.ReplicatedStorage.MainEvent:FireServer("Stomp")
    end
end