local library = game:GetService("ReplicatedStorage"):WaitForChild("library")

local RapidForge = {}

RapidForge.indexGui = require(Library.indexGui)
RapidForge.tweenObject = require(Library.tweenObject)
RapidForge.onEvent = require(Library.onEvent)
RapidForge.waitFor = require(Library.waitFor)
RapidForge.Logger = require(Library.logger)
RapidForge.indexService = require(Library.indexService)

local playerUtils = require(Library.playerUtils)
RapidForge.getPlayer = playerUtils.getPlayer
RapidForge.getCharacter = playerUtils.getCharacter
RapidForge.getUserId = playerUtils.getUserId
RapidForge.getDisplayName = playerUtils.getDisplayName
RapidForge.isAlive = playerUtils.isAlive
RapidForge.getHumanoid = playerUtils.getHumanoid
RapidForge.getRootPart = playerUtils.getRootPart
RapidForge.getHealth = playerUtils.getHealth
RapidForge.getTeam = playerUtils.getTeam
RapidForge.getTool = playerUtils.getTool
RapidForge.getBackpack = playerUtils.getBackpack
RapidForge.getLeaderstats = playerUtils.getLeaderstats

local guiUtils = require(Library.guiUtils)
RapidForge.getGui = guiUtils.getGui
RapidForge.setVisible = guiUtils.setVisible
RapidForge.clearChildren = guiUtils.clearChildren
RapidForge.cloneInto = guiUtils.cloneInto
RapidForge.setTextAll = guiUtils.setTextAll
RapidForge.animateFadeIn = guiUtils.animateFadeIn
RapidForge.animateFadeOut = guiUtils.animateFadeOut
RapidForge.animateSlideIn = guiUtils.animateSlideIn
RapidForge.centerObject = guiUtils.centerObject
RapidForge.setTheme = guiUtils.setTheme

local worldUtils = require(Library.worldUtils)
RapidForge.getDescendantsOfClass = worldUtils.getDescendantsOfClass
RapidForge.findFirstAncestorOfClass = worldUtils.findFirstAncestorOfClass
RapidForge.destroyAfter = worldUtils.destroyAfter
RapidForge.isDescendantOf = worldUtils.isDescendantOf
RapidForge.cloneAt = worldUtils.cloneAt
RapidForge.setAllProperties = worldUtils.setAllProperties
RapidForge.countDescendants = worldUtils.countDescendants
RapidForge.getRandomChild = worldUtils.getRandomChild
RapidForge.moveToSurface = worldUtils.moveToSurface
RapidForge.getModelSize = worldUtils.getModelSize

local mathUtils = require(Library.mathUtils)
RapidForge.lerp = mathUtils.lerp
RapidForge.clamp = mathUtils.clamp
RapidForge.roundTo = mathUtils.roundTo
RapidForge.randomFloat = mathUtils.randomFloat
RapidForge.randomInt = mathUtils.randomInt
RapidForge.distanceBetween = mathUtils.distanceBetween
RapidForge.lookAtCFrame = mathUtils.lookAtCFrame
RapidForge.flattenVector = mathUtils.flattenVector
RapidForge.angleToTarget = mathUtils.angleToTarget
RapidForge.isInRange = mathUtils.isInRange

local utilityUtils = require(Library.utilityUtils)
RapidForge.debounce = utilityUtils.debounce
RapidForge.retry = utilityUtils.retry
RapidForge.formatNumber = utilityUtils.formatNumber
RapidForge.formatTime = utilityUtils.formatTime
RapidForge.tableContains = utilityUtils.tableContains
RapidForge.tableKeys = utilityUtils.tableKeys
RapidForge.tableLength = utilityUtils.tableLength
RapidForge.merge = utilityUtils.merge
RapidForge.deepCopy = utilityUtils.deepCopy
RapidForge.throttle = utilityUtils.throttle
RapidForge.once = utilityUtils.once

return RapidForge
