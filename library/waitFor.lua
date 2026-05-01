local log = require(script.Parent.internalLogger)

return function(parent: Instance, name: string, timeout: number?): Instance?
	local result = parent:WaitForChild(name, timeout or 10)
	if not result then
		log:warn("waitFor: '" .. name .. "' not found in '" .. parent.Name .. "'")
	end
	return result
end
