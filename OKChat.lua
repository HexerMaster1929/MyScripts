local Succ,Err = pcall(function()
	local chat = {}
	
	if game.TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		error("TextChat Chatsystem Not Supported By OKChat Bar")
	end

print("Loading chat module")

	local wfc			=game.WaitForChild
	local ffc			=game.FindFirstChild
	local ud2			=UDim2.new
	local ceil			=math.ceil
	local cf			=CFrame.new
	local v3			=Vector3.new
	local color			=Color3.new
	local dot			=Vector3.new().Dot
	local workspace		=workspace
	local ray			=Ray.new
	local new			=Instance.new
	local rtype			=game.IsA
	local debris		=game.Debris
	local sub			=string.sub
	local len			=string.len
	local lower			=string.lower
	local find			=string.find
	local insert		=table.insert

	local player		=game.Players.LocalPlayer
	local pgui			=player.PlayerGui

	local Config = {
		
		["ChatCommands"] = {
			{
				Commands = {"/discord","/Discord","/DISCORD"},
				Callback = function(M)
					print("Join Discord")
				end,
			},
			{
				Commands = {"/HELP","/help","/Help"},
				Callback = function(M)
					RecieveChat("Chat Commands: \n /Discord - Joins Our Discord \n /Clear - Clears All Messages \n /Disable - Disabled Custom Chat And Re-enables default chat \n /Help - Shows List Of Commands \n","[CONSOLE]",{

						IsSystemMessage = true,

						Recipient = nil,
						AD = false,
						OW =false,
						DV = false,
						AT = false,
						Tag = "",

					})
				end,
			},
		},

		["Creators"] = { -- insert userids here to make them admins
		game.CreatorId
		},


		["Developers"] = { -- insert userids here to make them admins
			-- 1234567890,
			--game.Players.LocalPlayer.UserId
		},

		["Admins"] = { -- insert userids here to make them admins
			-- 1234567890,
		},

		["Testers"] = { -- insert userids here to make them admins
			--game.Players.LocalPlayer.UserId
		},

		["ChatBanned"] = { -- insert userids here to make them admins
			--game.Players.LocalPlayer.UserId
		},

		["TestingStage"] = "BETA",

		--["BubbleChat"] = true,

		["CustomTags"] = {
			


		--[[
	{
				ShowTag = game:GetService("MarketplaceService"):PlayerOwnsAsset(game.Players.LocalPlayer,95084778),
				TagText = "PREMIUM",
				TagColor = Color3.fromRGB(85, 170, 0)
			},
		]]

		}


	}

	

	local chatgui		= game:GetService("RunService"):IsStudio() and script.Parent or game:GetObjects("rbxassetid://13180380153")[1]
	local chatbox		=wfc(chatgui,"TextBox")
	local warn			=wfc(chatgui,"Warn")
	local msg = chatgui.Assets.Template
	


	
	

--	local admin,tester,DevGodLy,Founder,Owner,noo,apex,fat
	local adminlist={
	
	}
	

	local banlist={

	}
	
	local globalchat	=wfc(chatgui,"GlobalChat")

	local canchat		=true
	local chatspam		=0
	local totalspam		=0
	local maxchar		=200
	local lines			=8
	local chatting
	
	local tester = true
	
	--game.StarterGui:SetCoreGuiEnabled("Chat",false)


	--[[for i=1,#adminlist do if adminlist[i]==player.userId then admin=true end end
	for i=1,#testerlist do if testerlist[i]==player.userId then tester=true end end
	for i=1,#DevGodLylist do if DevGodLylist[i]==player.userId then DevGodLy=true end end
	for i=1,#Founderlist do if Founderlist[i]==player.userId then Founder=true end end
	for i=1,#Ownerlist do if Ownerlist[i]==player.userId then Owner=true end end
	for i=1,#noolist do if noolist[i]==player.userId then noo=true end end
	for i=1,#fatlist do if fatlist[i]==player.userId then fat=true end end
	for i=1,#apexlist do if apexlist[i]==player.userId then apex=true end end
	for i=1,#banlist do if banlist[i]==player.Name then player:kick() end end]]
	
	-- Getting Message 
	
	
	local function RecieveChat(Msg,Player,DataTable)

		print("Chat recieved")
		
		
		-- filtering 
		
		for i,v in pairs(Config.ChatCommands) do
			for x,c in pairs(v.Commands) do
				print(c)
				if string.match(Msg,c) then
					print("Command Found Execute Start")
					v.Callback(Msg)
				
				end
			end
		end
		
		if not DataTable.IsSystemMessage then
		
	--	game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer(Msg, "All") -- "All"
			
			end
	

		local mes=msg:Clone()
		local mtag=mes:WaitForChild("Tag")
		local offset=0
		--local SizeFix = mes:WaitForChild("SizeFix")
		mes.Parent=globalchat
		mtag.Text= DataTable.Tag or ""
		--SizeFix.Text = DataTable.SizeFixText
		mtag.TextColor3 = DataTable.TagColor or Color3.fromRGB(255,255,255)
		if DataTable.Tag and DataTable.SizeFixText ~= "" then
			offset=mtag.TextBounds.x+5
			mes.Position=ud2(0.01,offset,1,20)
			mtag.Position=ud2(0,-offset+5,0,0)
		end
		
		if DataTable.IsSystemMessage then
			mes.Text=Player..": "
		else
			mes.Text= string.format("%s (@%s): ",Player.DisplayName,Player.Name)--,(DataTable.OW and "[CREATOR]" or DataTable.DV and "[DEVELOPER]" or DataTable.AD and "[ADMIN]" or DataTable.AT and string.format("[%s TESTER]",string.upper(Config["TestingStage"]))))
		end
		
		
		mes.TextColor=Player.TeamColor or BrickColor.new("Institutional white")
		
		if DataTable.Recipient ~= nil then
			mes.Msg.Text=DataTable.Recipient ~= nil and string.format("[TO @%s]: %s",DataTable.Recipient.Name,Msg)
		else
			mes.Msg.Text = Msg
		end
		
		if DataTable.IsSystemMessage then
			mes.Msg.TextColor3 = Color3.fromRGB(0, 0, 255)
			mes.TextColor3 = Color3.fromRGB(0, 0, 255)
			
			
			
			
		else
			
		
			
			
			
		
		
		
		
		
		
		end
		
		
		mes.Msg.Text=DataTable.Recipient ~= nil and string.format("[TO @%s]: %s",DataTable.Recipient.Name,Msg) or Msg
		mes.Msg.Position=ud2(0,mes.TextBounds.x,0,0)
		print(mtag.Text)
		print("Send Message Success")
	end
	

	
	local function CheckAdmin(P)
		local IsAdmin = false
		for i,v in pairs(Config["Admins"]) do
			if v == P.UserId then
				IsAdmin = true
				print("Player Is Admin")
			end
		end
		return IsAdmin
	end
	
	local function CheckDeveloper(P)
		local isDev = false
		for i,v in pairs(Config["Developers"]) do
			if v == P.UserId then
				isDev = true
				print("Player Is Dev")
			end
		end
		return isDev
	end
	
	local function CheckCreators(P)
		local IsCreator = false
		for i,v in pairs(Config["Creators"]) do
			if v == P.UserId then
				IsCreator = true
				print("Player Is Creator")
			end
		end
		return IsCreator
	end
	
	local function CheckTesters(P)
		local IsTester = false
		for i,v in pairs(Config["Testers"]) do
			if v == P.UserId then
				IsTester = true
				print("Player Is Tester")
			end
		end
		return IsTester
	end
	
	
	for i,v in pairs(game.Players:GetPlayers()) do
		v.Chatted:Connect(function(M,R)
			--print(M.." : ".. tostring(R.Name) )
			
			RecieveChat(M,v,{
				Recipient = R,
				AD = CheckAdmin(v),
				OW = CheckCreators(v),
				DV = CheckDeveloper(v),
				AT = CheckTesters(v),
				Tag = "",
			})
		end)
	end
	

	local function findplayer(name, speaker)
		if lower(name) == "all" then
			local chars = {}
			local c = game:GetService("Players"):GetPlayers()
			for i = 1, #c do
				insert(chars, c[i])
			end
			return chars
		elseif lower(name) == "me" then
			return {speaker}
		elseif lower(name) == "others" then
			local chars = {}
			local c = game:GetService("Players"):GetPlayers()
			for i = 1, #c do
				if c ~= speaker then
					insert(chars, c[i])
				end
			end
			return chars
		else
			local chars = {}
			local commalist = {}
			local ssn = 0
			local lownum = 1
			local highestnum = 1
			local foundone
			while true do
				ssn = ssn + 1
				if sub(name, ssn, ssn) == "" then
					insert(commalist, lownum)
					insert(commalist, ssn - 1)
					highestnum = ssn - 1
					break
				end
				if string.sub(name, ssn, ssn) == "," then
					foundone = true
					table.insert(commalist, lownum)
					table.insert(commalist, ssn)
					lownum = ssn + 1
				end
			end
			if foundone then
				for ack = 1, #commalist, 2 do
					local cnum = 0
					local char
					local c = game:GetService("Players"):GetPlayers()
					for i = 1, #c do
						if find(lower(c[i].Name), sub(lower(name), commalist[ack], commalist[ack + 1] - 1)) == 1 then
							char = c[i]
							cnum = cnum + 1
						end
					end
					if cnum == 1 then
						table.insert(chars, char)
					end
				end
				return #chars ~= 0 and chars or 0
			else
				local cnum = 0
				local char
				local c = game:GetService("Players"):GetPlayers()
				for i = 1, #c do
					if find(lower(c[i].Name), lower(name)) == 1 then
						char = {
							c[i]
						}
						cnum = cnum + 1
					end
				end
				return cnum == 1 and char or 0
			end
		end
	end
	local function newchat()
		print("Setting Up Chat")
		local Succ,Err = pcall(function()
		local message=chatbox.Text
		local tag= "Test1"--CheckAdmin(player) and "ADMIN" or CheckDeveloper(player) and "DEVELOPER" or CheckCreator(player) and "CREATOR" or ""
		local teamchat
		local teamswitch
			local admincommand
			
			

		if sub(message,1,1)=="%" then
			teamchat=true
			message=sub(message,2,len(message))
		end

			if chatspam>3 then --and not CheckAdmin(player) or CheckDeveloper(player) or CheckCreators(player) then
			warn.Visible=true
			chatspam=chatspam+1
			totalspam=totalspam+1
			warn.Text="You have been blocked temporarily for spamming.   WARNING : ".. totalspam.." out of 0"
			if totalspam>3 then
				player:Kick("Kicked for spamming; don't do it again")
			end
			delay(5,function() chatspam=chatspam-5 warn.Visible=false end)
			return
		end
		local teamtype

		--[[if admin or tester or stealth or DevGodLy  or Founder then 

			if sub(lower(message),1,5)=="join/" or sub(lower(message),1,5)=="swap/" or sub(lower(message),1,5)=="team/" then 
				teamtype=6
				teamswitch=true
			elseif sub(lower(message),1,6)==":join " or sub(lower(message),1,6)==":team " then 
				teamtype=7
				--teamswitch=true
			elseif sub(lower(message),1,7)=="switch/" then 
				teamtype=8
				--teamswitch=true
			end
		end]]

		--[[if teamtype then
			local theteam
			local tnum=0
			local t=game.Teams:GetChildren()
			for i=1,#t do
				local v=t[i]
				if find(lower(v.Name),sub(lower(message),teamtype))==1 then
					theteam=v
					tnum=tnum+1
				end
			end
			if tnum==1 and player.TeamColor~=theteam.TeamColor then
				--[==[antihack]==]network:send('c'..'h'..'a'..'n'..'g'..'e'..'t'..'e'..'a'..'m',player,theteam)
				--network:send("changeteam",player,theteam)
			end
		elseif message=="switch" or message=="switchteam" then
			teamswitch=true
			--[==[antihack]==]network:send('c'..'h'..'a'..'n'..'g'..'e'..'t'..'e'..'a'..'m',player,player.TeamColor.Name=='B'..'r'..'i'..'g'..'h'..'t'..' '..'o'..'r'..'a'..'n'..'g'..'e' and BrickColor.new('B'..'r'..'i'..'g'..'h'..'t'..' '..'b'..'l'..'u'..'e') or BrickColor.new('B'..'r'..'i'..'g'..'h'..'t'..' '..'o'..'r'..'a'..'n'..'g'..'e'))
			--network:send("changeteam",player,player.TeamColor.Name=="Bright red and BrickColor.new("Bright blue") or BrickColor.new("Bright orange"))
		end]]

		if len(message)>200 then
			message=sub(message,1,200)
		end
		local Info = {
				Tag = "",
				TagColor = Color3.fromRGB(0,0,0),
				SizeFixText = "",
			AT = CheckTesters(player),
				AD = CheckAdmin(player),
				OW = CheckCreators(player),
				DV = CheckDeveloper(player),
				TeamChat = false,
				BubbleChat = Config["BubbleChat"]
			}
			
			-- Adding Custom Tags [OLD]
			
			local CustomTags = ""
			local             SizeFix = ""
			
			
			local function Col3ToRGB(Color)
				return string.format('rgb(%s,%s,%s)',math.round(Color.R*255),math.round(Color.G*255),math.round(Color.B*255))
			end
			
			for i,v in pairs(Config["CustomTags"]) do
				if v.ShowTag then
					print(tostring(v.TagColor))
					CustomTags = CustomTags..string.format('<font color="%s">%s </font>',Col3ToRGB(v.TagColor),v.TagText)
					SizeFix  = SizeFix.." "..v.TagText
					
				end
			end
			
			if CustomTags ~= "" then
				print("hasCustomTags")
				Info.Tag = tostring(CustomTags)
				Info.SizeFixText = tostring(SizeFix) -- This is used to fix the size of the text, its very trolly
			end
			
			print(tostring(CustomTags))
			
			print(Info.Tag)
			
			-- Adding Custom Tags [OLD]

			--[[local CustomTags = ""

			

			for i,v in pairs(Config["CustomTags"]) do
				if v.ShowTag then
					print(tostring(v.TagColor))
					CustomTags = CustomTags.." "..v.TagText
					SizeFix  = SizeFix.." "..v.TagText
					Info.TagColor = v.TagColor
					
				end
			end

			if CustomTags ~= "" then
				print("hasCustomTags")
				Info.Tag = tostring(CustomTags)
				
			end

			print(tostring(CustomTags))

			print(Info.Tag)]]
			
			
		
		local header=""
		--message=header.." " ..message
		chatspam=chatspam+1
		--network:send('c'..'h'..'a'..'t'..'t'..'e'..'d',player,message,tag,teamchat)
			--game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("Chat"):WaitForChild("Send"):FireServer(message,Info)
			RecieveChat(message,game.Players.LocalPlayer,{
				Recipient = nil,
				AD = CheckAdmin(game.Players.LocalPlayer),
				OW = CheckCreators(game.Players.LocalPlayer),
				DV = CheckDeveloper(game.Players.LocalPlayer),
				AT = CheckTesters(game.Players.LocalPlayer),
				Tag = "",
			})
			
			game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer(message, "All") -- "All"
			
		spawn(function() wait(10) chatspam=chatspam-1 end)
		chatbox.Text="Press '/' or click here to chat" --noiceness55
		chatting=false
			chatbox.ClearTextOnFocus=true
			print("MessageSend Success")
		end)
		if Err then
			print("Message Send Failure: ",Err)
		end
	end

	function chat:disable()
		canchat=false
		chatbox.Visible=false
	end

	function chat:inmenu()
		globalchat.Position=ud2(0.05,0,1,-240)
		chatbox.Position=ud2(0,10,1, -20)--ud2(0.05,10,1, -20)
	end

	function chat:ingame()
		globalchat.Position=ud2(0,150,1,-50)
		chatbox.Position=ud2(0,10,1, -20)
	end
	
	
	globalchat.ChildAdded:connect(function(child)
		print("Chat Frame Child Added")
		local m=globalchat:GetChildren()
		for i=1,#m do
			local v=m[i]
			local tag=wfc(v,"Tag")
			local tagoff=5
			if tag.Text~="" then
				tagoff=5+tag.TextBounds.x
				v.Position=ud2(0.01,tagoff,1,v.Position.Y.Offset)
			end
			if v.Parent then
				v:TweenPosition(ud2(0.01,tagoff,1,(i-#m)*20),"Out","Sine",0.2,true)
			end
			if #m>lines and i<=#m-lines and v.Name~="Deleted" then
				v.Name="Deleted"
				wfc(v,"Msg")
				wfc(v,"Tag")
				for x=1,5 do
					if ffc(v,"Msg") and ffc(v,"Tag") then
						v.TextTransparency=(x*2)/10
						v.TextStrokeTransparency=(x*2)/10+0.1
						v.Msg.TextTransparency=(x*2)/10
						v.Msg.TextStrokeTransparency=(x*2)/10+0.1
						v.Tag.TextTransparency=(x*2)/10
						v.Tag.TextStrokeTransparency=(x*2)/10+0.1
						wait(1/30)
					end
					if v and v.Parent then v:Destroy() end
				end
			end
		end
	end)

	chatbox.Focused:connect(function()
		chatbox.Active=true
	end)

	chatbox.FocusLost:connect(function(enter)
		chatbox.Active=false
		if enter and chatbox.Text~="" then
			print("Sending Message")
			newchat()
		end
	end)

	game:GetService("UserInputService").InputBegan:connect(function(keycode)
		
		if not canchat then chatbox.Visible=false return end
		if warn.Visible then return end
		local key=keycode.KeyCode
		if key==Enum.KeyCode.Slash and not chatbox.Active then
			print("Chat key press")
			wait(-math.huge)
			chatbox:CaptureFocus()
			chatbox.ClearTextOnFocus=false
		end
	end)

	if player.userId<0 then 
		chat:disable()
	end
	
	chatbox.Interactive.MouseButton1Down:Connect(function()
		print("Chat Clicked")
		wait(-math.huge)
		chatbox:CaptureFocus()
		chatbox.ClearTextOnFocus=false
	end)
	

	for i,v in pairs(Config["ChatBanned"]) do
		if v == player.UserId then
			canchat = false
			warn.Visible = true
			warn.Text = "You are Banned From Using Chat."

		end
	end

	chatgui.Version.Text = "Server version: "..tostring(game.PlaceVersion)
	chatbox.Text = "Press '/' or click here to chat"
	
	RecieveChat("OKChat Bar Loaded Sucessfully : Loaded Version 1.9.2A","[CONSOLE]",{
		
		IsSystemMessage = true,
		
		Recipient = nil,
		AD = false,
		OW =false,
		DV = false,
		AT = false,
		Tag = "",
		
	})
	
	RecieveChat('Type "/Discord" to join our discord!',"[CONSOLE]",{

		IsSystemMessage = true,

		Recipient = nil,
		AD = false,
		OW =false,
		DV = false,
		AT = false,
		Tag = "",

	})
	

end)
if Err then
	print("CHAT CLIENTSIDE ERROR: ",Err)
end
