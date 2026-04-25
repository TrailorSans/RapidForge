# GUI

Functions for finding and waiting on GUI elements.

---

## `indexGui(name)`

Searches for a GUI element by name. On the client, it searches `PlayerGui` first. If the element is not found there, it falls back to `StarterGui`. On the server, it searches `StarterGui` directly.

**Parameters**

| Name | Type | Description |
|---|---|---|
| `name` | string | The name of the GUI element to find |

**Returns** `Instance` or `nil`

**Example**

```lua
local frame = RapidForge.indexGui("MainFrame")
```

---

## `waitFor(parent, name, timeout?)`

Waits for a child to appear under `parent`. If the child is not found within the timeout, a warning is printed.

**Parameters**

| Name | Type | Default | Description |
|---|---|---|---|
| `parent` | Instance | required | The instance to search in |
| `name` | string | required | The name of the child to wait for |
| `timeout` | number | `10` | How long to wait in seconds |

**Returns** `Instance` or `nil`

**Example**

```lua
local button = RapidForge.waitFor(playerGui, "PlayButton", 5)
```