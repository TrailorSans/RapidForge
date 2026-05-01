# Player
Helpers for accessing local player data, character, humanoid, and inventory.
All functions target `Players.LocalPlayer` unless stated otherwise.
---
### `getPlayer()`
Returns the local player.
| | |
|---|---|
| **Returns** | `Player` |
```lua
local player = RapidForge.getPlayer()
```
---
### `getCharacter()`
Returns the local player's character. Waits if it hasn't loaded yet.
| | |
|---|---|
| **Returns** | `Model` |
```lua
local character = RapidForge.getCharacter()
```
---
### `getUserId()`
Returns the local player's `UserId`.
| | |
|---|---|
| **Returns** | `number` |
```lua
local id = RapidForge.getUserId()
```
---
### `getDisplayName()`
Returns the local player's `DisplayName`.
| | |
|---|---|
| **Returns** | `string` |
```lua
local name = RapidForge.getDisplayName()
```
---
### `isAlive()`
Returns `true` if the local player's humanoid exists and has health above zero.
| | |
|---|---|
| **Returns** | `boolean` |
```lua
if RapidForge.isAlive() then
    -- safe to act
end
```
---
### `getHumanoid()`
Returns the `Humanoid` from the local character.
| | |
|---|---|
| **Returns** | `Humanoid?` |
```lua
local humanoid = RapidForge.getHumanoid()
```
---
### `getRootPart()`
Returns the `HumanoidRootPart` from the local character.
| | |
|---|---|
| **Returns** | `BasePart?` |
```lua
local root = RapidForge.getRootPart()
```
---
### `getHealth()`
Returns the current `Health` value of the local player's humanoid.
| | |
|---|---|
| **Returns** | `number?` |
```lua
local hp = RapidForge.getHealth()
```
---
### `getTeam()`
Returns the local player's current `Team`.
| | |
|---|---|
| **Returns** | `Team?` |
```lua
local team = RapidForge.getTeam()
```
---
### `getTool()`
Returns the `Tool` currently equipped by the local character, or `nil` if none.
| | |
|---|---|
| **Returns** | `Tool?` |
```lua
local tool = RapidForge.getTool()
```
---
### `getBackpack()`
Returns the local player's `Backpack`.
| | |
|---|---|
| **Returns** | `Backpack?` |
```lua
local backpack = RapidForge.getBackpack()
```
---
### `getLeaderstats(player?)`
Returns the `leaderstats` folder from a player. Defaults to the local player.
| | |
|---|---|
| **Parameters** | `player?: Player` |
| **Returns** | `Folder?` |
```lua
local stats = RapidForge.getLeaderstats()
local coins = stats and stats.Coins.Value
```
---
### `getLeaderstat(name, player?)`
Returns a single stat by name from the `leaderstats` folder. Defaults to the local player.
| | |
|---|---|
| **Parameters** | `name: string`, `player?: Player` |
| **Returns** | `ValueBase?` |
```lua
local stat = RapidForge.getLeaderstat("Coins")
if stat then
    print(stat.Value)
end
```
---
### `onDied(callback)`
Fires `callback` when the local player's humanoid dies. Reconnects automatically after each respawn.
| | |
|---|---|
| **Parameters** | `callback: function` |
```lua
RapidForge.onDied(function()
    print("player died")
end)
```
---
### `onRespawned(callback)`
Fires `callback` each time the local player respawns. The initial character load on join is ignored.
| | |
|---|---|
| **Parameters** | `callback: function (character: Model)` |
```lua
RapidForge.onRespawned(function(character)
    print("respawned", character.Name)
end)
```
