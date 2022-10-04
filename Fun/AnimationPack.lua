
local encryptv2 = Instance.new("ScreenGui")
local AnimationPack = Instance.new("TextButton")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local TextButton = Instance.new("TextButton")
local TextButton_2 = Instance.new("TextButton")
local TextButton_3 = Instance.new("TextButton")
local TextButton_4 = Instance.new("TextButton")
local TextButton_5 = Instance.new("TextButton")
local TextButton_6 = Instance.new("TextButton")
local TextButton_7 = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

encryptv2.Name = "encryptv2"
encryptv2.Parent = game.CoreGui
encryptv2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

AnimationPack.Name = "AnimationPack"
AnimationPack.Parent = encryptv2
AnimationPack.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AnimationPack.BorderSizePixel = 0
AnimationPack.Position = UDim2.new(0, 0, 0.5, 0)
AnimationPack.Size = UDim2.new(0, 100, 0, 20)
AnimationPack.Font = Enum.Font.SourceSansBold
AnimationPack.Text = "Animations"
AnimationPack.TextColor3 = Color3.fromRGB(0, 0, 0)
AnimationPack.TextSize = 18.000
AnimationPack.MouseButton1Click:Connect(function()
    ScrollingFrame.Visible = not ScrollingFrame.Visible
    CloseButton.Visible = not CloseButton.Visible
end)

ScrollingFrame.Parent = AnimationPack
ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
ScrollingFrame.Position = UDim2.new(0, 60, 0, 0)
ScrollingFrame.Size = UDim2.new(0, 120, 0, 195)
ScrollingFrame.Visible = false
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 1, 200)

UIListLayout.Parent = ScrollingFrame
UIListLayout.Padding = UDim.new(0, 2)

local Humanoid = game:service"Players".LocalPlayer.Character.Humanoid
local function PlayAnim(ID)
    if not workspace:FindFirstChild("AnimationsFolderHandler") then
        local Folder = Instance.new("Folder")
        Folder.Name = "AnimationsFolderHandler"
        Folder.Parent = workspace
    end
    local f = workspace:FindFirstChild("AnimationsFolderHandler")
    local Animation = Instance.new("Animation")
    Animation.Parent = f
    Animation.AnimationId = ID
    local Anim = Humanoid:LoadAnimation(Animation)
    Anim:Play()
    Humanoid.Running:Connect(function()
        Anim:Stop()
    end)
end

TextButton.Parent = ScrollingFrame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.Size = UDim2.new(1, 0, 0, 30)
TextButton.Font = Enum.Font.GothamBlack
TextButton.Text = "Lean"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 12.000
TextButton.MouseButton1Click:Connect(function()
    PlayAnim('rbxassetid://3152375249')
end)

TextButton_2.Parent = ScrollingFrame
TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.Size = UDim2.new(1, 0, 0, 30)
TextButton_2.Font = Enum.Font.GothamBlack
TextButton_2.Text = "Lay"
TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.TextSize = 12.000
TextButton_2.MouseButton1Click:Connect(function()
    PlayAnim('rbxassetid://3152378852')
end)

TextButton_3.Parent = ScrollingFrame
TextButton_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_3.Size = UDim2.new(1, 0, 0, 30)
TextButton_3.Font = Enum.Font.GothamBlack
TextButton_3.Text = "Dance1"
TextButton_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_3.TextSize = 12.000
TextButton_3.MouseButton1Click:Connect(function()
    PlayAnim('rbxassetid://3189773368')
end)

TextButton_4.Parent = ScrollingFrame
TextButton_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_4.Size = UDim2.new(1, 0, 0, 30)
TextButton_4.Font = Enum.Font.GothamBlack
TextButton_4.Text = "Dance2"
TextButton_4.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_4.TextSize = 12.000
TextButton_4.MouseButton1Click:Connect(function()
    PlayAnim('rbxassetid://3189776546')
end)

TextButton_5.Parent = ScrollingFrame
TextButton_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_5.Size = UDim2.new(1, 0, 0, 30)
TextButton_5.Font = Enum.Font.GothamBlack
TextButton_5.Text = "Greet"
TextButton_5.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_5.TextSize = 12.000
TextButton_5.MouseButton1Click:Connect(function()
    PlayAnim('rbxassetid://3189777795')
end)

TextButton_6.Parent = ScrollingFrame
TextButton_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_6.Size = UDim2.new(1, 0, 0, 30)
TextButton_6.Font = Enum.Font.GothamBlack
TextButton_6.Text = "Chest Pump"
TextButton_6.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_6.TextSize = 12.000
TextButton_6.MouseButton1Click:Connect(function()
    PlayAnim('rbxassetid://3189779152')
end)

TextButton_7.Parent = ScrollingFrame
TextButton_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_7.Size = UDim2.new(1, 0, 0, 30)
TextButton_7.Font = Enum.Font.GothamBlack
TextButton_7.Text = "Praying"
TextButton_7.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_7.TextSize = 12.000
TextButton_7.MouseButton1Click:Connect(function()
    PlayAnim('rbxassetid://3487719500')
end)

CloseButton.Name = "CloseButton"
CloseButton.Parent = AnimationPack
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 112, 112)
CloseButton.Position = UDim2.new(0, 0, 0, 97)
CloseButton.Size = UDim2.new(0, 120, 0, 25)
CloseButton.Visible = false
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Text = "CLOSE"
CloseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
CloseButton.TextSize = 30.000
CloseButton.MouseButton1Click:Connect(function()
    ScrollingFrame.Visible = not ScrollingFrame.Visible
    CloseButton.Visible = not CloseButton.Visible
end)