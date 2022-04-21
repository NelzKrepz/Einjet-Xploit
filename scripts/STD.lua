if game.PlaceId == 2824541293 then
    local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local me = game:GetService('Players').LocalPlayer
    local UIS = game:GetService("UserInputService")
    local camera = workspace.CurrentCamera
    local TS = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(0.25)
    -- Global Vars
    _G.nelzESP = {
        -- AimLock
        toggle_aimlock = false,
        aim = false,
        aimlockkeybind = Enum.UserInputType.MouseButton2,
        -- ESP
        esp = false
    }

    -- Creating Window
    local Window = UI.CreateLib("Second Till Death", "Sentinel")
    -- Main Tab
    local MainTab = Window:NewTab("Main")
    local MainSection = MainTab:NewSection("Main")
    MainSection:NewToggle("AimLock", "Toggle head locking to the nearest player", function(state)
        _G.nelzESP.toggle_aimlock = state
        if state then
            UIS.InputBegan:Connect(function(input)
                if _G.nelzESP.toggle_aimlock == false then return end
                if input.UserInputType == _G.nelzESP.aimlockkeybind then
                    _G.nelzESP.aim = true
                    while wait() do
                        if getClosest() then
                            -- getClosest()
                            local tween = TS:Create(camera, tweenInfo, {CFrame = CFrame.new(camera.CFrame.Position, getClosest().Character.Head.Position)})
                            tween:Play()
                            if _G.nelzESP.aim == false then
                                tween:Cancel()
                                return
                            end
                        end
                    end
                end
            end)
            UIS.InputEnded:Connect(function(input)
                if input.UserInputType == _G.nelzESP.aimlockkeybind then
                    _G.nelzESP.aim = false
                end
            end)
        end
    end)

    function getClosest()
        local closestDistance = math.huge
        local closestPlayer = nil
        for i,v in pairs(game.Players:GetChildren()) do
            if v ~= me then
                local distance = (me.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
                if distance < closestDistance then
                    closestDistance = distance
                    closestPlayer = v
                end
            end
        end
        return closestPlayer
    end
end
