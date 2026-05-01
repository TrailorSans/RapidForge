local TweenService = game:GetService("TweenService")
local indexService = require(script.Parent.indexService)
local log = require(script.Parent.internalLogger)
local SoundService = indexService("SoundService")

local AudioService = {}

local queue = {}
local currentIndex = 0
local currentSound = nil
local looping = false
local shuffle = false
local playing = false

local function getNextIndex()
	if #queue == 0 then return nil end
	if shuffle then
		return math.random(1, #queue)
	end
	local next = currentIndex + 1
	if next > #queue then next = 1 end
	return next
end

local function playAtIndex(index)
	if not queue[index] then
		log:warn("audioService: no sound at index " .. tostring(index))
		return
	end
	if currentSound then
		currentSound:Stop()
	end
	currentIndex = index
	currentSound = queue[index]
	currentSound.Parent = SoundService
	currentSound:Play()
	playing = true
	currentSound.Ended:Connect(function()
		if not looping then
			local next = getNextIndex()
			if next then
				playAtIndex(next)
			else
				playing = false
			end
		else
			currentSound:Play()
		end
	end)
end

local function addToQueue(sound)
	if typeof(sound) ~= "Instance" or not sound:IsA("Sound") then
		log:warn("audioService.addToQueue: expected Sound, got " .. typeof(sound))
		return
	end
	table.insert(queue, sound)
end

local function clearQueue()
	queue = {}
	currentIndex = 0
end

local function play()
	if currentSound and not playing then
		currentSound:Play()
		playing = true
	elseif #queue > 0 then
		playAtIndex(currentIndex > 0 and currentIndex or 1)
	else
		log:warn("audioService.play: queue is empty")
	end
end

local function stop()
	if not currentSound then
		log:warn("audioService.stop: no active sound")
		return
	end
	currentSound:Stop()
	playing = false
end

local function pause()
	if not currentSound then
		log:warn("audioService.pause: no active sound")
		return
	end
	currentSound:Pause()
	playing = false
end

local function skip()
	local next = getNextIndex()
	if next then
		playAtIndex(next)
	else
		log:warn("audioService.skip: queue is empty")
	end
end

local function previous()
	if #queue == 0 then
		log:warn("audioService.previous: queue is empty")
		return
	end
	local prev = currentIndex - 1
	if prev < 1 then prev = #queue end
	playAtIndex(prev)
end

local function setVolume(volume)
	if not currentSound then
		log:warn("audioService.setVolume: no active sound")
		return
	end
	if type(volume) ~= "number" then
		log:warn("audioService.setVolume: expected number, got " .. type(volume))
		return
	end
	currentSound.Volume = math.clamp(volume, 0, 1)
end

local function fadeIn(duration, targetVolume)
	if not currentSound then
		log:warn("audioService.fadeIn: no active sound")
		return
	end
	currentSound.Volume = 0
	currentSound:Play()
	playing = true
	local info = TweenInfo.new(duration or 1, Enum.EasingStyle.Linear)
	TweenService:Create(currentSound, info, { Volume = targetVolume or 1 }):Play()
end

local function fadeOut(duration, callback)
	if not currentSound then
		log:warn("audioService.fadeOut: no active sound")
		return
	end
	if callback and type(callback) ~= "function" then
		log:warn("audioService.fadeOut: callback must be a function")
		return
	end
	local info = TweenInfo.new(duration or 1, Enum.EasingStyle.Linear)
	local tween = TweenService:Create(currentSound, info, { Volume = 0 })
	tween:Play()
	tween.Completed:Connect(function()
		currentSound:Stop()
		playing = false
		if callback then callback() end
	end)
end

local function setLooping(bool)
	if type(bool) ~= "boolean" then
		log:warn("audioService.setLooping: expected boolean, got " .. type(bool))
		return
	end
	looping = bool
end

local function setShuffle(bool)
	if type(bool) ~= "boolean" then
		log:warn("audioService.setShuffle: expected boolean, got " .. type(bool))
		return
	end
	shuffle = bool
end

local function isPlaying()
	return playing
end

local function getCurrent()
	return currentSound
end

return {
	addToQueue = addToQueue,
	clearQueue = clearQueue,
	play = play,
	stop = stop,
	pause = pause,
	skip = skip,
	previous = previous,
	setVolume = setVolume,
	fadeIn = fadeIn,
	fadeOut = fadeOut,
	setLooping = setLooping,
	setShuffle = setShuffle,
	isPlaying = isPlaying,
	getCurrent = getCurrent,
}
