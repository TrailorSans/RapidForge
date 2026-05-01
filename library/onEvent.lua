return function(instance: Instance, event: string, callback: (...any) -> ()): RBXScriptConnection
	return instance[event]:Connect(callback)
end
