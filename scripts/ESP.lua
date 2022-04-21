local gui = Instance.new("BillboardGui")
-----------------------------------------------------------------
local border = Instance.new("Frame", gui)
local b_top = Instance.new("Frame", border)
local b_bottom = Instance.new("Frame", border)
local b_right = Instance.new("Frame", border)
local b_left = Instance.new("Frame", border)
-----------------------------------------------------------------
local info = Instance.new("Frame", gui)
local name = Instance.new("TextLabel", info)
-----------------------------------------------------------------
gui.Name = "NelzESP"
gui.ResetOnSpawn = false
gui.AlwaysOnTop = true
gui.LightInfluence = 0
gui.Size = UDim2.new(10,0 , 10,0)
gui.SizeOffset = Vector2.new(0, -0.212500006)
gui.ClipsDescendants = true
-----------------------------------------------------------------
border.Name = "Border"
border.AnchorPoint = Vector2.new(0.5, 0)
border.BackgroundTransparency = 1
border.Position = UDim2.new(0.5,0 , 0,0)
border.Size = UDim2.new(0.479999989,0, 0.649999976,0)
border.ClipsDescendants = true

b_top.Name = "Top"
b_top.AnchorPoint = Vector2.new(0.5, 0)
b_top.BackgroundColor3 = Color3.fromRGB(255, 24, 70)
b_top.BorderSizePixel = 0
b_top.Position = UDim2.new(0.5,0 , 0,0)
b_top.Size = UDim2.new(1,0 , 0.0500000007,0)

b_bottom.Name = "Bottom"
b_bottom.AnchorPoint = Vector2.new(0.5, 1)
b_bottom.BackgroundColor3 = Color3.fromRGB(255, 24, 70)
b_bottom.BorderSizePixel = 0
b_bottom.Position = UDim2.new(0.5,0 , 1,0)
b_bottom.Size = UDim2.new(1,0 , 0.0500000007,0)

b_right.Name = "Right"
b_right.AnchorPoint = Vector2.new(0, 0.5)
b_right.BackgroundColor3 = Color3.fromRGB(255, 24, 70)
b_right.BorderSizePixel = 0
b_right.Position = UDim2.new(0,0 , 0.5,0)
b_right.Size = UDim2.new(0.0799999982, 0 , 1, 0)

b_left.Name = "Left"
b_left.AnchorPoint = Vector2.new(1, 0.5)
b_left.BackgroundColor3 = Color3.fromRGB(255, 24, 70)
b_left.BorderSizePixel = 0
b_left.Position = UDim2.new(1,0 , 0.5,0)
b_left.Size = UDim2.new(0.0799999982, 0 , 1, 0)
-----------------------------------------------------------------
info.Name = "Info"
info.AnchorPoint = Vector2.new(0.5, 0)
info.BackgroundTransparency = 1
info.Position = UDim2.new(0.5,0 , 0.680000007,0)
info.Size = UDim2.new(0,150 , 0,30)
info.ClipsDescendants = true

name.Name = "Name"
name.BackgroundTransparency = 1
name.Size = UDim2.new(1,0 , 0,15)
name.Font = Enum.Font.GothamSemibold
name.Text = "Name: N/A"
name.TextColor3 = Color3.fromRGB(255, 152, 70)
name.TextScaled = true
name.TextStrokeColor3 = Color3.fromRGB(0,0,0)
name.TextStrokeTransparency = 0.75
name.ClipsDescendants = true
-----------------------------------------------------------------
game:GetService("RunService").RenderStepped:Connect(function()
    local me = game:GetService("Players").LocalPlayer
    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
        if v ~= me and not v.Character.HumanoidRootPart:FindFirstChild("NelzESP") then
            name.Text = "Name: "..v.Name
            gui:Clone().Parent = v.Character.HumanoidRootPart
        end
    end
end)