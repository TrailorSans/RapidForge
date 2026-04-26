# Logger

Structured logging with levels and per-instance prefixes.

---

### `Logger.new(prefix?)`

Creates a new logger instance. The prefix appears in every message from that logger.

| | |
|---|---|
| **Parameters** | `prefix?: string` |
| **Returns** | `Logger` |

```lua
local log = RapidForge.Logger.new("Shop")
```

---

### `Logger.setMinLevel(level)`

Sets the global minimum log level. Messages below this level are silently ignored.

| | |
|---|---|
| **Parameters** | `level: string` — `"debug"`, `"info"`, `"warn"`, `"error"` |

```lua
RapidForge.Logger.setMinLevel("warn") -- hides debug and info
```

Level order: `debug < info < warn < error`

Default minimum level is `"info"`.

---

### `logger:debug(...)`

Prints a debug message. Ignored unless min level is `"debug"`.

```lua
log:debug("cache hit", itemId)
```

---

### `logger:info(...)`

Prints an info message.

```lua
log:info("player purchased", itemName)
```

---

### `logger:warn(...)`

Emits a warning via Roblox `warn()`.

```lua
log:warn("item not found", itemId)
```

---

### `logger:error(...)`

Throws an error via Roblox `error()`.

```lua
log:error("critical failure in purchase flow")
```

---

### Example

```lua
local log = RapidForge.Logger.new("Combat")

log:info("round started")
log:debug("tick", os.clock())
log:warn("player health low", hp)
log:error("humanoid missing")
```

Output:
```
[Combat] [INFO] round started
[Combat] [WARN] player health low 12
```
