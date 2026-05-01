local Library = game:GetService("ReplicatedStorage"):WaitForChild("library")

local moduleMap = {
	indexGui     = Library.indexGui,
	tweenObject  = Library.tweenObject,
	onEvent      = Library.onEvent,
	waitFor      = Library.waitFor,
	Logger       = Library.logger,
	indexService = Library.indexService,
}

local subModuleMap = {
	playerUtils = {
		module = Library.playerUtils,
		keys = {
			"getPlayer", "getCharacter", "getUserId", "getDisplayName",
			"isAlive", "getHumanoid", "getRootPart", "getHealth",
			"getTeam", "getTool", "getBackpack", "getLeaderstats",
			"onDied", "onRespawned",
		},
	},
	guiUtils = {
		module = Library.guiUtils,
		keys = {
			"getGui", "setVisible", "clearChildren", "cloneInto",
			"setTextAll", "animateFadeIn", "animateFadeOut",
			"animateSlideIn", "centerObject", "setTheme",
		},
	},
	worldUtils = {
		module = Library.worldUtils,
		keys = {
			"getDescendantsOfClass", "findFirstAncestorOfClass", "destroyAfter",
			"isDescendantOf", "cloneAt", "setAllProperties", "countDescendants",
			"getRandomChild", "moveToSurface", "getModelSize",
		},
	},
	mathUtils = {
		module = Library.mathUtils,
		keys = {
			"lerp", "clamp", "roundTo", "randomFloat", "randomInt",
			"distanceBetween", "lookAtCFrame", "flattenVector",
			"angleToTarget", "isInRange", "randomVector",
		},
	},
	utilityUtils = {
		module = Library.utilityUtils,
		keys = {
			"debounce", "retry", "formatNumber", "formatTime",
			"tableContains", "tableKeys", "tableLength",
			"merge", "deepCopy", "throttle", "once",
		},
	},
	audioService = {
    	module = Library.audioService,
    	keys = {
        	"addToQueue", "clearQueue", "play", "stop", "pause",
        	"skip", "previous", "setVolume", "fadeIn", "fadeOut",
        	"setLooping", "setShuffle", "isPlaying", "getCurrent",
		},
	},
}

local keyToSubModule = {}
for modName, data in pairs(subModuleMap) do
	for _, key in ipairs(data.keys) do
		keyToSubModule[key] = modName
	end
end

local loadedModules = {}

local RapidForge = {}

setmetatable(RapidForge, {
	__index = function(t, key)
		if moduleMap[key] then
			local value = require(moduleMap[key])
			rawset(t, key, value)
			return value
		end

		local modName = keyToSubModule[key]
		if modName then
			if not loadedModules[modName] then
				loadedModules[modName] = require(subModuleMap[modName].module)
			end
			local mod = loadedModules[modName]
			for _, k in ipairs(subModuleMap[modName].keys) do
				rawset(t, k, mod[k])
			end
			return rawget(t, key)
		end

		return nil
	end,
})

return RapidForge
