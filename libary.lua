local NexusUI = {}
NexusUI.__index = NexusUI

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local function createTween(instance, duration, properties)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(instance, tweenInfo, properties)
    tween:Play()
    return tween
end

function NexusUI.new(title)
    local self = setmetatable({}, NexusUI)
    
    self.ScreenGui = Instance.new("ScreenGui")
    self.ScreenGui.Name = "NexusUI"
    self.ScreenGui.ResetOnSpawn = false
    self.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    self.ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    self.MainFrame = Instance.new("Frame")
    self.MainFrame.Name = "MainFrame"
    self.MainFrame.Size = UDim2.new(0, 520, 0, 400)
    self.MainFrame.Position = UDim2.new(0.5, -260, 0.5, -200)
    self.MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
    self.MainFrame.BorderSizePixel = 0
    self.MainFrame.Parent = self.ScreenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = self.MainFrame
    
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.Size = UDim2.new(1, 40, 1, 40)
    shadow.Position = UDim2.new(0, -20, 0, -20)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://5554236805"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.5
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(23, 23, 277, 277)
    shadow.ZIndex = 0
    shadow.Parent = self.MainFrame
    
    self.TopBar = Instance.new("Frame")
    self.TopBar.Name = "TopBar"
    self.TopBar.Size = UDim2.new(1, 0, 0, 45)
    self.TopBar.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
    self.TopBar.BorderSizePixel = 0
    self.TopBar.Parent = self.MainFrame
    
    local topCorner = Instance.new("UICorner")
    topCorner.CornerRadius = UDim.new(0, 10)
    topCorner.Parent = self.TopBar
    
    local topFix = Instance.new("Frame")
    topFix.Size = UDim2.new(1, 0, 0, 10)
    topFix.Position = UDim2.new(0, 0, 1, -10)
    topFix.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
    topFix.BorderSizePixel = 0
    topFix.Parent = self.TopBar
    
    self.Icon = Instance.new("ImageLabel")
    self.Icon.Name = "Icon"
    self.Icon.Size = UDim2.new(0, 28, 0, 28)
    self.Icon.Position = UDim2.new(0, 12, 0.5, -14)
    self.Icon.BackgroundTransparency = 1
    self.Icon.Image = "rbxassetid://116145929663834"
    self.Icon.Parent = self.TopBar
    
    self.Title = Instance.new("TextLabel")
    self.Title.Name = "Title"
    self.Title.Size = UDim2.new(1, -100, 1, 0)
    self.Title.Position = UDim2.new(0, 48, 0, 0)
    self.Title.BackgroundTransparency = 1
    self.Title.Text = title or "Nexus UI"
    self.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    self.Title.Font = Enum.Font.GothamBold
    self.Title.TextSize = 16
    self.Title.TextXAlignment = Enum.TextXAlignment.Left
    self.Title.Parent = self.TopBar
    
    self.CloseButton = Instance.new("TextButton")
    self.CloseButton.Name = "CloseButton"
    self.CloseButton.Size = UDim2.new(0, 40, 0, 40)
    self.CloseButton.Position = UDim2.new(1, -45, 0, 2.5)
    self.CloseButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    self.CloseButton.BorderSizePixel = 0
    self.CloseButton.Text = "X"
    self.CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    self.CloseButton.Font = Enum.Font.GothamBold
    self.CloseButton.TextSize = 14
    self.CloseButton.Parent = self.TopBar
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 8)
    closeCorner.Parent = self.CloseButton
    
    self.CloseButton.MouseEnter:Connect(function()
        createTween(self.CloseButton, 0.2, {BackgroundColor3 = Color3.fromRGB(220, 50, 50)})
    end)
    
    self.CloseButton.MouseLeave:Connect(function()
        createTween(self.CloseButton, 0.2, {BackgroundColor3 = Color3.fromRGB(30, 30, 40)})
    end)
    
    self.CloseButton.MouseButton1Click:Connect(function()
        createTween(self.MainFrame, 0.3, {Size = UDim2.new(0, 0, 0, 0)})
        wait(0.3)
        self.ScreenGui:Destroy()
    end)
    
    self.Container = Instance.new("ScrollingFrame")
    self.Container.Name = "Container"
    self.Container.Size = UDim2.new(1, -20, 1, -60)
    self.Container.Position = UDim2.new(0, 10, 0, 50)
    self.Container.BackgroundTransparency = 1
    self.Container.BorderSizePixel = 0
    self.Container.ScrollBarThickness = 4
    self.Container.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 100)
    self.Container.CanvasSize = UDim2.new(0, 0, 0, 0)
    self.Container.Parent = self.MainFrame
    
    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 8)
    layout.Parent = self.Container
    
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        self.Container.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
    end)
    
    local dragging = false
    local dragInput, mousePos, framePos
    
    self.TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = self.MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - mousePos
            self.MainFrame.Position = UDim2.new(
                framePos.X.Scale, framePos.X.Offset + delta.X,
                framePos.Y.Scale, framePos.Y.Offset + delta.Y
            )
        end
    end)
    
    return self
end

function NexusUI:AddSection(text)
    local section = Instance.new("Frame")
    section.Name = "Section"
    section.Size = UDim2.new(1, 0, 0, 30)
    section.BackgroundTransparency = 1
    section.Parent = self.Container
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(180, 180, 200)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = section
    
    local line = Instance.new("Frame")
    line.Size = UDim2.new(1, 0, 0, 1)
    line.Position = UDim2.new(0, 0, 1, -1)
    line.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
    line.BorderSizePixel = 0
    line.Parent = section
    
    return section
end

function NexusUI:AddButton(text, callback)
    local button = Instance.new("TextButton")
    button.Name = "Button"
    button.Size = UDim2.new(1, 0, 0, 36)
    button.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.Gotham
    button.TextSize = 13
    button.Parent = self.Container
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = button
    
    button.MouseEnter:Connect(function()
        createTween(button, 0.2, {BackgroundColor3 = Color3.fromRGB(50, 50, 70)})
    end)
    
    button.MouseLeave:Connect(function()
        createTween(button, 0.2, {BackgroundColor3 = Color3.fromRGB(35, 35, 48)})
    end)
    
    button.MouseButton1Click:Connect(function()
        createTween(button, 0.1, {BackgroundColor3 = Color3.fromRGB(70, 70, 95)})
        wait(0.1)
        createTween(button, 0.1, {BackgroundColor3 = Color3.fromRGB(50, 50, 70)})
        if callback then callback() end
    end)
    
    return button
end

function NexusUI:AddToggle(text, default, callback)
    local toggled = default or false
    
    local frame = Instance.new("Frame")
    frame.Name = "Toggle"
    frame.Size = UDim2.new(1, 0, 0, 36)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    frame.BorderSizePixel = 0
    frame.Parent = self.Container
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -60, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 44, 0, 22)
    toggleButton.Position = UDim2.new(1, -54, 0.5, -11)
    toggleButton.BackgroundColor3 = toggled and Color3.fromRGB(80, 150, 255) or Color3.fromRGB(60, 60, 75)
    toggleButton.BorderSizePixel = 0
    toggleButton.Text = ""
    toggleButton.Parent = frame
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(1, 0)
    toggleCorner.Parent = toggleButton
    
    local circle = Instance.new("Frame")
    circle.Size = UDim2.new(0, 18, 0, 18)
    circle.Position = toggled and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
    circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    circle.BorderSizePixel = 0
    circle.Parent = toggleButton
    
    local circleCorner = Instance.new("UICorner")
    circleCorner.CornerRadius = UDim.new(1, 0)
    circleCorner.Parent = circle
    
    toggleButton.MouseButton1Click:Connect(function()
        toggled = not toggled
        createTween(toggleButton, 0.2, {
            BackgroundColor3 = toggled and Color3.fromRGB(80, 150, 255) or Color3.fromRGB(60, 60, 75)
        })
        createTween(circle, 0.2, {
            Position = toggled and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
        })
        if callback then callback(toggled) end
    end)
    
    return frame
end

function NexusUI:AddSlider(text, min, max, default, callback)
    local value = default or min
    
    local frame = Instance.new("Frame")
    frame.Name = "Slider"
    frame.Size = UDim2.new(1, 0, 0, 50)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    frame.BorderSizePixel = 0
    frame.Parent = self.Container
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 0, 20)
    label.Position = UDim2.new(0, 10, 0, 5)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Size = UDim2.new(0, 50, 0, 20)
    valueLabel.Position = UDim2.new(1, -60, 0, 5)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(value)
    valueLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
    valueLabel.Font = Enum.Font.GothamBold
    valueLabel.TextSize = 12
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.Parent = frame
    
    local sliderBack = Instance.new("Frame")
    sliderBack.Size = UDim2.new(1, -20, 0, 4)
    sliderBack.Position = UDim2.new(0, 10, 1, -14)
    sliderBack.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
    sliderBack.BorderSizePixel = 0
    sliderBack.Parent = frame
    
    local sliderBackCorner = Instance.new("UICorner")
    sliderBackCorner.CornerRadius = UDim.new(1, 0)
    sliderBackCorner.Parent = sliderBack
    
    local sliderFill = Instance.new("Frame")
    sliderFill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(80, 150, 255)
    sliderFill.BorderSizePixel = 0
    sliderFill.Parent = sliderBack
    
    local sliderFillCorner = Instance.new("UICorner")
    sliderFillCorner.CornerRadius = UDim.new(1, 0)
    sliderFillCorner.Parent = sliderFill
    
    local sliderButton = Instance.new("TextButton")
    sliderButton.Size = UDim2.new(0, 14, 0, 14)
    sliderButton.Position = UDim2.new((value - min) / (max - min), -7, 0.5, -7)
    sliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderButton.BorderSizePixel = 0
    sliderButton.Text = ""
    sliderButton.Parent = sliderBack
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(1, 0)
    buttonCorner.Parent = sliderButton
    
    local dragging = false
    
    sliderButton.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local pos = math.clamp((input.Position.X - sliderBack.AbsolutePosition.X) / sliderBack.AbsoluteSize.X, 0, 1)
            value = math.floor(min + (max - min) * pos)
            
            sliderFill.Size = UDim2.new(pos, 0, 1, 0)
            sliderButton.Position = UDim2.new(pos, -7, 0.5, -7)
            valueLabel.Text = tostring(value)
            
            if callback then callback(value) end
        end
    end)
    
    return frame
end

function NexusUI:AddColorPicker(text, default, callback)
    local color = default or Color3.fromRGB(255, 255, 255)
    
    local frame = Instance.new("Frame")
    frame.Name = "ColorPicker"
    frame.Size = UDim2.new(1, 0, 0, 36)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    frame.BorderSizePixel = 0
    frame.Parent = self.Container
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -60, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local colorBox = Instance.new("TextButton")
    colorBox.Size = UDim2.new(0, 36, 0, 22)
    colorBox.Position = UDim2.new(1, -46, 0.5, -11)
    colorBox.BackgroundColor3 = color
    colorBox.BorderSizePixel = 0
    colorBox.Text = ""
    colorBox.Parent = frame
    
    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0, 4)
    boxCorner.Parent = colorBox
    
    colorBox.MouseButton1Click:Connect(function()
        local pickerFrame = Instance.new("Frame")
        pickerFrame.Size = UDim2.new(0, 200, 0, 150)
        pickerFrame.Position = UDim2.new(0.5, -100, 0.5, -75)
        pickerFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
        pickerFrame.BorderSizePixel = 0
        pickerFrame.ZIndex = 10
        pickerFrame.Parent = self.ScreenGui
        
        local pickerCorner = Instance.new("UICorner")
        pickerCorner.CornerRadius = UDim.new(0, 8)
        pickerCorner.Parent = pickerFrame
        
        local rLabel = Instance.new("TextLabel")
        rLabel.Size = UDim2.new(0, 15, 0, 20)
        rLabel.Position = UDim2.new(0, 10, 0, 10)
        rLabel.BackgroundTransparency = 1
        rLabel.Text = "R"
        rLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        rLabel.Font = Enum.Font.GothamBold
        rLabel.TextSize = 12
        rLabel.Parent = pickerFrame
        
        local rInput = Instance.new("TextBox")
        rInput.Size = UDim2.new(0, 50, 0, 20)
        rInput.Position = UDim2.new(0, 30, 0, 10)
        rInput.BackgroundColor3 = Color3.fromRGB(40, 40, 52)
        rInput.BorderSizePixel = 0
        rInput.Text = tostring(math.floor(color.R * 255))
        rInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        rInput.Font = Enum.Font.Gotham
        rInput.TextSize = 11
        rInput.Parent = pickerFrame
        
        local rCorner = Instance.new("UICorner")
        rCorner.CornerRadius = UDim.new(0, 4)
        rCorner.Parent = rInput
        
        local gLabel = Instance.new("TextLabel")
        gLabel.Size = UDim2.new(0, 15, 0, 20)
        gLabel.Position = UDim2.new(0, 10, 0, 40)
        gLabel.BackgroundTransparency = 1
        gLabel.Text = "G"
        gLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        gLabel.Font = Enum.Font.GothamBold
        gLabel.TextSize = 12
        gLabel.Parent = pickerFrame
        
        local gInput = Instance.new("TextBox")
        gInput.Size = UDim2.new(0, 50, 0, 20)
        gInput.Position = UDim2.new(0, 30, 0, 40)
        gInput.BackgroundColor3 = Color3.fromRGB(40, 40, 52)
        gInput.BorderSizePixel = 0
        gInput.Text = tostring(math.floor(color.G * 255))
        gInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        gInput.Font = Enum.Font.Gotham
        gInput.TextSize = 11
        gInput.Parent = pickerFrame
        
        local gCorner = Instance.new("UICorner")
        gCorner.CornerRadius = UDim.new(0, 4)
        gCorner.Parent = gInput
        
        local bLabel = Instance.new("TextLabel")
        bLabel.Size = UDim2.new(0, 15, 0, 20)
        bLabel.Position = UDim2.new(0, 10, 0, 70)
        bLabel.BackgroundTransparency = 1
        bLabel.Text = "B"
        bLabel.TextColor3 = Color3.fromRGB(100, 100, 255)
        bLabel.Font = Enum.Font.GothamBold
        bLabel.TextSize = 12
        bLabel.Parent = pickerFrame
        
        local bInput = Instance.new("TextBox")
        bInput.Size = UDim2.new(0, 50, 0, 20)
        bInput.Position = UDim2.new(0, 30, 0, 70)
        bInput.BackgroundColor3 = Color3.fromRGB(40, 40, 52)
        bInput.BorderSizePixel = 0
        bInput.Text = tostring(math.floor(color.B * 255))
        bInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        bInput.Font = Enum.Font.Gotham
        bInput.TextSize = 11
        bInput.Parent = pickerFrame
        
        local bCorner = Instance.new("UICorner")
        bCorner.CornerRadius = UDim.new(0, 4)
        bCorner.Parent = bInput
        
        local preview = Instance.new("Frame")
        preview.Size = UDim2.new(0, 90, 0, 80)
        preview.Position = UDim2.new(1, -100, 0, 10)
        preview.BackgroundColor3 = color
        preview.BorderSizePixel = 0
        preview.Parent = pickerFrame
        
        local previewCorner = Instance.new("UICorner")
        previewCorner.CornerRadius = UDim.new(0, 6)
        previewCorner.Parent = preview
        
        local confirmButton = Instance.new("TextButton")
        confirmButton.Size = UDim2.new(0, 80, 0, 28)
        confirmButton.Position = UDim2.new(0, 10, 1, -38)
        confirmButton.BackgroundColor3 = Color3.fromRGB(80, 150, 255)
        confirmButton.BorderSizePixel = 0
        confirmButton.Text = "Confirm"
        confirmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        confirmButton.Font = Enum.Font.GothamBold
        confirmButton.TextSize = 11
        confirmButton.Parent = pickerFrame
        
        local confirmCorner = Instance.new("UICorner")
        confirmCorner.CornerRadius = UDim.new(0, 5)
        confirmCorner.Parent = confirmButton
        
        local cancelButton = Instance.new("TextButton")
        cancelButton.Size = UDim2.new(0, 80, 0, 28)
        cancelButton.Position = UDim2.new(1, -90, 1, -38)
        cancelButton.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
        cancelButton.BorderSizePixel = 0
        cancelButton.Text = "Cancel"
        cancelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        cancelButton.Font = Enum.Font.GothamBold
        cancelButton.TextSize = 11
        cancelButton.Parent = pickerFrame
        
        local cancelCorner = Instance.new("UICorner")
        cancelCorner.CornerRadius = UDim.new(0, 5)
        cancelCorner.Parent = cancelButton
        
        local function updatePreview()
            local r = math.clamp(tonumber(rInput.Text) or 255, 0, 255)
            local g = math.clamp(tonumber(gInput.Text) or 255, 0, 255)
            local b = math.clamp(tonumber(bInput.Text) or 255, 0, 255)
            preview.BackgroundColor3 = Color3.fromRGB(r, g, b)
        end
        
        rInput:GetPropertyChangedSignal("Text"):Connect(updatePreview)
        gInput:GetPropertyChangedSignal("Text"):Connect(updatePreview)
        bInput:GetPropertyChangedSignal("Text"):Connect(updatePreview)
        
        confirmButton.MouseButton1Click:Connect(function()
            local r = math.clamp(tonumber(rInput.Text) or 255, 0, 255)
            local g = math.clamp(tonumber(gInput.Text) or 255, 0, 255)
            local b = math.clamp(tonumber(bInput.Text) or 255, 0, 255)
            color = Color3.fromRGB(r, g, b)
            colorBox.BackgroundColor3 = color
            if callback then callback(color) end
            pickerFrame:Destroy()
        end)
        
        cancelButton.MouseButton1Click:Connect(function()
            pickerFrame:Destroy()
        end)
    end)
    
    return frame
end

function NexusUI:AddDropdown(text, options, default, callback)
    local selected = default or options[1]
    local open = false
    
    local frame = Instance.new("Frame")
    frame.Name = "Dropdown"
    frame.Size = UDim2.new(1, 0, 0, 36)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true
    frame.Parent = self.Container
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -80, 0, 36)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local dropButton = Instance.new("TextButton")
    dropButton.Size = UDim2.new(0, 150, 0, 26)
    dropButton.Position = UDim2.new(1, -160, 0, 5)
    dropButton.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    dropButton.BorderSizePixel = 0
    dropButton.Text = selected
    dropButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    dropButton.Font = Enum.Font.Gotham
    dropButton.TextSize = 12
    dropButton.Parent = frame
    
    local dropCorner = Instance.new("UICorner")
    dropCorner.CornerRadius = UDim.new(0, 5)
    dropCorner.Parent = dropButton
    
    local arrow = Instance.new("TextLabel")
    arrow.Size = UDim2.new(0, 20, 1, 0)
    arrow.Position = UDim2.new(1, -20, 0, 0)
    arrow.BackgroundTransparency = 1
    arrow.Text = "v"
    arrow.TextColor3 = Color3.fromRGB(180, 180, 200)
    arrow.Font = Enum.Font.GothamBold
    arrow.TextSize = 12
    arrow.Parent = dropButton
    
    local optionsFrame = Instance.new("Frame")
    optionsFrame.Size = UDim2.new(0, 150, 0, 0)
    optionsFrame.Position = UDim2.new(1, -160, 0, 36)
    optionsFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
    optionsFrame.BorderSizePixel = 0
    optionsFrame.ClipsDescendants = true
    optionsFrame.Parent = frame
    
    local optionsCorner = Instance.new("UICorner")
    optionsCorner.CornerRadius = UDim.new(0, 5)
    optionsCorner.Parent = optionsFrame
    
    local optionsLayout = Instance.new("UIListLayout")
    optionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    optionsLayout.Parent = optionsFrame
    
    for i, option in ipairs(options) do
        local optionButton = Instance.new("TextButton")
        optionButton.Size = UDim2.new(1, 0, 0, 28)
        optionButton.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
        optionButton.BorderSizePixel = 0
        optionButton.Text = option
        optionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        optionButton.Font = Enum.Font.Gotham
        optionButton.TextSize = 11
        optionButton.Parent = optionsFrame
        
        optionButton.MouseEnter:Connect(function()
            optionButton.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
        end)
        
        optionButton.MouseLeave:Connect(function()
            optionButton.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
        end)
        
        optionButton.MouseButton1Click:Connect(function()
            selected = option
            dropButton.Text = option
            open = false
            createTween(optionsFrame, 0.2, {Size = UDim2.new(0, 150, 0, 0)})
            createTween(frame, 0.2, {Size = UDim2.new(1, 0, 0, 36)})
            createTween(arrow, 0.2, {Rotation = 0})
            if callback then callback(option) end
        end)
    end
    
    dropButton.MouseButton1Click:Connect(function()
        open = not open
        if open then
            local height = #options * 28
            createTween(optionsFrame, 0.2, {Size = UDim2.new(0, 150, 0, height)})
            createTween(frame, 0.2, {Size = UDim2.new(1, 0, 0, 36 + height + 5)})
            createTween(arrow, 0.2, {Rotation = 180})
        else
            createTween(optionsFrame, 0.2, {Size = UDim2.new(0, 150, 0, 0)})
            createTween(frame, 0.2, {Size = UDim2.new(1, 0, 0, 36)})
            createTween(arrow, 0.2, {Rotation = 0})
        end
    end)
    
    return frame
end

function NexusUI:AddTextBox(text, placeholder, callback)
    local frame = Instance.new("Frame")
    frame.Name = "TextBox"
    frame.Size = UDim2.new(1, 0, 0, 36)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    frame.BorderSizePixel = 0
    frame.Parent = self.Container
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 150, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(1, -180, 0, 26)
    textBox.Position = UDim2.new(0, 165, 0, 5)
    textBox.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    textBox.BorderSizePixel = 0
    textBox.Text = ""
    textBox.PlaceholderText = placeholder or "Enter text"
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
    textBox.Font = Enum.Font.Gotham
    textBox.TextSize = 12
    textBox.ClearTextOnFocus = false
    textBox.Parent = frame
    
    local textCorner = Instance.new("UICorner")
    textCorner.CornerRadius = UDim.new(0, 5)
    textCorner.Parent = textBox
    
    textBox.FocusLost:Connect(function(enterPressed)
        if callback then callback(textBox.Text) end
    end)
    
    return frame
end

function NexusUI:AddLabel(text)
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(1, 0, 0, 30)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(200, 200, 220)
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextWrapped = true
    label.Parent = self.Container
    
    return label
end

function NexusUI:Notify(title, message, duration)
    duration = duration or 3
    
    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(0, 300, 0, 0)
    notif.Position = UDim2.new(1, -320, 1, -20)
    notif.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
    notif.BorderSizePixel = 0
    notif.Parent = self.ScreenGui
    
    local notifCorner = Instance.new("UICorner")
    notifCorner.CornerRadius = UDim.new(0, 8)
    notifCorner.Parent = notif
    
    local accent = Instance.new("Frame")
    accent.Size = UDim2.new(0, 4, 1, 0)
    accent.BackgroundColor3 = Color3.fromRGB(80, 150, 255)
    accent.BorderSizePixel = 0
    accent.Parent = notif
    
    local accentCorner = Instance.new("UICorner")
    accentCorner.CornerRadius = UDim.new(0, 8)
    accentCorner.Parent = accent
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -20, 0, 20)
    titleLabel.Position = UDim2.new(0, 14, 0, 8)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 13
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = notif
    
    local messageLabel = Instance.new("TextLabel")
    messageLabel.Size = UDim2.new(1, -20, 0, 30)
    messageLabel.Position = UDim2.new(0, 14, 0, 28)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Text = message
    messageLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
    messageLabel.Font = Enum.Font.Gotham
    messageLabel.TextSize = 11
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextWrapped = true
    messageLabel.Parent = notif
    
    createTween(notif, 0.3, {Size = UDim2.new(0, 300, 0, 70)})
    
    wait(duration)
    
    createTween(notif, 0.3, {Position = UDim2.new(1, 20, 1, -20)})
    wait(0.3)
    notif:Destroy()
end

return NexusUI
