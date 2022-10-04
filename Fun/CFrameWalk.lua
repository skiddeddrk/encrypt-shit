local player = game.Players.LocalPlayer
local UIS = game:service"UserInputService"
local speed = 1.2
local Actions = {W=0,S=0,A=0,D=0,SPACE=0

UIS.InputBegan:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.W then
        Actions["W"] = 1
    end
    if key.KeyCode == Enum.KeyCode.S then
        Actions["S"] = 1
    end
    if key.KeyCode == Enum.KeyCode.A then
        Actions["A"] = 1
    end
    if key.KeyCode == Enum.KeyCode.D then
        Actions["D"] = 1
    end
    if key.KeyCode == Enum.KeyCode.Space then
        Actions["SPACE"] = 1
    end
end)
UIS.InputEnded:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.W then
        Actions["W"] = 0
    end
    if key.KeyCode == Enum.KeyCode.S then
        Actions["S"] = 0
    end
    if key.KeyCode == Enum.KeyCode.A then
        Actions["A"] = 0
    end
    if key.KeyCode == Enum.KeyCode.D then
        Actions["D"] = 0
    end
    if key.KeyCode == Enum.KeyCode.Space then
        Actions["SPACE"] = 0
    end
end)

game:service"RunService".Stepped:Connect(function()
    if Actions["W"] == 1 then
        player.Character.HumanoidRootPart.CFrame=player.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-speed)
    end
    if Actions["S"] == 1 then
        player.Character.HumanoidRootPart.CFrame=player.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,speed)
    end
    if Actions["A"] == 1 then
        player.Character.HumanoidRootPart.CFrame=player.Character.HumanoidRootPart.CFrame*CFrame.new(-speed,0,0)
    end
    if Actions["D"] == 1 then
        player.Character.HumanoidRootPart.CFrame=player.Character.HumanoidRootPart.CFrame*CFrame.new(speed,0,0)
    end
    if Actions["SPACE"] == 1 then
        player.Character.HumanoidRootPart.CFrame=player.Character.HumanoidRootPart.CFrame*CFrame.new(0,speed,0)
    end
end)