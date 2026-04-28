local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local indexService = require(script.Parent.indexService)
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
	if not queue[index] then return end

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

function AudioService.addToQueue(sound)
	table.insert(queue, sound)
end

function AudioService.clearQueue()
	queue = {}
	currentIndex = 0
end

function AudioService.play()
	if currentSound and not playing then
		currentSound:Play()
		playing = true
	elseif #queue > 0 then
		playAtIndex(currentIndex > 0 and currentIndex or 1)
	end
end

function AudioService.stop()
	if currentSound then
		currentSound:Stop()
		playing = false
	end
end

function AudioService.pause()
	if currentSound then
		currentSound:Pause()
		playing = false
	end
end

function AudioService.skip()
	local next = getNextIndex()
	if next then
		playAtIndex(next)
	end
end

function AudioService.previous()
	local prev = currentIndex - 1
	if prev < 1 then prev = #queue end
	playAtIndex(prev)
end

function AudioService.setVolume(volume)
	if currentSound then
		currentSound.Volume = math.clamp(volume, 0, 1)
	end
end

function AudioService.fadeIn(duration, targetVolume)
	if not currentSound then return end
	currentSound.Volume = 0
	currentSound:Play()
	playing = true
	local info = TweenInfo.new(duration or 1, Enum.EasingStyle.Linear)
	TweenService:Create(currentSound, info, { Volume = targetVolume or 1 }):Play()
end

function AudioService.fadeOut(duration, callback)
	if not currentSound then return end
	local info = TweenInfo.new(duration or 1, Enum.EasingStyle.Linear)
	local tween = TweenService:Create(currentSound, info, { Volume = 0 })
	tween:Play()
	tween.Completed:Connect(function()
		currentSound:Stop()
		playing = false
		if callback then callback() end
	end)
end

function AudioService.setLooping(bool)
	looping = bool
end

function AudioService.setShuffle(bool)
	shuffle = bool
end

function AudioService.isPlaying()
	return playing
end

function AudioService.getCurrent()
	return currentSound
end

return AudioService
