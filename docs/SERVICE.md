# Services

Helper for retrieving Roblox services by name.

---

### `indexService(name)`

Returns a Roblox service by name. On the server, calls `game:GetService()` directly. On the client, wraps the call in a `pcall` to safely handle invalid service names.

| | |
|---|---|
| **Parameters** | `name: string` |
| **Returns** | `Instance?` |

```lua
local ReplicatedStorage = RapidForge.indexService("ReplicatedStorage")
```
