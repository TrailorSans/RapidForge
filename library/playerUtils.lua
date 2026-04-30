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

	local function connectHumanoid(character)
		local humanoid = character:FindFirstChildOfClass("Humanoid")
			or character:WaitForChild("Humanoid", 10)
		if humanoid then
			humanoid.Died:Connect(callback)
		end
	end

	if player.Character then
		connectHumanoid(player.Character)
	end

	player.CharacterAdded:Connect(connectHumanoid)
end

local function onRespawned(callback)

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
}
