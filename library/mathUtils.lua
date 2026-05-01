local function lerp(a: number, b: number, t: number): number
	return a + (b - a) * t
end

local function clamp(value: number, min: number, max: number): number
	return math.clamp(value, min, max)
end

local function roundTo(value: number, decimals: number): number
	local factor = 10 ^ decimals
	return math.round(value * factor) / factor
end

local function randomFloat(min: number, max: number): number
	return min + math.random() * (max - min)
end

local function randomInt(min: number, max: number): number
	return math.random(min, max)
end

local function distanceBetween(partA: BasePart, partB: BasePart): number
	return (partA.Position - partB.Position).Magnitude
end

local function lookAtCFrame(origin: Vector3, target: Vector3): CFrame
	return CFrame.lookAt(origin, target)
end

local function flattenVector(vector: Vector3): Vector3
	return Vector3.new(vector.X, 0, vector.Z)
end

local function angleToTarget(origin: BasePart, target: BasePart): number
	local flat = flattenVector(target.Position - origin.Position)
	local angle = math.atan2(flat.X, flat.Z)
	return math.deg(angle)
end

local function isInRange(partA: BasePart, partB: BasePart, range: number): boolean
	return distanceBetween(partA, partB) <= range
end

local function randomVector(min: number, max: number): Vector3
	return Vector3.new(
		min + math.random() * (max - min),
		min + math.random() * (max - min),
		min + math.random() * (max - min)
	)
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
	randomVector = randomVector,
}
