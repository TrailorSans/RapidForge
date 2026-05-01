local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local log = require(script.Parent.internalLogger)

local function getGui(name: string): ScreenGui?
	local playerGui = Players.LocalPlayer and Players.LocalPlayer:FindFirstChild("PlayerGui")
	if playerGui then
		local found = playerGui:FindFirstChild(name)
		if found then return found :: ScreenGui end
	end
	return nil
end

local function setVisible(instance: GuiObject, bool: boolean): ()
	instance.Visible = bool
end

local function clearChildren(parent: GuiObject): ()
	for _, child in ipairs(parent:GetChildren()) do
		child:Destroy()
	end
end

local function cloneInto(template: Instance, parent: Instance): Instance
	local clone = template:Clone()
	clone.Parent = parent
	return clone
end

local function setTextAll(parent: Instance, text: string): ()
	for _, descendant in ipairs(parent:GetDescendants()) do
		if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
			(descendant :: TextLabel).Text = text
		end
	end
end

local function animateFadeIn(instance: GuiObject, duration: number?): Tween
	instance.BackgroundTransparency = 1
	instance.Visible = true
	local info = TweenInfo.new(duration or 0.3, Enum.EasingStyle.Linear)
	local tween = TweenService:Create(instance, info, { BackgroundTransparency = 0 })
	tween:Play()
	return tween
end

local function animateFadeOut(instance: GuiObject, duration: number?): Tween
	local info = TweenInfo.new(duration or 0.3, Enum.EasingStyle.Linear)
	local tween = TweenService:Create(instance, info, { BackgroundTransparency = 1 })
	tween:Play()
	tween.Completed:Connect(function()
		instance.Visible = false
	end)
	return tween
end

local function animateSlideIn(instance: GuiObject, direction: string, duration: number?): Tween?
	local originalPosition = instance.Position
	local offset: UDim2

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
		return nil
	end

	instance.Position = offset
	instance.Visible = true

	local info = TweenInfo.new(duration or 0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tween = TweenService:Create(instance, info, { Position = originalPosition })
	tween:Play()
	return tween
end

local function centerObject(instance: GuiObject): ()
	instance.AnchorPoint = Vector2.new(0.5, 0.5)
	instance.Position = UDim2.new(0.5, 0, 0.5, 0)
end

type Theme = {
	BackgroundColor3: Color3?,
	TextColor3: Color3?,
}

local function setTheme(instance: GuiObject, theme: Theme): ()
	if theme.BackgroundColor3 and instance:IsA("GuiObject") then
		instance.BackgroundColor3 = theme.BackgroundColor3
	end
	if theme.TextColor3 and (instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox")) then
		(instance :: TextLabel).TextColor3 = theme.TextColor3
	end
	for _, descendant in ipairs(instance:GetDescendants()) do
		if theme.BackgroundColor3 and descendant:IsA("GuiObject") then
			(descendant :: GuiObject).BackgroundColor3 = theme.BackgroundColor3
		end
		if theme.TextColor3 and (descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox")) then
			(descendant :: TextLabel).TextColor3 = theme.TextColor3
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
