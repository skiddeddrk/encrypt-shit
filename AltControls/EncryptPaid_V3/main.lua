-- removed the whitelist part.

getgenv().Settings = {
    host = 1234567,
    prefix = '/',
    admsg = 'wsg',
    fps = 3
}

getgenv().Alts = {
    1234567,
    1234567,
    1234567,
    1234567,
    1234567,
}

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local player = game:service"Players".LocalPlayer
local ishost = false
if Settings['host'] == player.UserId then
    ishost = true
else
    ishost = false
    pcall(function() setfpscap(Settings['fps']) end)
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    
    ScreenGui.Parent = game:service"CoreGui"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    Frame.Parent = ScreenGui
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
    Frame.BorderColor3 = Color3.fromRGB(11, 11, 11)
    Frame.BorderSizePixel = 100
    Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    Frame.Size = UDim2.new(1, 0, 1, 0)
    
    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Position = UDim2.new(0.416597515, 0, 0.461769104, 0)
    TextLabel.Size = UDim2.new(0, 200, 0, 50)
    TextLabel.Font = Enum.Font.GothamMedium
    TextLabel.Text = game:service"Players".LocalPlayer.Name
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 30.000
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fzW2s/1SvY/main/modules/lowgfx.lua"))()
end
game:service"Players".LocalPlayer.Idled:Connect(function()
    game:service"VirtualUser":Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:service"VirtualUser":Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/fzW2s/1SvY/main/modules/anticheat.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/fzW2s/1SvY/main/modules/package.lua"))()

-- env handlers
--cmds
local GithubUrl = 'https://raw.githubusercontent.com/fzW2s/1SvY/main/cmds/'
getgenv().BRING_LOADED = false
getgenv().DROP_LOADED = false
getgenv().STOP_LOADED = false
getgenv().AIRLOCK_LOADED = false
getgenv().LOCK_LOADED = false
getgenv().UNLOCK_LOADED = false
getgenv().RESET_LOADED = false
getgenv().GOD_LOADED = false
getgenv().CDROP_LOADED = false
getgenv().TP_LOADED = false
getgenv().SETUP_LOADED = false
getgenv().FPS_LOADED = false
getgenv().ALTS_LOADED = false
getgenv().DUPE_LOADED = false
getgenv().WALLET_LOADED = false
getgenv().CRASH_LOADED = false
getgenv().SAY_LOADAED = false
getgenv().ADNEW_LOADED = false
getgenv().AD_LOADED = false
getgenv().LOOPDESTROY_LOADED = false
getgenv().MASK_LOADED = false

--togglse
getgenv().CDROPPINGNOW = false

local function cmds(msg, plr)
    if ishost == false then
        local host = game:service"Players":GetPlayerByUserId(plr)
        if msg:lower() == Settings['prefix']..'bring' then
            if BRING_LOADED == false then
                loadstring(game:HttpGet(GithubUrl.."bring.lua"))()
            end
            BringCmd(plr)
        elseif msg:lower() == Settings['prefix']..'drop' then
            if DROP_LOADED == false then
                loadstring(game:HttpGet(GithubUrl.."drop.lua"))()
            end
            DropCmd()
        elseif msg:lower() == Settings['prefix']..'stop' then
            if STOP_LOADED == false then
                loadstring(game:HttpGet(GithubUrl.."stop.lua"))()
            end
            StopCmd()
        elseif msg:lower() == Settings['prefix']..'airlock' then
            if AIRLOCK_LOADED == false then
                loadstring(game:HttpGet(GithubUrl.."airlock.lua"))()
            end
            AirlockCmd()
        elseif msg:lower() == Settings['prefix']..'lock' then
            if LOCK_LOADED == false then
                loadstring(game:HttpGet(GithubUrl.."lock.lua"))()
            end
            LockCmd()
        elseif msg:lower() == Settings['prefix']..'unlock' then
            if UNLOCK_LOADED == false then
                loadstring(game:HttpGet(GithubUrl.."unlock.lua"))()
            end
            UnlockCmd()
        elseif msg:lower() == Settings['prefix']..'reset' then
            if RESET_LOADED == false then
                loadstring(game:HttpGet(GithubUrl.."reset.lua"))()
            end
            ResetCmd()
        elseif msg:lower() == Settings['prefix']..'god' then
            if GOD_LOADED == false then
                loadstring(game:HttpGet(GithubUrl.."god.lua"))()
            end
            GodCmd()
        end
        local oldmsg = msg
        msg = msg:lower():split(" ")
        if msg[1] and msg[2] then
            if msg[1] == Settings['prefix']..'cdrop' then
                if CDROP_LOADED == false then
                    loadstring(game:HttpGet(GithubUrl.."cdrop.lua"))()
                end
                local data = CdropCmd(msg[2])
                if data == 'error' then
                    Say("Error!")
                end
            elseif msg[1] == Settings['prefix']..'tp' then
                if player.UserId == Alts[1] then
                    if TP_LOADED == false then
                        loadstring(game:HttpGet(GithubUrl.."tp.lua"))()
                    end
                    TpCmd(msg[2],msg[3])
                end
            elseif msg[1] == Settings['prefix']..'setup' then
                if SETUP_LOADED == false then
                    loadstring(game:HttpGet(GithubUrl.."setup.lua"))()
                end
                SetupCmd(msg[2])
            elseif msg[1] == Settings['prefix']..'fps' then
                if FPS_LOADED == false then
                    loadstring(game:HttpGet(GithubUrl.."fps.lua"))()
                end
                FpsCmd(msg[2])
            elseif msg[1] == Settings['prefix']..'alts' then
                if ALTS_LOADED == false then
                    loadstring(game:HttpGet(GithubUrl.."alts.lua"))()
                end
                AltsCmd(msg[2],plr)
            elseif msg[1] == Settings['prefix']..'dupe' then
                if DUPE_LOADED == false then
                    loadstring(game:HttpGet(GithubUrl.."dupe.lua"))()
                end
                DupeCmd(msg[2])
            elseif msg[1] == Settings['prefix']..'wallet' then
                if WALLET_LOADED == false then
                    loadstring(game:HttpGet(GithubUrl.."wallet.lua"))()
                end
                WalletCmd(msg[2])
            elseif msg[1] == Settings['prefix']..'crash' then
                if player.UserId == Alts[1] or player.UserId == Alts[2] or player.UserId == Alts[3] then
                    if CRASH_LOADED == false then
                        loadstring(game:HttpGet(GithubUrl.."crash.lua"))()
                    end
                    CrashCmd(msg[2])
                end
            elseif msg[1] == Settings['prefix']..'say' then
                if SAY_LOADAED == false then
                    loadstring(game:HttpGet(GithubUrl.."say.lua"))()
                end
                SayMsg(oldmsg)
            elseif msg[1] == Settings['prefix']..'ad' then
                if AD_LOADED == false then
                    loadstring(game:HttpGet(GithubUrl.."ad.lua"))()
                end
                AdCmd(msg[2])
            elseif msg[1] == Settings['prefix']..'adnew' then
                if ADNEW_LOADED == false then
                    loadstring(game:HttpGet(GithubUrl.."adnew.lua"))()
                end
                AdnewCmd(msg[2])
            elseif msg[1] == Settings['prefix']..'loopdestroy' then
                if LOOPDESTROY_LOADED == false then
                    loadstring(game:HttpGet(GithubUrl.."loopdestroy.lua"))()
                end
                LoopdestroyCmd(msg[2])
            elseif msg[1] == Settings['prefix']..'mask' then
                if MASK_LOADED == false then
                    loadstring(game:HttpGet(GithubUrl.."mask.lua"))()
                end
                MaskCmd(msg[2])
            end
        end
    end
end

game:service"ReplicatedStorage".DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(data) 
    local user = data.FromSpeaker
    local msg = data.Message
    if Settings['host'] == game:service"Players"[user].UserId then
        cmds(msg, game:service"Players"[user].UserId)
    end
end)