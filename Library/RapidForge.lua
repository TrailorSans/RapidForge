local Library = script.Parent

local RapidForge = {}

RapidForge.indexGui = require(Library.indexGui)
RapidForge.tweenObject = require(Library.tweenObject)
RapidForge.onEvent = require(Library.onEvent)
RapidForge.waitFor = require(Library.waitFor)

local playerUtils = require(Library.playerUtils)
RapidForge.getPlayer = playerUtils.getPlayer
RapidForge.getCharacter = playerUtils.getCharacter

return RapidForge