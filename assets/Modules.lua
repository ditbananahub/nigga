local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
function AutoLVL()
  task.spawn(function ()
    while task.wait() do
      pcall(function ()
        A()
        if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
							wait(1)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",A()[4],A()[1])
        elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					  for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					  if Lv >= 1 and Lv <= 16 then
									if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
										if v.Name == A()[3] then
											repeat task.wait()
												EquipTool(WP)
												FarmPos = v.HumanoidRootPart.CFrame
												MonFarm = v.Name
												TweenToPos(FarmPos * RandomPos)
											until not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name) or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
										end
								else
								  TweenToPos(A[7])
								end
					    end
					  end
          end
					if Lv >= 17 and Lv <= 70 then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == "Shanda" then
									repeat task.wait()
											EquipTool(WP)
											FarmPos = v.HumanoidRootPart.CFrame
											MonFarm = v.Name
											TweenToPos(FarmPos * RandomPos)
									until not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
							end
						end
					elseif Lv >= 70 and Lv <= 300 then
					  PlayersFarm()
					end
        end)
      end
	end)
end
