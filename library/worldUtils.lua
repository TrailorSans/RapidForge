local function getDescendantsOfClass(parent: Instance, className: string): {Instance}
	local results = {}
	for _, descendant in ipairs(parent:GetDescendants()) do
		if descendant:IsA(className) then
			table.insert(results, descendant)
		end
	end
	return results
end

local function findFirstAncestorOfClass(instance: Instance, className: string): Instance?
	local current = instance.Parent
	while current do
		if current:IsA(className) then
			return current
		end
		current = current.Parent
	end
	return nil
end

local function destroyAfter(instance: Instance, seconds: number): ()
	task.delay(seconds, function()
		if instance and instance.Parent then
			instance:Destroy()
		end
	end)
end

local function isDescendantOf(instance: Instance, parent: Instance): boolean
	return instance:IsDescendantOf(parent)
end

local function cloneAt(template: Model, cframe: CFrame): Model
	local clone = template:Clone()
	clone:PivotTo(cframe)
	clone.Parent = workspace
	return clone
end

local function setAllProperties(parent: Instance, className: string, properties: {[string]: any}): ()
	for _, child in ipairs(parent:GetChildren()) do
		if child:IsA(className) then
			for prop, value in pairs(properties) do
				(child :: any)[prop] = value
			end
		end
	end
end

local function countDescendants(parent: Instance, className: string): number
	local count = 0
	for _, descendant in ipairs(parent:GetDescendants()) do
		if descendant:IsA(className) then
			count += 1
		end
	end
	return count
end

local function getRandomChild(parent: Instance): Instance?
	local children = parent:GetChildren()
	if #children == 0 then return nil end
	return children[math.random(1, #children)]
end

local function moveToSurface(part: BasePart, targetPart: BasePart): ()
	local targetCFrame = targetPart.CFrame
	local targetSize = targetPart.Size
	local partSize = part.Size
	part.CFrame = targetCFrame * CFrame.new(0, (targetSize.Y / 2) + (partSize.Y / 2), 0)
end

local function getModelSize(model: Model): (Vector3, CFrame)
	local cf, size = model:GetBoundingBox()
	return size, cf
end

return {
	getDescendantsOfClass = getDescendantsOfClass,
	findFirstAncestorOfClass = findFirstAncestorOfClass,
	destroyAfter = destroyAfter,
	isDescendantOf = isDescendantOf,
	cloneAt = cloneAt,
	setAllProperties = setAllProperties,
	countDescendants = countDescendants,
	getRandomChild = getRandomChild,
	moveToSurface = moveToSurface,
	getModelSize = getModelSize,
}
