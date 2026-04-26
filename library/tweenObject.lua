local TweenService = game:GetService("TweenService")

return function(instance, properties, duration, easingStyle, easingDirection, repeats, reverse, delay)
	local info = TweenInfo.new(
		duration or 1,
		easingStyle or Enum.EasingStyle.Linear,
		easingDirection or Enum.EasingDirection.Out,
		repeats or 0,
		reverse or false,
		delay or 0
	)

	local tween = TweenService:Create(instance, info, properties)
	tween:Play()
	return tween
end