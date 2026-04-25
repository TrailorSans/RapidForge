# Events

Helpers for connecting to and managing Roblox events.

---

### `onEvent(instance, event, callback)`

Connects a callback to an event on an instance. A shorthand for `instance[event]:Connect(callback)`.

| | |
|---|---|
| **Parameters** | `instance: Instance`, `event: string`, `callback: function` |
| **Returns** | `RBXScriptConnection` |

```lua
local conn = RapidForge.onEvent(part, "Touched", function(hit)
    print(hit.Name)
end)
```

Store the returned connection to disconnect later:

```lua
conn:Disconnect()
```

---

### `waitFor(parent, name, timeout?)`

Waits for a child with the given name to appear under `parent`. Prints a warning if the timeout is reached without finding it.

| | |
|---|---|
| **Parameters** | `parent: Instance`, `name: string`, `timeout?: number = 10` |
| **Returns** | `Instance?` |

```lua
local button = RapidForge.waitFor(screenGui, "PlayButton", 5)
```