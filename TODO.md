# TODO
## Functions to Add
### GUI
- [x] `getGui(name)` - shorthand to get a ScreenGui by name
- [x] `setVisible(instance, bool)` - toggle Visible on any GuiObject
- [x] `clearChildren(parent)` - destroy all children of a GuiObject
- [x] `cloneInto(template, parent)` - clone a template and parent it
- [x] `setTextAll(parent, text)` - set Text on all TextLabels inside a parent
- [x] `animateFadeIn(instance, duration)` - fade a GuiObject in
- [x] `animateFadeOut(instance, duration)` - fade a GuiObject out
- [x] `animateSlideIn(instance, direction, duration)` - slide a GuiObject in from a direction
- [x] `centerObject(instance)` - set AnchorPoint and Position to center a GuiObject
- [x] `setTheme(instance, theme)` - apply a color theme table to a GuiObject and its children
### Player
- [x] `getUserId()` - return the local player's UserId
- [x] `getDisplayName()` - return the local player's DisplayName
- [x] `isAlive()` - check if the local player's character is alive
- [x] `getHumanoid()` - return the Humanoid from the local character
- [x] `getRootPart()` - return the HumanoidRootPart from the local character
- [x] `getHealth()` - return current health of the local player
- [x] `getTeam()` - return the local player's current Team
- [x] `getTool()` - return the currently equipped Tool
- [x] `getBackpack()` - return the local player's Backpack
- [x] `getLeaderstats()` - return the leaderstats folder from a player
### World / Instances
- [x] `getDescendantsOfClass(parent, className)` - return all descendants matching a class
- [x] `findFirstAncestorOfClass(instance, className)` - walk up the tree to find an ancestor by class
- [x] `destroyAfter(instance, seconds)` - destroy an instance after a delay
- [x] `isDescendantOf(instance, parent)` - check if an instance is a descendant of a parent
- [x] `cloneAt(template, cframe)` - clone a model and place it at a CFrame
- [x] `setAllProperties(parent, className, properties)` - bulk-set properties on all matching children
- [x] `countDescendants(parent, className)` - count all descendants of a given class
- [x] `getRandomChild(parent)` - return a random child of an instance
- [x] `moveToSurface(part, targetPart)` - move a part on top of another part
- [x] `getModelSize(model)` - return the bounding box size of a Model
### Math / CFrame
- [x] `lerp(a, b, t)` - linear interpolation between two numbers
- [x] `clamp(value, min, max)` - clamp a number between min and max
- [x] `roundTo(value, decimals)` - round a number to N decimal places
- [x] `randomFloat(min, max)` - return a random float between min and max
- [x] `randomInt(min, max)` - return a random integer between min and max
- [x] `distanceBetween(partA, partB)` - return the distance between two parts
- [x] `lookAtCFrame(origin, target)` - return a CFrame looking from origin toward target
- [x] `flattenVector(vector)` - return a Vector3 with Y set to 0
- [x] `angleToTarget(origin, target)` - return the angle in degrees from origin to target
- [x] `isInRange(partA, partB, range)` - check if two parts are within a given distance
### Utility
- [x] `debounce(callback, cooldown)` - wrap a function with a cooldown
- [x] `retry(callback, attempts, interval)` - retry a function N times on failure
- [x] `formatNumber(number)` - format a large number with commas (e.g. 1,000,000)
- [x] `formatTime(seconds)` - convert seconds into a MM:SS string
- [x] `tableContains(tbl, value)` - check if a table contains a value
- [x] `tableKeys(tbl)` - return all keys of a table as an array
- [x] `tableLength(tbl)` - return the length of a dictionary table
- [x] `merge(tableA, tableB)` - merge two tables into one
- [x] `deepCopy(tbl)` - return a full deep copy of a table
- [x] `throttle(callback, interval)` - limit how often a function can be called