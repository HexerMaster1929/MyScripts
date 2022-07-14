local SupportedGamesJSON = game:GetService("HttpService"):JSONDecode(game:HttpGet('https://raw.githubusercontent.com/RandomAdamYT/DarkHub_V4/main/SupportedGames',true))
local GitHubBase = 'https://raw.githubusercontent.com/RandomAdamYT/DarkHub_V4/main/'

function IsSupported()
    for i,v in pairs(SupportedGamesJSON) do
        if v == game.GameId then
            return true    
        end
    end
    return false
end

task.spawn(function()
    if IsSupported() then
        for i,v in pairs(SupportedGamesJSON) do
            if v == game.GameId then
                loadstring(game:HttpGet(GitHubBase..i,true))()
                return
            end
        end
    else
        loadstring(game:HttpGet(GitHubBase..'Universal',true))()
    end
end)
