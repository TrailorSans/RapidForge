# TODO

## Functions to Add

### GUI
- [ ] `animateSlideOut(instance, direction, duration)` - slide a GuiObject out to a direction
- [ ] `setEnabled(instance, bool)` - toggle Interactable on a GuiButton
- [ ] `pulseObject(instance, scale, duration)` - briefly scale a GuiObject up and back

### Player
- [X] `onDied(callback)` - fire a callback when the local player dies
- [ ] `onRespawned(callback)` - fire a callback when the local player respawns
- [ ] `getLeaderstat(name)` - return a single leaderstat value by name

### World / Instances
- [ ] `tagInstance(instance, tag)` - add a CollectionService tag to an instance
- [ ] `untagInstance(instance, tag)` - remove a CollectionService tag from an instance
- [ ] `getTagged(tag)` - return all instances with a given CollectionService tag
- [ ] `waitForClass(parent, className, timeout)` - wait for a child of a given class

### Math / CFrame
- [X] `randomVector(min, max)` - return a random Vector3 within a range
- [ ] `oscillate(t, speed, amplitude)` - return a sine-wave value over time

### Utility
- [ ] `truncate(str, maxLength)` - cut a string to a max length with ellipsis
- [ ] `startsWith(str, prefix)` - check if a string starts with a prefix
- [ ] `endsWith(str, suffix)` - check if a string ends with a suffix
- [ ] `padLeft(str, length, char)` - pad a string on the left to a given length
- [ ] `sign(number)` - return 1, -1, or 0 based on the sign of a number

### Audio
- [X] audioService
