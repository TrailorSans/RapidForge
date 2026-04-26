local RapidForge = require(game:GetService("ReplicatedStorage"):WaitForChild("Library"):WaitForChild("RapidForge"))

local healthBar = RapidForge.waitFor(RapidForge.getGui("HUD"), "HealthBar")
local fill = RapidForge.waitFor(healthBar, "Fill")
local humanoid = RapidForge.getHumanoid()

local function updateBar()
	local hp = RapidForge.getHealth()
	local pct = RapidForge.clamp(hp / humanoid.MaxHealth, 0, 1)
	RapidForge.tweenObject(fill, { Size = UDim2.new(pct, 0, 1, 0) }, 0.2, Enum.EasingStyle.Quad)

	if pct < 0.25 then
		fill.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
	else
		fill.BackgroundColor3 = Color3.fromRGB(80, 200, 80)
	end
end

RapidForge.onEvent(humanoid, "HealthChanged", updateBar)
updateBar()
