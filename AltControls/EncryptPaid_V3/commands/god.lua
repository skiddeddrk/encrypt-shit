if GOD_LOADED == true then return end
getgenv().GOD_LOADED = true

function GodCmd()
    if game:service"Players".LocalPlayer.Character.BodyEffects:FindFirstChild("Attacking") then
        game:service"Players".LocalPlayer.Character.BodyEffects:FindFirstChild("Attacking"):Destroy()
    end
    Say("God enabled.")
end