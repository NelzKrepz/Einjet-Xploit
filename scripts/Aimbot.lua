local me = game:GetService('Players').LocalPlayer
local UIS = game:GetService("UserInputService")
local camera = workspace.CurrentCamera
local TS = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.25)


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

UIS.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        _G.aim = true
        while wait() do
            if getClosest() then
                -- getClosest()
                local tween = TS:Create(camera, tweenInfo, {CFrame = CFrame.new(camera.CFrame.Position, getClosest().Character.Head.Position)})
                tween:Play()
                if _G.aim == false then
                    tween:Cancel()
                    return
                end
            end
        end
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        _G.aim = false
    end
end)

print("AIMBOT BY NELZ ENABLED!")