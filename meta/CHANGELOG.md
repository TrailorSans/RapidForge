# Changelog

All notable changes to RapidForge will be documented here.

---

## [r1] - 2026-04-25 <!--I'll never let AI write my changelog again -->

### Added

#### GUI
- `getGui(name)` - shorthand to get a ScreenGui by name from PlayerGui
- `setVisible(instance, bool)` - toggle Visible on any GuiObject
- `clearChildren(parent)` - destroy all children of a GuiObject
- `cloneInto(template, parent)` - clone a template and parent it to a target
- `setTextAll(parent, text)` - set Text on all TextLabels, TextButtons, and TextBoxes inside a parent
- `centerObject(instance)` - set AnchorPoint and Position to center a GuiObject on screen
- `setTheme(instance, theme)` - apply a color theme table to a GuiObject and all its descendants

#### Animation
- `animateFadeIn(instance, duration?)` - fade a GuiObject in via BackgroundTransparency tween
- `animateFadeOut(instance, duration?)` - fade a GuiObject out and set Visible to false on complete
- `animateSlideIn(instance, direction, duration?)` - slide a GuiObject in from a given direction
- `tweenObject(instance, properties, ...)` - low-level tween wrapper for any instance

#### Player
- `getPlayer()` - return the local player
- `getCharacter()` - return the local character, waiting if not yet loaded
- `getUserId()` - return the local player's UserId
- `getDisplayName()` - return the local player's DisplayName
- `isAlive()` - check if the local player's humanoid is alive
- `getHumanoid()` - return the Humanoid from the local character
- `getRootPart()` - return the HumanoidRootPart from the local character
- `getHealth()` - return the current health of the local player
- `getTeam()` - return the local player's current Team
- `getTool()` - return the currently equipped Tool
- `getBackpack()` - return the local player's Backpack
- `getLeaderstats(player?)` - return the leaderstats folder from a player

#### World
- `getDescendantsOfClass(parent, className)` - return all descendants matching a class
- `findFirstAncestorOfClass(instance, className)` - walk up the tree to find an ancestor by class
- `destroyAfter(instance, seconds)` - destroy an instance after a delay
- `isDescendantOf(instance, parent)` - check if an instance is a descendant of a parent
- `cloneAt(template, cframe)` - clone a model and place it at a CFrame
- `setAllProperties(parent, className, properties)` - bulk-set properties on all matching children
- `countDescendants(parent, className)` - count all descendants of a given class
- `getRandomChild(parent)` - return a random child of an instance
- `moveToSurface(part, targetPart)` - move a part on top of another part
- `getModelSize(model)` - return the bounding box size and CFrame of a model

#### Math
- `lerp(a, b, t)` - linear interpolation between two numbers
- `clamp(value, min, max)` - clamp a number between min and max
- `roundTo(value, decimals)` - round a number to N decimal places
- `randomFloat(min, max)` - return a random float between min and max
- `randomInt(min, max)` - return a random integer between min and max
- `distanceBetween(partA, partB)` - return the distance between two parts
- `lookAtCFrame(origin, target)` - return a CFrame looking from origin toward target
- `flattenVector(vector)` - return a Vector3 with Y set to 0
- `angleToTarget(origin, target)` - return the angle in degrees from origin to target
- `isInRange(partA, partB, range)` - check if two parts are within a given distance

#### Utility
- `debounce(callback, cooldown)` - wrap a function with a cooldown
- `throttle(callback, interval)` - limit how often a function can be called
- `retry(callback, attempts, interval?)` - retry a function N times on failure
- `formatNumber(number)` - format a large number with commas
- `formatTime(seconds)` - convert seconds into a MM:SS string
- `tableContains(tbl, value)` - check if a table contains a value
- `tableKeys(tbl)` - return all keys of a table as an array
- `tableLength(tbl)` - return the number of entries in a dictionary table
- `merge(tableA, tableB)` - merge two tables, with tableB overwriting tableA
- `deepCopy(tbl)` - return a full deep copy of a table

#### Events
- `onEvent(instance, event, callback)` - shorthand for instance[event]:Connect(callback)
- `waitFor(parent, name, timeout?)` - wait for a child to appear with an optional timeout
