if not game:IsLoaded() then
    game.Loaded:Wait()
end
game:service"StarterGui":SetCore("SendNotification",{
    Title = "Encrypt Crash";
    Text = "Loading...";
    Duration = 10;
})
repeat wait(0.001) until workspace.Players:FindFirstChild(game:service"Players".LocalPlayer.Name)
game:service"StarterGui":SetCore("SendNotification",{
    Title = "Encrypt Crash";
    Text = "Added /lowgfx command and auto retry on crew crash, and a time left counter.";
    Duration = 10;
})

game:service"Players".LocalPlayer.Idled:Connect(function()
    game:service"VirtualUser":Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:service"VirtualUser":Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local EncryptCrash = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Frame_3 = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local TextButton = Instance.new("TextButton")
local TextButton_2 = Instance.new("TextButton")

EncryptCrash.Name = "EncryptCrash"
EncryptCrash.Parent = game.CoreGui
EncryptCrash.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = EncryptCrash
Frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Frame.BorderColor3 = Color3.fromRGB(22, 22, 22)
Frame.Position = UDim2.new(0.298755199, 0, 0.470764607, 0)
Frame.Size = UDim2.new(0, 208, 0, 104)
Frame.Active = true
Frame.Draggable = true

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.Size = UDim2.new(0, 208, 0, 15)

TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(0, 208, 0, 15)
TextLabel.Font = Enum.Font.Gotham
TextLabel.Text = "Encrypt Crash"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 16.000

Frame_3.Parent = Frame
Frame_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_3.BackgroundTransparency = 1.000
Frame_3.Position = UDim2.new(0.0430000015, 0, 0.217846215, 0)
Frame_3.Size = UDim2.new(0, 189, 0, 77)

UIListLayout.Parent = Frame_3
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 6)

TextButton.Parent = Frame_3
TextButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.Size = UDim2.new(0, 188, 0, 34)
TextButton.Font = Enum.Font.Gotham
TextButton.Text = "Start V1 SprayCan"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 20.000
TextButton.MouseButton1Click:Connect(function()
    EncryptCrash:Destroy()
    local CrewCrash = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local Frame_2 = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local Frame_3 = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local TextLabel_2 = Instance.new("TextLabel")

    CrewCrash.Name = "CrewCrash"
    CrewCrash.Parent = game.CoreGui
    CrewCrash.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Parent = CrewCrash
    Frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    Frame.BorderColor3 = Color3.fromRGB(22, 22, 22)
    Frame.Position = UDim2.new(0.298755199, 0, 0.470764607, 0)
    Frame.Size = UDim2.new(0, 208, 0, 104)
    Frame.Active = true
    Frame.Draggable = true

    Frame_2.Parent = Frame
    Frame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame_2.Size = UDim2.new(0, 208, 0, 15)

    TextLabel.Parent = Frame_2
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Position = UDim2.new(-0.00480769249, 0, 0, 0)
    TextLabel.Size = UDim2.new(0, 208, 0, 15)
    TextLabel.Font = Enum.Font.Gotham
    TextLabel.Text = "Crew Crash"
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 16.000

    Frame_3.Parent = Frame
    Frame_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_3.BackgroundTransparency = 1.000
    Frame_3.Position = UDim2.new(0.0430000015, 0, 0.217846215, 0)
    Frame_3.Size = UDim2.new(0, 189, 0, 77)

    UIListLayout.Parent = Frame_3
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 6)

    local amt = 0
    local max = 1250
    local m = 200

    TextLabel_2.Parent = Frame_3
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.BackgroundTransparency = 1.000
    TextLabel_2.Position = UDim2.new(0.0502645485, 0, 0, 0)
    TextLabel_2.Size = UDim2.new(0, 189, 0, 17)
    TextLabel_2.Font = Enum.Font.Gotham
    TextLabel_2.Text = "Items: "..tostring(amt).."/"..tostring(max)
    TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.TextSize = 16.000
    TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
    local TextLabel_3 = Instance.new("TextLabel")
    TextLabel_3.Parent = Frame_3
    TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_3.BackgroundTransparency = 1.000
    TextLabel_3.Position = UDim2.new(0.0502645485, 0, 0, 0)
    TextLabel_3.Size = UDim2.new(0, 189, 0, 17)
    TextLabel_3.Font = Enum.Font.Gotham
    TextLabel_3.Text = "TL: Calculating..."
    TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_3.TextSize = 16.000
    TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
    local going = false
    local function Crash()
        if game:service"Players".LocalPlayer.Character.BodyEffects:FindFirstChild("Attacking") then
            game:service"Players".LocalPlayer.Character.BodyEffects:FindFirstChild("Attacking"):Destroy()
        end
        local g, groups = {},game:service"GroupService":GetGroupsAsync(game:service"Players".LocalPlayer.UserId)
        for i,v in pairs(groups) do
            table.insert(g,v.Id)
        end
        if not g[1] then
            game:service"StarterGui":SetCore("SendNotification",{
                Title = "Error!";
                Text = "Please be atleast in 1 group.";
                Duration = 10;
            })
            return
        end
        pcall(function()
            game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Crew.CrewFrame:Destroy()
        end)
        local SelectedId = g[math.random(#g)]
        if game:service"Players".LocalPlayer.Backpack:FindFirstChild("[SprayCan]") then
            game:service"Players".LocalPlayer.Backpack:FindFirstChild("[SprayCan]").Parent = game:service"Players".LocalPlayer.Character
        end
        game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
        game:service"Players".LocalPlayer.Backpack.ChildAdded:Connect(function(item)
            if item.Name == "[SprayCan]" then
                repeat wait(0.001) until item.Parent ~= nil
                item:FindFirstChild("Handle").Transparency = 100
                item.Parent = game:service"Players".LocalPlayer.Character
                amt = amt + 1
                TextLabel_2.Text = "Items: "..tostring(amt).."/"..tostring(max)
                if amt >= max then
                    going = false
                    local LP = game:service"Players".LocalPlayer
                    LP.Character.Humanoid.Health = 0
                    for i,v in pairs(LP.Character:GetChildren()) do
                        if v:IsA("BasePart") or v:IsA("MeshPart") or v.Name == "HumanoidRootPart" then
                            v:Destroy()
                        end
                    end
                end
            end
        end)
        going = true
        local old = amt
        coroutine.resume(coroutine.create(function()
            while wait(1) do
                if going then
                    local n = amt - old
                    local c = max - amt
                    local g = math.floor(c/n)
                    local m_ = math.floor(g/60)
                    old = amt
                    if m_ <= 0 then
                        if g == 0 then
                            TextLabel_3.Text = "TL: Done."
                        else
                            if g == 1 then
                                TextLabel_3.Text = "TL: "..tostring(g).." second left"
                            else
                                TextLabel_3.Text = "TL: "..tostring(g).." seconds left"
                            end
                        end
                    else
                        if m_ == 1 then
                            TextLabel_3.Text = "TL: "..tostring(m_).." minute left"
                        else
                            TextLabel_3.Text = "TL: "..tostring(m_).." minutes left"
                        end
                    end
                end
            end
        end))
        coroutine.resume(coroutine.create(function()
            while wait(0.000001) do
                if going then
                    game:service"ReplicatedStorage".MainEvent:FireServer("JoinCrew",tostring(SelectedId))
                end
            end
        end))
    end
    Crash()
    game:service"Players".LocalPlayer.CharacterAdded:Connect(function()
        game:service"StarterGui":SetCore("SendNotification",{
            Title = "Failed!";
            Text = "Retrying...";
            Duration = 5;
        })
        wait(6.5)
        game:service"StarterGui":SetCore("SendNotification",{
            Title = "Status!";
            Text = "Restarting...";
            Duration = 5;
        })
        amt = 0
        max = max + m
        m = m + 100
        Crash()
    end)
end)

TextButton_2.Parent = Frame_3
TextButton_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.Size = UDim2.new(0, 188, 0, 34)
TextButton_2.Font = Enum.Font.Gotham
TextButton_2.Text = "Start V2 OldCrash"
TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.TextSize = 20.000
TextButton_2.MouseButton1Click:Connect(function()
    EncryptCrash:Destroy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LPrandom/lua-projects/master/legacy/OldCrash.lua"))()
end)

game:service"Players".LocalPlayer.Chatted:Connect(function(msg)
    if msg:lower() == "/lowgfx" then
        settings().Physics.PhysicsEnvironmentalThrottle = 1
        settings().Rendering.QualityLevel = 'Level01'
        UserSettings():GetService("UserGameSettings").MasterVolume = 0
        for i,v in pairs(game:GetDescendants()) do
            if v:IsA("Part") then
                v.Material = Enum.Material.Pavement
                v.Transparency = 1
            elseif v:IsA("Decal") then
                v:Destroy()
            elseif v:IsA("Texture") then
                v:Destroy()
            elseif v:IsA("MeshPart") then
                v.TextureID = 0
                v.Transparency = 1
            elseif v.Name == "Terrian" then
                v.WaterReflectace = 1
                v.WaterTransparency = 1
            elseif v:IsA("SpotLight") then
                v.Range = 0
                v.Enabled = false
            elseif v:IsA("WedgePart") then
                v.Transparency = 1
            elseif v:IsA("UnionOperation") then
                v.Transparency = 1
            end
        end
    end
end)