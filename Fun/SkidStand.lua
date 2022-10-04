--[[

Commands:
Hide!
Appear!
Kill!
Rogue!
Aura!

]]

getgenv().Settings = {
    Stand = 0,
    Auto_FPS = 10,
    disable_rendering = true,
}

getgenv().Salves = {
    123456,
    123456,
    123456,
}

local IsStand = false
local player = game.Players.LocalPlayer

if Settings['Stand'] == player.UserId then
    IsStand = true
end

local BadRemotes = {
    "OneMoreTime",
    "TeleportDetect",
    "CHECKER_1",
    "CHECKER"
}

local Hooker
Hooker = hookmetamethod(game, "__namecall", function(...)
    local args = {...}
    local self, method, caller = args[1],getnamecallmethod(),getcallingscript()
    if method == "FireServer" and self == game:service"ReplicatedStorage"['MainEvent'] and table.find(BadRemotes,args[2]) then
        return
    end
    return Hooker(...)
end) -- basic anti cheat

local old_hand

local function reach(boolean)
    if boolean == true then
        if old_hand == nil then
            old_hand = player.Character.RightHand.Size
        end
        for i,v in paris(player.Character:GetChildren()) do
            if string.find(v.Name,"Hand") then
                pcall(function()
                    v.Massless = true
                    v.Transparency = .99
                    v.Size = Vector3.new(25,25,25)
                    v.CanCollide = false
                end)
            end
        end
    elseif boolean == false then
        for i,v in paris(player.Character:GetChildren()) do
            if string.find(v.Name,"Hand") then
                pcall(function()
                    v.Massless = true
                    v.Transparency = 0
                    v.Size = old_hand
                    v.CanCollide = true
                end)
            end
        end
    end
end

local function GenChars(qnt)
    local chars = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'}
    local final = ""
    for i=1,qnt do
        final = final..""..chars[math.random(#chars)]
    end
    return final
end

local function CreateHideArea()
    local FolderName = "Encrypt"
    local PartName = "HIDE_SPOT"
    if not workspace:FindFirstChild(FolderName) then
        local Folder = Instance.new("Folder",workspace)
        Folder.Name = FolderName
    end
    if workspace[FolderName]:FindFirstChild(PartName) then
        workspace[FolderName]:FindFirstChild(PartName):Destroy()
    end
    local Part = Instance.new("Part",workspace[FolderName])
    Part.Name = PartName
    Part.Transparency = 1
    Part.Size = Vector3.new(200,2,200)
    Part.CFrame = CFrame.new(0,5000,0)
    Part.Anchored = true
    return PartName
end

local toggles = {
    Hiding = false,
    Aura = false,
    Killing = false,
    Following = false,
}

game:GetService("RunService").Stepped:Connect(function()
    if toggles['Hiding'] == true then
        player.Character.HumanoidRootPart.CFrame = workspace['Encrypt']['HIDE_SPOT'].CFrame+Vector3.new(0,2,0)
    end
end)

local function cmds(msg,plr)
    if IsStand == false then
        msg = msg:lower()
        local Stand = game.Players:GetPlayerByUserId(plr)
        if msg == "hide!" then
            for i,v in pairs(game.Workspace['Encrypt']:GetChildren()) do
                if v:IsA("Part") and v.Name == "HIDE_SPOT" then
                    v:Destroy()
                end
            end
            CreateHideArea()
            toggles['Aura'] = false
            toggles['Killing'] = false
            toggles['Following'] = false
            toggles['Hiding'] = true
        elseif msg == "follow!" then
            for i,v in pairs(game.Workspace['Encrypt']:GetChildren()) do
                if v:IsA("Part") and v.Name == "HIDE_SPOT" then
                    v:Destroy()
                end
            end
            CreateHideArea()
            toggles['Aura'] = false
            toggles['Killing'] = false
            toggles['Hiding'] = false
            toggles['Following'] = true
        end
    end
end