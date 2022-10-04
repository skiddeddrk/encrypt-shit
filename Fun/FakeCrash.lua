local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local TextLabel = Instance.new("TextLabel")
local out = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.473023832, 0, 0.413533837, 0)
Frame.Size = UDim2.new(0, 256, 0, 93)

UIListLayout.Parent = Frame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(0, 256, 0, 45)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.Text = "Will crash at 500 tools"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 20.000

out.Name = "out"
out.Parent = Frame
out.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
out.BackgroundTransparency = 1.000
out.Size = UDim2.new(0, 256, 0, 45)
out.Font = Enum.Font.GothamSemibold
out.Text = "0/500"
out.TextColor3 = Color3.fromRGB(255, 255, 255)
out.TextSize = 20.000

UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = Frame

local OriginalMessage = "Will crash at 500 tools"
local FakeMessage = "Bypassing serverside patch."
local FakeCFrame = CFrame.new(0,10000,0)

local Item = "[Taco] - $2"
local ItemName = "[Taco]"
local player = game:service"Players".LocalPlayer
local MaxItems = 500
local Items = 0

if not player.Backpack:FindFirstChild(ItemName) or player.Character:FindFirstChild(ItemName) then
    local original = player.Character.HumanoidRootPart.CFrame
    repeat
        player.Character.HumanoidRootPart.CFrame = workspace.Ignored.Shop[Item].Head.CFrame
        fireclickdetector(workspace.Ignored.Shop[Item].ClickDetector)
        wait(0.01)
    until player.Backpack:FindFirstChild(ItemName) or player.Character:FindFirstChild(ItemName)
    player.Character.HumanoidRootPart.CFrame = original
end

local TACO_DUPE = player.Backpack:FindFirstChild(ItemName) or player.Character:FindFirstChild(ItemName)

TextLabel.Text = FakeMessage
player.Character.HumanoidRootPart.CFrame = FakeCFrame
wait(4)
TextLabel.Text = OriginalMessage

game:service"RunService".Stepped:Connect(function()
    local BATE = 0
    for i,v in pairs(player.Character:GetChildren()) do
        if v:IsA("Tool") then
            BATE = BATE + 1
        end
    end
    for i,v in pairs(player.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            BATE = BATE + 1
        end
    end
    Items = Items
    out.Text = tostring(Items).."/"..tostring(MaxItems)
end)

repeat
    player.Character.HumanoidRootPart.CFrame = workspace.Ignored.Shop[Item].Head.CFrame
    player.DataFolder.Currency.Value = player.DataFolder.Currency.Value - 2
    wait(.1)
    local NEWITEM = TACO_DUPE:Clone()
    NEWITEM.Parent = player.Backpack
    wait(0.1)
    NEWITEM.Parent = player.Character
    wait(0.6)
until Items >= MaxItems
game:service"ReplicatedStorage".MainEvent:FireServer("BreathingHAMON")