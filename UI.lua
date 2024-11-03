--//UI
local MainScreenGui = Instance.new("ScreenGui")
local ButtonScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")

MainScreenGui.Name = "MainScreenGui"
MainScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

ButtonScreenGui.Name = "ButtonScreenGui"
ButtonScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

ImageButton.Parent = ButtonScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.5, 10, 0, 10) 
ImageButton.AnchorPoint = Vector2.new(0.5, 0) 
ImageButton.Size = UDim2.new(0, 40, 0, 40)
ImageButton.Image = "rbxassetid://71559742701570"

UICorner.CornerRadius = UDim.new(1, 0) 
UICorner.Parent = ImageButton

UIStroke.Color = Color3.fromRGB(75, 0, 130)
UIStroke.Parent = ImageButton

-- Thêm phần thay đổi màu RGB liên tục cho UIStroke
local colors = {
    Color3.fromRGB(255, 0, 0),   -- Đỏ
    Color3.fromRGB(255, 165, 0), -- Cam
    Color3.fromRGB(255, 255, 0), -- Vàng
    Color3.fromRGB(3, 252, 40),   -- Xanh lá
    Color3.fromRGB(0, 0, 255),   -- Xanh dương
    Color3.fromRGB(75, 0, 130),  -- Chàm
    Color3.fromRGB(23, 255, 224)-- Tím
}

local index = 1

spawn(function()
    while true do
        UIStroke.Color = colors[index]
        index = index % #colors + 1 
        wait(0.6) 
    end
end)

local function toggleUI()
    MainScreenGui.Enabled = not MainScreenGui.Enabled
end

ImageButton.MouseButton1Click:Connect(function()
    
    local goal = {Rotation = 360} 
    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Back) 
    local tween = TweenService:Create(ImageButton, tweenInfo, goal)

    tween:Play()
    tween.Completed:Connect(function()
        ImageButton.Rotation = 0 
        toggleUI() 
    end)

    local clickSound = sound:Clone()
    clickSound.Parent = SoundService
    clickSound:Play()
    
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
end)

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local Window = Fluent:CreateWindow({
    Title = " 近道 | Peguin•Hub",
    SubTitle = "HEHEHEHE",
    TabWidth = 100,
    Size = UDim2.fromOffset(400, 280),
    Acrylic = false, -- ko có gì :)
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl -- Không có key
})