local function getDescendantsOfClass(parent, className)
	local results = {}
	for _, descendant in ipairs(parent:GetDescendants()) do
		if descendant:IsA(className) then
			table.insert(results, descendant)
		end
	end
	return results
end

local function findFirstAncestorOfClass(instance, className)
	local current = instance.Parent
	while current do
		if current:IsA(className) then
			return current
		end
		current = current.Parent
	end
	return nil
end

local function destroyAfter(instance, seconds)
	task.delay(seconds, function()
		if instance and instance.Parent then
			instance:Destroy()
		end
	end)
end

local function isDescendantOf(instance, parent)
	return instance:IsDescendantOf(parent)
end

local function cloneAt(template, cframe)
	local clone = template:Clone()
	clone:PivotTo(cframe)
	clone.Parent = workspace
	return clone
end

local function setAllProperties(parent, className, properties)
	for _, child in ipairs(parent:GetChildren()) do
		if child:IsA(className) then
			for prop, value in pairs(properties) do
				child[prop] = value
			end
		end
	end
end

local function countDescendants(parent, className)
	local count = 0
	for _, descendant in ipairs(parent:GetDescendants()) do
		if descendant:IsA(className) then
			count += 1
		end
	end
	return count
end

local function getRandomChild(parent)
	local children = parent:GetChildren()
	if #children == 0 then return nil end
	return children[math.random(1, #children)]
end

local function moveToSurface(part, targetPart)
	local targetCFrame = targetPart.CFrame
	local targetSize = targetPart.Size
	local partSize = part.Size
	part.CFrame = targetCFrame * CFrame.new(0, (targetSize.Y / 2) + (partSize.Y / 2), 0)
end

local function getModelSize(model)
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