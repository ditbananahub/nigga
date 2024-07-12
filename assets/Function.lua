function A()
  -- cai check quest nay kaitun lua hub t lm bon m copy nin mom lai
  if lvl>= 1 and lvl<= 9 then
    if tostring(game.Players.LocalPlayer.Team) == "Marines" then
      Mon = "Trainee"
      NPCPosition =CFrame.new(
                        -2709.67944,
                        24.5206585,
                        2104.24585,
                        -0.744724929,
                        -3.97967455e-08,
                        -0.667371571,
                        4.32403588e-08,
                        1,
                        -1.07884304e-07,
                        0.667371571,
                        -1.09201515e-07,
                        -0.744724929
                    )
    elseif tostring(game.Players.LocalPlayer.Team) == "Pirates" then
      MobName = "Bandit"
      Mon = "Bandit"
      QuestName = "BanditQuest1"
      QuestLevel = 1
      NPCPosition = CFrame.new(
                        1059.99731,
                        16.9222069,
                        1549.28162,
                        -0.95466274,
                        7.29721794e-09,
                        0.297689587,
                        1.05190106e-08,
                        1,
                        9.22064114e-09,
                        -0.297689587,
                        1.19340022e-08,
                        -0.95466274
                    )
      end
      return {
        [1] = QuestLevel,
        [2] = NPCPosition,
        [3] = MobName,
        [4] = QuestName,
        [5] = LevelRequire,
        [6] = Mon,
        [7] = MobCFrame
      }
      end
    if lvl>= 375 and lvl<= 399 then
      MobName = "Fishman Warrior"
      QuestName = "FishmanQuest"
      QuestLevel = 1
      Mon = "Fishman Warrior"
      NPCPosition = CFrame.new(
                    61122.5625,
                    18.4716396,
                    1568.16504,
                    0.893533468,
                    3.95251609e-09,
                    0.448996574,
                    -2.34327455e-08,
                    1,
                    3.78297464e-08,
                    -0.448996574,
                    -4.43233645e-08,
                    0.893533468
                )
                MobCFrame =
                    CFrame.new(
                    60955.0625,
                    48.7988472,
                    1543.7168,
                    -0.831178129,
                    6.20639318e-09,
                    -0.556006253,
                    7.20035302e-08,
                    1,
                    -9.64761853e-08,
                    0.556006253,
                    -1.20223305e-07,
                    -0.831178129
                )
                  if
                        (NPCPosition.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >
                            3000
                 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                        "requestEntrance",
                        Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)
                    )
                end
                return {
                    [1] = QuestLevel,
                    [2] = NPCPosition,
                    [3] = MobName,
                    [4] = QuestName,
                    [5] = LevelRequire,
                    [6] = Mon,
                    [7] = MobCFrame
                }
            end
            local j = require(game:GetService("ReplicatedStorage").GuideModule)
            local k = require(game:GetService("ReplicatedStorage").Quests)
            for f, g in pairs(j["Data"]["NPCList"]) do
                for l, m in pairs(g["Levels"]) do
                    if lvl>= m then
                        if not LevelRequire then
                            LevelRequire = 0
                        end
                        if m > LevelRequire then
                            NPCPosition = f["CFrame"]
                            QuestLevel = l
                            LevelRequire = m
                        end
                        if #g["Levels"] == 3 and QuestLevel == 3 then
                            NPCPosition = f["CFrame"]
                            QuestLevel = 2
                            LevelRequire = g["Levels"][2]
                        end
                    end
                end
            end
            for f, g in pairs(k) do
                for l, m in pairs(g) do
                    if m["LevelReq"] == LevelRequire and f ~= "CitizenQuest" then
                        QuestName = f
                        for n, o in pairs(m["Task"]) do
                            MobName = n
                            Mon = string.split(n, " [Lv. " .. m["LevelReq"] .. "]")[1]
                        end
                    end
                end
            end
            if QuestName == "MarineQuest2" then
                QuestName = "MarineQuest2"
                QuestLevel = 1
                MobName = "Chief Petty Officer"
                Mon = "Chief Petty Officer"
                LevelRequire = 120
            elseif QuestName == "ImpelQuest" then
                QuestName = "PrisonerQuest"
                QuestLevel = 2
                MobName = "Dangerous Prisoner"
                Mon = "Dangerous Prisoner"
                LevelRequire = 210
                NPCPosition =
                    CFrame.new(
                    5310.60547,
                    0.350014925,
                    474.946594,
                    0.0175017118,
                    0,
                    0.999846935,
                    0,
                    1,
                    0,
                    -0.999846935,
                    0,
                    0.0175017118
                )
            elseif QuestName == "SkyExp1Quest" then
                if QuestLevel == 1 then
                    NPCPosition =
                        CFrame.new(
                        -4721.88867,
                        843.874695,
                        -1949.96643,
                        0.996191859,
                        -0,
                        -0.0871884301,
                        0,
                        1,
                        -0,
                        0.0871884301,
                        0,
                        0.996191859
                    )
                elseif QuestLevel == 2 then
                    NPCPosition =
                        CFrame.new(
                        -7859.09814,
                        5544.19043,
                        -381.476196,
                        -0.422592998,
                        0,
                        0.906319618,
                        0,
                        1,
                        0,
                        -0.906319618,
                        0,
                        -0.422592998
                    )
                end
            elseif QuestName == "Area2Quest" and QuestLevel == 2 then
                QuestName = "Area2Quest"
                QuestLevel = 1
                MobName = "Swan Pirate"
                Mon = "Swan Pirate"
                LevelRequire = 775
            end
            MobName = MobName:sub(1, #MobName)
            if not MobName:find("Lv") then
                for f, g in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    MonLV = string.match(g.Name, "%d+")
                    if g.Name:find(MobName) and #g.Name > #MobName and tonumber(MonLV) <= lvl+ 50 then
                        MobName = g.Name
                    end
                end
            end
            if not MobName:find("Lv") then
                for f, g in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                    MonLV = string.match(g.Name, "%d+")
                    if g.Name:find(MobName) and #g.Name > #MobName and tonumber(MonLV) <= lvl+ 50 then
                        MobName = g.Name
                        Mon = a
                    end
                end
            end
            for p, g in pairs(workspace._WorldOrigin.EnemySpawns:GetChildren()) do
                if g.Name == MobName then
                    MobCFrame = g.CFrame * CFrame.new(0, 30, 5)
                end
            end
            return {
                [1] = QuestLevel,
                [2] = NPCPosition,
                [3] = MobName,
                [4] = QuestName,
                [5] = LevelRequire,
                [6] = Mon,
                [7] = MobCFrame
            }
        end
end

function EquipWeapon(q)
            if game.Players.LocalPlayer.Backpack:FindFirstChild(q) then
                local r = game.Players.LocalPlayer.Backpack:FindFirstChild(q)
                wait(.4)
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(r)
            end
end
      
        function UnEquipWeapon(s)
            if game.Players.LocalPlayer.Character:FindFirstChild(s) then
                _G.NotAutoEquip = true
                task.wait(.5)
                game.Players.LocalPlayer.Character:FindFirstChild(s).Parent = game.Players.LocalPlayer.Backpack
                task.wait(.1)
                _G.NotAutoEquip = false
            end
        end
        
        function toposition(t)
            TweeSpeed = 349
            local u = game.Players.LocalPlayer
            TweenPlay = (t.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            pcall(
                function()
                    tot =
                        game:GetService("TweenService"):Create(
                        u.Character.HumanoidRootPart,
                        TweenInfo.new(TweenPlay / TweeSpeed, Enum.EasingStyle.Linear),
                        {CFrame = t}
                    )
                end
            )
            tot:Play()
            if TweenPlay <= 1000 then
                TweeSpeed = 333
            end
            if TweenPlay <= 500 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = t
            end
            if u.Character.Humanoid.Sit == true then
                u.Character.Humanoid.Sit = false
            end
            if _G.StopTween == true then
                tot:Cancel()
                _G.Clip = false
            end
            if _G.StopTween then
                tot:Cancel()
                BringMobFarm = false
            elseif game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                tot:Play()
            elseif game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then
                tot:Cancel()
                BringMobFarm = false
                wait(0.5)
            end
        end
        
        function Bypass(x)
            _G.StopTween = true
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = x
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = x
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetLastSpawnPoint")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                "SetLastSpawnPoint",
                tostring(game:GetService("Players").LocalPlayer.Data.SpawnPoint.Value)
            )
            _G.StopTween = false
            if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
        end
        
        function Check_Sword(y)
            for f, g in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
                if g.Type == "Sword" then
                    if g.Name == y then
                        return true
                    end
                end
            end
end
