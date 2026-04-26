local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

return function(name)
	if RunService:IsClient() then
		local playerGui = Players.LocalPlayer and Players.LocalPlayer:FindFirstChild("PlayerGui")
		if playerGui then
			local found = playerGui:FindFirstChild(name, true)
			if found then return found end
		end
	end

	return StarterGui:FindFirstChild(name, true)
end