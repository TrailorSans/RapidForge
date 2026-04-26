local RapidForge = require(game:GetService("ReplicatedStorage"):WaitForChild("library"):WaitForChild("RapidForge"))

local SPAWN_INTERVAL = 5
local MAX_ENEMIES = 10
local spawnPoints = workspace:WaitForChild("SpawnPoints")
local enemyTemplate = game:GetService("ReplicatedStorage"):WaitForChild("Enemy")

local function spawnEnemy()
	local count = RapidForge.countDescendants(workspace, "Enemy")
	if count >= MAX_ENEMIES then return end

	local point = RapidForge.getRandomChild(spawnPoints)
	if not point then return end

	local enemy = RapidForge.cloneAt(enemyTemplate, point.CFrame)
	RapidForge.destroyAfter(enemy, 30)
end

while true do
	task.wait(SPAWN_INTERVAL)
	spawnEnemy()
end
