local player = game:service"Players".LocalPlayer

local Actions = {
    UP = 0,
    DOWN = 0
}
z
if workspace:FindFirstChild("IndianPart") then
    workspace:FindFirstChild("IndianPart"):Destroy()
end

local Part = Instance.new("Part",workspace)
Part.Name = "IndianPart"
Part.Size = Vector3.new(4,1,4)
local Yield = 3.65

player.Chatted:Connect(function(msg)
    if msg:lower():split(" ")[1] == "yield" then
        if msg:lower():split(" ")[2] == "normal" then
            Yield = 3.65
        else
            Yield = msg:lower():split(" ")[2]
        end
    end
end)

game:service"UserInputService".InputBegan:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.N then
        Actions['UP'] = 1
    end
    if key.KeyCode == Enum.KeyCode.M then
        Actions['DOWN'] = 1
    end
end)

game:service"UserInputService".InputEnded:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.N then
        Actions['UP'] = 0
    end
    if key.KeyCode == Enum.KeyCode.M then
        Actions['DOWN'] = 0
    end
end)

game:service"RunService".Stepped:Connect(function()
    if player.Character and workspace.Players:FindFirstChild(player.Name) then
        pcall(function()
            Part.CFrame = player.Character.HumanoidRootPart.CFrame*CFrame.new(0,-Yield,0)
        end)
    end
    if Actions['UP'] == 1 then
        player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame*CFrame.new(0,1,0)
    end
    if Actions['DOWN'] == 1 then
        player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame*CFrame.new(0,-1,0)
    end
end)