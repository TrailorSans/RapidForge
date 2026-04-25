local Players = game:GetService("Players")

local function getPlayer()
	return Players.LocalPlayer
end

local function getCharacter()
	local player = Players.LocalPlayer
	if not player then return nil end
	return player.Character or player.CharacterAdded:Wait()
end

return {
	getPlayer = getPlayer,
	getCharacter = getCharacter
}