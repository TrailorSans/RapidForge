local Players = game:GetService("Players")

local function getPlayer()
	return Players.LocalPlayer
end

local function getCharacter()
	local player = Players.LocalPlayer
	if not player then return nil end
	return player.Character or player.CharacterAdded:Wait()
end

local function getUserId()
	local player = Players.LocalPlayer
	return player and player.UserId
end

local function getDisplayName()
	local player = Players.LocalPlayer
	return player and player.DisplayName
end

local function getHumanoid()
	local character = getCharacter()
	return character and character:FindFirstChildOfClass("Humanoid")
end

local function isAlive()
	local humanoid = getHumanoid()
	return humanoid ~= nil and humanoid.Health > 0
end

local function getRootPart()
	local character = getCharacter()
	return character and character:FindFirstChild("HumanoidRootPart")
end

local function getHealth()
	local humanoid = getHumanoid()
	return humanoid and humanoid.Health
end

local function getTeam()
	local player = Players.LocalPlayer
	return player and player.Team
end

local function getTool()
	local character = getCharacter()
	if not character then return nil end
	return character:FindFirstChildOfClass("Tool")
end

local function getBackpack()
	local player = Players.LocalPlayer
	return player and player:FindFirstChildOfClass("Backpack")
end

local function getLeaderstats(player)
	local target = player or Players.LocalPlayer
	return target and target:FindFirstChild("leaderstats")
end

local function onDied(callback)
	local player = Players.LocalPlayer
	if not player then return end

	local function connectDied(character)
		local humanoid = character:WaitForChild("Humanoid")
		humanoid.Died:Connect(callback)
	end

	if player.Character then
		connectDied(player.Character)
	end

	player.CharacterAdded:Connect(connectDied)
end

local function onRespawned(callback)
	local player = Players.LocalPlayer
	if not player then return end

	local firstCharacter = true

	player.CharacterAdded:Connect(function(character)
		if firstCharacter then
			firstCharacter = false
			return
		end
		callback(character)
	end)

	if player.Character then
		firstCharacter = false
	end
end

return {
	getPlayer = getPlayer,
	getCharacter = getCharacter,
	getUserId = getUserId,
	getDisplayName = getDisplayName,
	isAlive = isAlive,
	getHumanoid = getHumanoid,
	getRootPart = getRootPart,
	getHealth = getHealth,
	getTeam = getTeam,
	getTool = getTool,
	getBackpack = getBackpack,
	getLeaderstats = getLeaderstats,
	onDied = onDied,
	onRespawned = onRespawned,
}
