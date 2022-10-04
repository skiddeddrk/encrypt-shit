if not game:IsLoaded() then
	game.Loaded:Wait()
end
repeat wait() until workspace.Players:FindFirstChild(game.Players.LocalPlayer.Name)
game.ReplicatedStorage.MainEvent:FireServer("JoinCrew",11234777)