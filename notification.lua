local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local notificationFrame = Instance.new("Frame")
notificationFrame.Size = UDim2.new(0, 0, 0, 50)
notificationFrame.Position = UDim2.new(0.5, -200, 0, 20)
notificationFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
notificationFrame.BackgroundTransparency = 0.5
notificationFrame.BorderSizePixel = 0
notificationFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = notificationFrame

local notificationText = Instance.new("TextLabel")
notificationText.Size = UDim2.new(1, -20, 1, -10)
notificationText.Position = UDim2.new(0, 10, 0, 5)
notificationText.BackgroundTransparency = 1
notificationText.TextColor3 = Color3.fromRGB(255, 255, 255)
notificationText.TextSize = 24
notificationText.Font = Enum.Font.GothamSemibold
notificationText.Text = "Loading..."
notificationText.TextWrapped = true
notificationText.Parent = notificationFrame

local TweenService = game:GetService("TweenService")
local tweenInfoIn = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local tweenInfoOut = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In)

local function showNotification(text, bgColor)
    notificationText.Text = text
    notificationFrame.BackgroundColor3 = bgColor
    local tweenIn = TweenService:Create(notificationFrame, tweenInfoIn, {
        Position = UDim2.new(0.5, -200, 0, 20),
        Size = UDim2.new(0, 400, 0, 50)
    })
    tweenIn:Play()

    wait(0.5)
    wait(5)
    local tweenOut = TweenService:Create(notificationFrame, tweenInfoOut, {
        Position = UDim2.new(0.5, -200, 0, -60)
    })
    tweenOut:Play()

    tweenOut.Completed:Connect(function()
        notificationFrame:Destroy()
    end)
end
