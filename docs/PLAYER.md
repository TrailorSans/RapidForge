# Player

Functions for accessing the local player and their character.

---

## `getPlayer()`

Returns `Players.LocalPlayer`.

**Returns** `Player` or `nil`

**Example**

```lua
local player = RapidForge.getPlayer()
print(player.Name)
```

---

## `getCharacter()`

Returns the local player's `Character`. If the character has not yet loaded, it waits for it. Returns `nil` if there is no local player.

**Returns** `Model` or `nil`

**Example**

```lua
local character = RapidForge.getCharacter()
local humanoid = character:FindFirstChild("Humanoid")
```