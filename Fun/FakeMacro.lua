local Crouch = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid'):LoadAnimation(game:GetService("ReplicatedStorage").ClientAnimations.Crouching)
getgenv().keytoggle = "q"
getgenv().maxspeed = 500
local player = game.Players.LocalPlayer
player:GetMouse().KeyDown:Connect(function(key)
    if key == keytoggle then
        Crouch.Looped = true
        Crouch:Play()
        game.Players.LocalPlayer.Character.Humanoid.Name = "Humanoid2"
        game.Players.LocalPlayer.Character.Humanoid2.WalkSpeed = maxspeed
    end
end)
player:GetMouse().KeyUp:Connect(function(key)
    if key == keytoggle then
        Crouch:Stop()
        game.Players.LocalPlayer.Character.Humanoid2.WalkSpeed = 16
        game.Players.LocalPlayer.Character.Humanoid2.Name = "Humanoid"
    end
end)
game.StarterGui:SetCore("SendNotification",{
    Title = "Excuted";
    Text = "Success";
    Duration = 5;
})