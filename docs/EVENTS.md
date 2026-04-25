# Events

Functions for connecting to instance events.

---

## `onEvent(instance, event, callback)`

Connects a callback function to an event on an instance. This is a thin wrapper around `:Connect()`.

**Parameters**

| Name | Type | Description |
|---|---|---|
| `instance` | Instance | The instance that owns the event |
| `event` | string | The name of the event as a string |
| `callback` | function | The function to call when the event fires |

**Returns** `RBXScriptConnection`

**Example**

```lua
RapidForge.onEvent(button, "MouseButton1Click", function()
    print("Button clicked")
end)
```

You can store the connection to disconnect it later:

```lua
local connection = RapidForge.onEvent(part, "Touched", function(hit)
    print(hit.Name)
end)

connection:Disconnect()
```