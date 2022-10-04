local plr = game:service"Players".LocalPlayer
local backpack, character = plr.Backpack, plr.Character

game:service"RunService".Stepped:Connect(function()
    game:service"RunService".Stepped:Connect(function()
        if plr.Backpack:FindFirstChild("Wallet") then
            plr.Backpack:FindFirstChild("Wallet").Parent = character
        else
            plr.Character:FindFirstChild("Wallet").Parent = backpack
        end
    end)
end)