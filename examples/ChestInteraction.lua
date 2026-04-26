local RapidForge = require(game:GetService("ReplicatedStorage"):WaitForChild("library"):WaitForChild("RapidForge"))
local RunService = game:GetService("RunService")

local CHEST_RANGE = 8
local chest = workspace:WaitForChild("Chest")
local prompt = RapidForge.waitFor(RapidForge.getGui("HUD"), "InteractPrompt")

local openChest = RapidForge.once(function()
	RapidForge.animateFadeOut(prompt, 0.2)
--	print("Chest opened!")
end)

RunService.RenderStepped:Connect(RapidForge.throttle(function()
	local root = RapidForge.getRootPart()
	if not root then return end

	if RapidForge.isInRange(root, chest, CHEST_RANGE) then
		prompt.Visible = true
	else
		prompt.Visible = false
	end
end, 0.1))

RapidForge.onEvent(chest, "Touched", function(hit)
	local root = RapidForge.getRootPart()
	if not root then return end
	if hit == root and RapidForge.isInRange(root, chest, CHEST_RANGE) then
		openChest()
	end
end)
