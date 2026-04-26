local function lerp(a, b, t)
	return a + (b - a) * t
end

local function clamp(value, min, max)
	return math.clamp(value, min, max)
end

local function roundTo(value, decimals)
	local factor = 10 ^ decimals
	return math.round(value * factor) / factor
end

local function randomFloat(min, max)
	return min + math.random() * (max - min)
end

local function randomInt(min, max)
	return math.random(min, max)
end

local function distanceBetween(partA, partB)
	return (partA.Position - partB.Position).Magnitude
end

local function lookAtCFrame(origin, target)
	return CFrame.lookAt(origin, target)
end

local function flattenVector(vector)
	return Vector3.new(vector.X, 0, vector.Z)
end

local function angleToTarget(origin, target)
	local flat = flattenVector(target.Position - origin.Position)
	local angle = math.atan2(flat.X, flat.Z)
	return math.deg(angle)
end

local function isInRange(partA, partB, range)
	return distanceBetween(partA, partB) <= range
end

return {
	lerp = lerp,
	clamp = clamp,
	roundTo = roundTo,
	randomFloat = randomFloat,
	randomInt = randomInt,
	distanceBetween = distanceBetween,
	lookAtCFrame = lookAtCFrame,
	flattenVector = flattenVector,
	angleToTarget = angleToTarget,
	isInRange = isInRange,
}