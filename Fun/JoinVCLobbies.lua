repeat wait(0.001) until game:IsLoaded()
game:service"StarterGui":SetCore("SendNotification",{
    Title = "Loading...";
    Text = "Please wait...";
    Duration = 10;
})
repeat wait(0.001) until workspace.Players:FindFirstChild(game.Players.LocalPlayer.Name)
local player, mainid = game:service"Players".LocalPlayer, 8195210
player.UserId = mainid
game:service"StarterGui":SetCore("SendNotification",{
    Title = 'Ready!';
    Text = 'Attempting to join a VC server...';
    Duration = 10;
})
game:service"ReplicatedStorage".MainEvent:FireServer("JoinVCServer")