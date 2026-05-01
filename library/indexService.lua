local RunService = game:GetService("RunService")

return function(name: string): Instance?
	if RunService:IsServer() then
		return game:GetService(name)
	end
	local success, service = pcall(function()
		return game:GetService(name)
	end)
	if success then return service end
	return nil
end
