local RapidForge = require(game:GetService("ReplicatedStorage"):WaitForChild("library"):WaitForChild("RapidForge"))
local Players = game:GetService("Players")

local leaderboard = RapidForge.waitFor(RapidForge.getGui("HUD"), "Leaderboard")
local list = RapidForge.waitFor(leaderboard, "List")
local rowTemplate = RapidForge.waitFor(leaderboard, "RowTemplate")

local function rebuild()
	RapidForge.clearChildren(list)

	for _, player in ipairs(Players:GetPlayers()) do
		local stats = RapidForge.getLeaderstats(player)
		local coins = stats and stats:FindFirstChild("Coins")

		local row = RapidForge.cloneInto(rowTemplate, list)
		row.NameLabel.Text = player.DisplayName
		row.CoinsLabel.Text = coins and RapidForge.formatNumber(coins.Value) or "0"
		row.Visible = true
	end
end

RapidForge.onEvent(Players, "PlayerAdded", rebuild)
RapidForge.onEvent(Players, "PlayerRemoving", rebuild)
rebuild()
