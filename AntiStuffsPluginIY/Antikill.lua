spawn (function()
        _G.STOP = true -- disable
        wait(1)
        _G.STOP = false -- enable
         
        game:service'StarterGui':SetCore("SendNotification",{
            Title = "Enabled AntiTool";
            Text = "By Synttax";
        });
         
        local off = false
        local cf,pos
        local sotp = false
        local tools = {}
         
        for i,v in pairs(game:service'Players'.LocalPlayer.Backpack:getChildren'') do
            tools[v] = true
        end
         
        game:service'Players'.LocalPlayer.Backpack.ChildAdded:connect(function(c)
            if off then return end
            tools[c] = true
        end)
         
        local thing = function(ob)
            if off then return end
            if ob:IsA("Tool") and not tools[ob] then
                game:service'RunService'.Stepped:wait''
                tools[ob] = true
                sotp = true
                ob.Parent = game:service'Players'.LocalPlayer.Backpack
                game:service'StarterGui':SetCore("SendNotification",{
                    Title = "Overflow";
                    Text = "Someone attempted to kill/Claim you."
                });
                for i = 1,10 do
                    if game:service'Players'.LocalPlayer.Character and game:service'Players'.LocalPlayer.Character:findFirstChild'HumanoidRootPart' then
                        game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = cf
                        for i,v in pairs(game:service'Players'.LocalPlayer.Character:getChildren'') do
                            if v:IsA("BasePart") or v:IsA("MeshPart") then
                                v.Velocity = Vector3.new(0,0,0)
                            end
                        end
                        game:service'RunService'.Stepped:wait''
                    end
                end
                sotp = false
            end
        end
         
        game:service'Players'.LocalPlayer.Character.ChildAdded:connect(thing)
        game:service'Players'.LocalPlayer.CharacterAdded:connect(function(c)
            c.ChildAdded:connect(thing)
        end)
         
        while wait(.5) and not _G.STOP do
            if game:service'Players'.LocalPlayer.Character and game:service'Players'.LocalPlayer.Character:findFirstChild("HumanoidRootPart") and not sotp then
                cf =
        game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame
                pos = game:service'Players'.LocalPlayer.Character.HumanoidRootPart.Position
            end
        end
         
        off = true
        end)
