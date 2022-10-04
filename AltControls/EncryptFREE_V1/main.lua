getgenv().Settings = {
    host = 3060750467,
    prefix = "/",
    admsg = "free control goated",
    fps = 5
}

getgenv().Alts = {
    2998956552,
    3060735945,
}

repeat wait() until game:IsLoaded()
wait(1)

loadstring(game:HttpGet("https://raw.githubusercontent.com/freecontrolreal/real/main/modules/module.lua"))()
local player = game:service"Players".LocalPlayer
local ishost = false
if player.UserId == Settings['host'] then
    ishost = true
else
    pcall(function() setfpscap(Settings['fps']) end)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/freecontrolreal/real/main/modules/render.lua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/freecontrolreal/real/main/modules/gfx_v1.lua"))()
end

local toggles = {
    Dropping = false,
    Cdropping = false,
}
local cache = {
    CustomDropGoal = 0,
    CustomCurrent = 0
}

game:service"RunService".Stepped:Connect(function()
    if toggles['Dropping'] == true or toggles['Cdropping'] == true then
        game:service"ReplicatedStorage".MainEvent:FireServer("DropMoney",10000)
        game:service"ReplicatedStorage".MainEvent:FireServer("Block",true)
    end
end)

workspace.Ignored.Drop.ChildAdded:Connect(function(item)
    repeat wait() until item.Parent ~= nil
    if toggles['Cdropping'] == true then
        local a = item.BillboardGui.TextLabel.Text:gsub("%,",""):gsub("%$","")
        cache['CustomCurrent'] = cache['CustomCurrent'] + tonumber(a)
        print(cache['CustomCurrent'])
        if cache['CustomCurrent'] >= cache['CustomDropGoal'] then
            toggles['Cdropping'] = false
            saymsg("finished")
            wait(1)
            game:service"ReplicatedStorage".MainEvent:FireServer("Block",false)
        end
    end
end)

local function cmds(msg, plr)
    if ishost == false then
        local host = game:service"Players":GetPlayerByUserId(plr)
        if host then
            if msg:lower() == Settings['prefix'].."bring" then
                player.Character.HumanoidRootPart.Anchored = false
                player.Character.HumanoidRootPart.CFrame = host.Character.HumanoidRootPart.CFrame*CFrame.new(0,5,0)
            elseif msg:lower() == Settings['prefix'].."reset" then
                for i,v in pairs(player.Character:GetChildren()) do
                    if v:IsA("BasePart") or v:IsA("MeshPart") then
                        v:Destroy()
                    end
                end
            elseif msg:lower() == Settings['prefix'].."airlock" then
                player.Character.HumanoidRootPart.Anchored = false
                if workspace:FindFirstChild("AirLocked") then
                    workspace:FindFirstChild("AirLocked"):Destroy()
                end
                local Part = Instance.new("Part",workspace)
                Part.Name = "AirLocked"
                Part.Size = Vector3.new(5,1,5)
                Part.CFrame = player.Character.HumanoidRootPart.CFrame*CFrame.new(0,8,0)
                Part.Anchored = true
                player.Character.HumanoidRootPart.CFrame=workspace:FindFirstChild("AirLocked").CFrame*CFrame.new(0,8.5,0)
                wait(.5)
                player.Character.HumanoidRootPart.Anchored = true
            elseif msg:lower() == Settings['prefix'].."lock" then
                player.Character.HumanoidRootPart.Anchored = true
            elseif msg:lower() == Settings['prefix'].."unlock" then
                player.Character.HumanoidRootPart.Anchored = false
                if workspace:FindFirstChild("AirLocked") then
                    workspace:FindFirstChild("AirLocked"):Destroy()
                end
            elseif msg:lower() == Settings['prefix'].."drop" then
                toggles['Dropping'] = true
            elseif msg:lower() == Settings['prefix'].."stop" then
                toggles['Dropping'] = false
                toggles['Cdropping'] = false
                wait(1)
                game:service"ReplicatedStorage".MainEvent:FireServer("Block",false)
            elseif msg:lower() == Settings['prefix'].."pd" then
                local data = GetCurrentPD()
                saymsg(conversion(data))
            elseif msg:lower() == Settings['prefix'].."god" then
                if player.Character.BodyEffects:FindFirstChild("Attacking") then
                    player.Character.BodyEffects:FindFirstChild("Attacking"):Destroy()
                end
                saymsg("Godmode is now active.")
            end
            local oldmsg = msg:lower()
            msg = msg:lower():split(" ")
            if msg[1] then
                if msg[1] == Settings['prefix'].."cdrop" then
                    cache['CustomDropGoal'] = 0
                    cache['CustomCurrent'] = 0
                    local data = Converter(msg[2])
                    if data == "error" then
                        return saymsg("Argument is invalid.")
                    end
                    cache['CustomDropGoal'] = tonumber(data)
                    toggles['Cdropping'] = true
                    saymsg("Started")
                elseif msg[1] == Settings['prefix'].."setup" then
                    local data = setup(msg[2])
                    if data == "error" then
                        saymsg("Invalid setup.")
                    end
                elseif msg[1] == Settings['prefix'].."form" then
                    local data = formatalts(msg[2],host.Character.HumanoidRootPart)
                    if data == "error" then
                        saymsg("Invalid form type.")
                    end
                elseif msg[1] == Settings['prefix'].."crash" then
                    if Alts[1] == player.UserId or Alts[2] == player.UserId or Alts[3] == player.UserId then
                        if msg[2] == "encrypt" then
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/LPrandom/lua-projects/master/dahoodcrasher.lua"))()
                        elseif msg[2] == "swag" then
                            loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SuperCustomServerCrasher'))()
                        else
                            saymsg("Unknown crash method.")
                        end
                    end
                end
            end
        end
    end
end

game:service"ReplicatedStorage".DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(data) 
    local user_id = game:service"Players"[data.FromSpeaker].UserId
    local msg = data.Message
    if user_id == Settings['host'] then
        cmds(msg, user_id)
    end
end)