local Players = game:GetService("Players")

local function getPlayer(): Player?
	return Players.LocalPlayer
end

local function getCharacter(): Model?
	local player = Players.LocalPlayer
	if not player then return nil end
	return player.Character or player.CharacterAdded:Wait()
end

local function getUserId(): number?
	local player = Players.LocalPlayer
	return player and player.UserId
end

local function getDisplayName(): string?
	local player = Players.LocalPlayer
	return player and player.DisplayName
end

local function getHumanoid(): Humanoid?
	local character = getCharacter()
	return character and character:FindFirstChildOfClass("Humanoid") :: Humanoid?
end

local function isAlive(): boolean
	local humanoid = getHumanoid()
	return humanoid ~= nil and humanoid.Health > 0
end

local function getRootPart(): BasePart?
	local character = getCharacter()
	return character and character:FindFirstChild("HumanoidRootPart") :: BasePart?
end

local function getHealth(): number?
	local humanoid = getHumanoid()
	return humanoid and humanoid.Health
end

local function getTeam(): Team?
	local player = Players.LocalPlayer
	return player and player.Team
end

local function getTool(): Tool?
	local character = getCharacter()
	if not character then return nil end
	return character:FindFirstChildOfClass("Tool") :: Tool?
end

local function getBackpack(): Backpack?
	local player = Players.LocalPlayer
	return player and player:FindFirstChildOfClass("Backpack") :: Backpack?
end

local function getLeaderstats(player: Player?): Folder?
	local target = player or Players.LocalPlayer
	return target and target:FindFirstChild("leaderstats") :: Folder?
end

local function getLeaderstat(name: string, player: Player?): ValueBase?
	local leaderstats = getLeaderstats(player)
	if not leaderstats then return nil end
	return leaderstats:FindFirstChild(name) :: ValueBase?
end

local function onDied(callback: () -> ()): ()
	local player = Players.LocalPlayer
	if not player then return end
	local function connectDied(character: Model)
		local humanoid = character:WaitForChild("Humanoid") :: Humanoid
		humanoid.Died:Connect(callback)
	end
	if player.Character then
		connectDied(player.Character)
	end
	player.CharacterAdded:Connect(connectDied)
end

local function onRespawned(callback: (character: Model) -> ()): ()
	local player = Players.LocalPlayer
	if not player then return end
	local firstCharacter = true
	player.CharacterAdded:Connect(function(character: Model)
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
	getLeaderstat = getLeaderstat,
	onDied = onDied,
	onRespawned = onRespawned,
}
