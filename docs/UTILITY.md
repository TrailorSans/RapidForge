# Utility

General-purpose helpers for function control, table manipulation, and formatting.

---

### `debounce(callback, cooldown)`

Wraps a function so it can only fire once per `cooldown` seconds. Subsequent calls within the cooldown window are ignored.

| | |
|---|---|
| **Parameters** | `callback: function`, `cooldown: number` |
| **Returns** | `function` |

```lua
local onTouch = RapidForge.debounce(function(hit)
    -- handle touch
end, 1)

part.Touched:Connect(onTouch)
```

---

### `throttle(callback, interval)`

Wraps a function so it fires at most once per `interval` seconds. Unlike debounce, calls between intervals are silently dropped.

| | |
|---|---|
| **Parameters** | `callback: function`, `interval: number` |
| **Returns** | `function` |

```lua
local onRender = RapidForge.throttle(function()
    -- update UI
end, 0.1)

RunService.RenderStepped:Connect(onRender)
```

> **debounce vs throttle:** Both limit call frequency. `debounce` resets its window on every call; `throttle` fires on a fixed interval and drops everything in between.

---

### `retry(callback, attempts, interval?)`

Calls `callback` up to `attempts` times using `pcall`. Stops and returns the result on the first success. Waits `interval` seconds between attempts.

| | |
|---|---|
| **Parameters** | `callback: function`, `attempts: number`, `interval?: number = 1` |
| **Returns** | `any?` |

```lua
local data = RapidForge.retry(function()
    return DataStore:GetAsync(key)
end, 3, 2)
```

---

### `formatNumber(number)`

Formats a number with comma separators.

| | |
|---|---|
| **Parameters** | `number: number` |
| **Returns** | `string` |

```lua
RapidForge.formatNumber(1000000) -- "1,000,000"
```

---

### `formatTime(seconds)`

Converts a number of seconds into a `MM:SS` string.

| | |
|---|---|
| **Parameters** | `seconds: number` |
| **Returns** | `string` |

```lua
RapidForge.formatTime(90)  -- "01:30"
RapidForge.formatTime(9)   -- "00:09"
```

---

### `tableContains(tbl, value)`

Returns `true` if `tbl` contains `value`. Uses sequential iteration, so it works on array-style tables.

| | |
|---|---|
| **Parameters** | `tbl: table`, `value: any` |
| **Returns** | `boolean` |

```lua
local allowed = {"admin", "mod", "owner"}
if RapidForge.tableContains(allowed, role) then
    -- grant access
end
```

---

### `tableKeys(tbl)`

Returns all keys of a dictionary table as an array.

| | |
|---|---|
| **Parameters** | `tbl: table` |
| **Returns** | `{any}` |

```lua
local keys = RapidForge.tableKeys({ a = 1, b = 2 }) -- {"a", "b"}
```

---

### `tableLength(tbl)`

Returns the number of entries in a dictionary table. Use this instead of `#` for non-sequential tables.

| | |
|---|---|
| **Parameters** | `tbl: table` |
| **Returns** | `number` |

```lua
local count = RapidForge.tableLength({ a = 1, b = 2, c = 3 }) -- 3
```

---

### `merge(tableA, tableB)`

Returns a new table containing all key-value pairs from both tables. Keys in `tableB` overwrite keys in `tableA`.

| | |
|---|---|
| **Parameters** | `tableA: table`, `tableB: table` |
| **Returns** | `table` |

```lua
local defaults = { speed = 16, jump = 50 }
local overrides = { speed = 24 }
local config = RapidForge.merge(defaults, overrides)
-- { speed = 24, jump = 50 }
```

---

### `deepCopy(tbl)`

Returns a full recursive copy of a table. Nested tables are copied by value, not by reference.

| | |
|---|---|
| **Parameters** | `tbl: table` |
| **Returns** | `table` |

```lua
local copy = RapidForge.deepCopy(originalConfig)
```

---

### `once(callback)`

Wraps a function so it can only ever fire once. All subsequent calls are ignored.

| | |
|---|---|
| **Parameters** | `callback: function` |
| **Returns** | `function` |

​```lua
local initialize = RapidForge.once(function()
    -- runs exactly one time
end)

part.Touched:Connect(initialize)
​```


