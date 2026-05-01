local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local log = require(script.Parent.internalLogger)

local function getGui(name)
	local playerGui = Players.LocalPlayer and Players.LocalPlayer:FindFirstChild("PlayerGui")
	if playerGui then
		local found = playerGui:FindFirstChild(name)
		if found then return found end
	end
	return nil
end

local function setVisible(instance, bool)
	instance.Visible = bool
end

local function clearChildren(parent)
	for _, child in ipairs(parent:GetChildren()) do
		child:Destroy()
	end
end

local function cloneInto(template, parent)
	local clone = template:Clone()
	clone.Parent = parent
	return clone
end

local function setTextAll(parent, text)
	for _, descendant in ipairs(parent:GetDescendants()) do
		if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
			descendant.Text = text
		end
	end
end

local function animateFadeIn(instance, duration)
	instance.BackgroundTransparency = 1
	instance.Visible = true
	local info = TweenInfo.new(duration or 0.3, Enum.EasingStyle.Linear)
	local tween = TweenService:Create(instance, info, { BackgroundTransparency = 0 })
	tween:Play()
	return tween
end

local function animateFadeOut(instance, duration)
	local info = TweenInfo.new(duration or 0.3, Enum.EasingStyle.Linear)
	local tween = TweenService:Create(instance, info, { BackgroundTransparency = 1 })
	tween:Play()
	tween.Completed:Connect(function()
		instance.Visible = false
	end)
	return tween
end

local function animateSlideIn(instance, direction, duration)
	local originalPosition = instance.Position
	local offset

	if direction == "left" then
		offset = UDim2.new(originalPosition.X.Scale - 1, originalPosition.X.Offset, originalPosition.Y.Scale, originalPosition.Y.Offset)
	elseif direction == "right" then
		offset = UDim2.new(originalPosition.X.Scale + 1, originalPosition.X.Offset, originalPosition.Y.Scale, originalPosition.Y.Offset)
	elseif direction == "top" then
		offset = UDim2.new(originalPosition.X.Scale, originalPosition.X.Offset, originalPosition.Y.Scale - 1, originalPosition.Y.Offset)
	elseif direction == "bottom" then
		offset = UDim2.new(originalPosition.X.Scale, originalPosition.X.Offset, originalPosition.Y.Scale + 1, originalPosition.Y.Offset)
	else
		log:warn("animateSlideIn: invalid direction '" .. tostring(direction) .. "'")
		return
	end

	instance.Position = offset
	instance.Visible = true

	local info = TweenInfo.new(duration or 0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tween = TweenService:Create(instance, info, { Position = originalPosition })
	tween:Play()
	return tween
end

local function centerObject(instance)
	instance.AnchorPoint = Vector2.new(0.5, 0.5)
	instance.Position = UDim2.new(0.5, 0, 0.5, 0)
end

local function setTheme(instance, theme)
	if theme.BackgroundColor3 and instance:IsA("GuiObject") then
		instance.BackgroundColor3 = theme.BackgroundColor3
	end
	if theme.TextColor3 and (instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox")) then
		instance.TextColor3 = theme.TextColor3
	end
	for _, descendant in ipairs(instance:GetDescendants()) do
		if theme.BackgroundColor3 and descendant:IsA("GuiObject") then
			descendant.BackgroundColor3 = theme.BackgroundColor3
		end
		if theme.TextColor3 and (descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox")) then
			descendant.TextColor3 = theme.TextColor3
		end
	end
end

return {
	getGui = getGui,
	setVisible = setVisible,
	clearChildren = clearChildren,
	cloneInto = cloneInto,
	setTextAll = setTextAll,
	animateFadeIn = animateFadeIn,
	animateFadeOut = animateFadeOut,
	animateSlideIn = animateSlideIn,
	centerObject = centerObject,
	setTheme = setTheme,
}
