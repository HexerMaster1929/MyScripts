loadstring(game:HttpGet("https://raw.githubusercontent.com/HexerMaster1929/HexHub/main/UI/Notification%20(Public%20For%20Exploit%20Makers).lua"))()

HexNotification("HexHub","Loading Fonts (May Take a While) ","rbxassetid://10780606226","904856168")

wait(math.random(2,7))

settings = {
	FontDirectory = game.Players.LocalPlayer.PlayerGui;
	FontType = ""
}

local TextObjects = {}


function CheckChildren(obj)
	for i, GC in pairs(obj:GetChildren()) do
		if GC:IsA("TextLabel") or GC:IsA("TextBox") or GC:IsA("TextButton") then
			table.insert(TextObjects,GC)
		end
		CheckChildren(GC)
	end
end







-------------------------------------------------------------------------------------------------------------



local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/HexerMaster1929/HexHub/main/UI/UILIB.lua"))()

local Window = Library.CreateLib("hexHub ~ Font Changer Beta", "HexHub")

local FontTab = Window:NewTab("Font Changer")

local FontSection = FontTab:NewSection("Fonts")

FontSection:NewDropdown("Change Fonts In", "Chenges font in selected Directory", {"Workspace", "CoreGui", "PlayerGui"}, function(SetDir)
	if SetDir == "PlayerGui" then
		settings.FontDirectory = game.Players.LocalPlayer.PlayerGui
		elseif SetDir == "CoreGui" then
		settings.FontDirectory = game.CoreGui
	elseif SetDir == "Workspace" then
		settings.FontDirectory = game.Workspace
	end
	HexNotification("HexHub","Font Change Directory Set to "..SetDir,"rbxassetid://10780606244","904856168")
	end)

FontSection:NewDropdown("Font", "Selected Font", {"Legacy", "Arial", "SourceSans", "Bodoni", "Garamond", "Cartoon", "Code", "Highway", "SciFi", "Arcade", "Fantasy", "Antique", "Gotham", "GothamBold", "GothamBlack","AmaticSC", "Bangers", "Creepster", "DenkOne", "Fondamento", "FredokaOne", "GrenzeGotisch", "IndieFlower", "JosefinSans", "Jura", "Kalam", "LuckiestGuy", "PermanentMarker", "Nunito",  }, function(SetFont)
	settings.FontType = SetFont
	HexNotification("HexHub","Font Set to "..SetFont,"rbxassetid://10780606244","904856168")
end)

FontSection:NewButton("Apply Fonts", "Applies Fonts", function()

CheckChildren(settings.FontDirectory)

	for i = 1, #TextObjects do
		TextObjects[i].Font = settings.FontType
		end
		HexNotification("Changed Fonts","Changed Fonts To "..settings.FontType,"rbxassetid://10780606244","904856168")
		
end)

HexNotification("HexHub","Hexhub Loaded! Enjoy!","rbxassetid://10780606244","904856168")
