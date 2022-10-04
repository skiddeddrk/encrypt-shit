function RandomLetterGen(length)
    local data = ''
    for i=1,tonumber(length) do
        data = data..''..string.char(math.random(97, 122))
    end
    return data
end

function FormatNumToStyle(arg)
    return tostring(arg):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end

function Converter(arg)
    local possible_chars = {k=1000,m=1000000,b=1000000000}
    for i,v in pairs(possible_chars) do
        if arg:lower():find(i) then
            local ans = nil
            local s,e = pcall(function()
                local a = arg:lower():gsub(i,"")
                ans = a*v
            end)
            if not e then
                return ans
            else
                return false
            end
        end
    end
    if not tonumber(arg) then
        return "error"
    else 
        return tonumber(arg)
    end
end

function saymsg(msg)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg,"All")
end

function GetCurrentPD()
    local amt = 0
    for i,v in pairs(workspace.Ignored.Drop:GetChildren()) do
        if v:IsA("Part") and v.Name == "MoneyDrop" then
            local a = v.BillboardGui.TextLabel.Text:gsub("%,",""):gsub("%$","")
            amt = amt + tonumber(a)
        end
    end
    return amt
end

function conversion(num)
    local ans = nil
    if string.len(num) == 4 then
        ans = string.sub(num,1,1).."."..string.sub(num,2,2).."K"
    elseif string.len(num) == 5 then
        ans = string.sub(num,1,2).."."..string.sub(num,3,4).."K"
    elseif string.len(num) == 6 then
        ans = string.sub(num,1,3).."."..string.sub(num,4,5).."K"
    elseif string.len(num) == 7 then
        ans = string.sub(num,1,1).."."..string.sub(num,2,3).."M"
    elseif string.len(num) == 8 then
        ans = string.sub(num,1,2).."."..string.sub(num,3,4).."M"
    elseif string.len(num) == 9 then
        ans = string.sub(num,1,3).."."..string.sub(num,4,5).."M"
    elseif string.len(num) == 10 then
        ans = string.sub(num,1,1).."."..string.sub(num,2,3).."B"
    else
        ans = num
    end
    return ans
end

function CheckPlrOnline(arg)
    for i,v in pairs(game:service"Players":GetChildren()) do
        if v.UserId == tonumber(arg) then
            return true
        end
    end
    return false
end

function ReFormAlts()
    local n = {}
    for i,v in pairs(Alts) do
        if CheckPlrOnline(v) == true then
            table.insert(n,v)
        end
    end
    return n
end

local cords = loadstring(game:HttpGet("https://raw.githubusercontent.com/freecontrolreal/real/main/modules/cords.lua"))()
if not cords then
    print("Error with loading cords.")
end
function DetermineArea(arg)
    if arg:lower() == "admin" then
        return cords['Setup']['Admin']
    elseif arg:lower() == "bank" then
        return cords['Setup']['Bank']
    elseif arg:lower() == "train" then
        return cords['Setup']['Train']
    else
        return "Error Not Found"
    end
end

function setup(area)
    local listofcords = DetermineArea(area)
    if type(listofcords) ~= 'table' then
        return "error"
    end
    local alts = ReFormAlts()
    for i,v in pairs(alts) do
        if v == game:service"Players".LocalPlayer.UserId then
            game:service"Players".LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(listofcords[i]:split(",")[1],listofcords[i]:split(",")[2],listofcords[i]:split(",")[3])
        end
    end
end

function DetermineFormat(arg)
    if arg:lower() == "line" then
        return cords['Custom']['Line']
    elseif arg:lower() == "surround" then
        return cords['Custom']['Surround']
    else
        return "error"
    end
end

function formatalts(typeof,anchor)
    local listofcords = DetermineFormat(typeof)
    if type(listofcords) ~= 'table' then
        return "error"
    end
    local alts = ReFormAlts()
    for i,v in pairs(alts) do
        if v == game:service"Players".LocalPlayer.UserId then
            local x,y,z = listofcords[i]:split(",")[1],listofcords[i]:split(",")[2],listofcords[i]:split(",")[3]
            game:service"Players".LocalPlayer.Character.HumanoidRootPart.CFrame = anchor.CFrame*CFrame.new(x,y,z)
        end
    end
end