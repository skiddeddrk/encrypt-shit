if not game:IsLoaded() then
    game.Loaded:Wait()
end
game.StarterGui:SetCore("SendNotification",{
    Title = "Loading please wait...";
    Text = "ESP loading...";
    Duration = 10;
})
repeat wait() until workspace.Players:FindFirstChild(game.Players.LocalPlayer.Name)
game.StarterGui:SetCore("SendNotification",{
    Title = "Loaded!";
    Text = "ESP!";
    Duration = 10;
})

local key = "v"
local toggle = false
local player = game:service"Players".LocalPlayer

local function CreateESP(target)
    if not game:service"Players"[target].Character.UpperTorso:FindFirstChild("BillboardGui") then
        local MainPart = Instance.new("BillboardGui",game:service"Players"[target].Character.UpperTorso)
        local SecondaryPart = Instance.new("TextLabel",MainPart)
        MainPart.StudsOffset = Vector3.new(0,-.5,0)
        MainPart.AlwaysOnTop = true    
        MainPart.Size = UDim2.new(5,0,1,0)
        SecondaryPart.BackgroundTransparency = 1
        SecondaryPart.TextStrokeColor3 = Color3.fromRGB(0,0,0)
        SecondaryPart.TextStrokeTransparency = 0
        SecondaryPart.Size = UDim2.new(0,150,0,20)
        SecondaryPart.TextColor3 = Color3.fromRGB(255,255,255)
        SecondaryPart.Font = Enum.Font.SourceSansSemibold
        SecondaryPart.Name = "NameOfBozo"
        SecondaryPart.TextSize = 20
        SecondaryPart.Text = "[ "..target.." ]"
    end
end

game:service"RunService".Stepped:Connect(function()
    if toggle == true then
        for i,v in pairs(game:service"Players":GetChildren()) do
            if v.Name ~= player.Name then
                CreateESP(v.Name)
            end
        end
    else
        for i,v in pairs(game:service"Players":GetChildren()) do
            if v.Name ~= player.Name then
                if game:service"Players"[v.Name].Character.UpperTorso:FindFirstChild("BillboardGui") then
                    game:service"Players"[v.Name].Character.UpperTorso:FindFirstChild("BillboardGui"):Destroy()
                end
            end
        end
    end
end)

player:GetMouse().KeyDown:Connect(function(k)
    if k:lower() == key:lower() then
        if toggle == false then
            toggle = true
        else
            toggle = false
        end
    end
end)