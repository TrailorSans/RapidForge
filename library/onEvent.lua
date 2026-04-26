return function(instance, event, callback)
	return instance[event]:Connect(callback)
end