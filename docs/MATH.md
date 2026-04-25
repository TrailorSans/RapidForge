# Math / CFrame

Numeric helpers, random utilities, and CFrame shortcuts.

---

### `lerp(a, b, t)`

Linearly interpolates between two numbers.

| | |
|---|---|
| **Parameters** | `a: number`, `b: number`, `t: number` (0–1) |
| **Returns** | `number` |

```lua
local value = RapidForge.lerp(0, 100, 0.5) -- 50
```

---

### `clamp(value, min, max)`

Clamps a number between `min` and `max`.

| | |
|---|---|
| **Parameters** | `value: number`, `min: number`, `max: number` |
| **Returns** | `number` |

```lua
local safe = RapidForge.clamp(health, 0, 100)
```

---

### `roundTo(value, decimals)`

Rounds a number to N decimal places.

| | |
|---|---|
| **Parameters** | `value: number`, `decimals: number` |
| **Returns** | `number` |

```lua
local result = RapidForge.roundTo(3.14159, 2) -- 3.14
```

---

### `randomFloat(min, max)`

Returns a random float between `min` and `max`.

| | |
|---|---|
| **Parameters** | `min: number`, `max: number` |
| **Returns** | `number` |

```lua
local speed = RapidForge.randomFloat(10.0, 20.0)
```

---

### `randomInt(min, max)`

Returns a random integer between `min` and `max` inclusive.

| | |
|---|---|
| **Parameters** | `min: number`, `max: number` |
| **Returns** | `number` |

```lua
local roll = RapidForge.randomInt(1, 6)
```

---

### `distanceBetween(partA, partB)`

Returns the distance between two parts using their `Position`.

| | |
|---|---|
| **Parameters** | `partA: BasePart`, `partB: BasePart` |
| **Returns** | `number` |

```lua
local dist = RapidForge.distanceBetween(player.Character.HumanoidRootPart, target)
```

---

### `lookAtCFrame(origin, target)`

Returns a `CFrame` positioned at `origin` and facing `target`.

| | |
|---|---|
| **Parameters** | `origin: Vector3`, `target: Vector3` |
| **Returns** | `CFrame` |

```lua
local cf = RapidForge.lookAtCFrame(partA.Position, partB.Position)
```

---

### `flattenVector(vector)`

Returns a copy of `vector` with `Y` set to `0`. Useful for horizontal distance checks.

| | |
|---|---|
| **Parameters** | `vector: Vector3` |
| **Returns** | `Vector3` |

```lua
local flat = RapidForge.flattenVector(root.Velocity)
```

---

### `angleToTarget(origin, target)`

Returns the angle in degrees from `origin` to `target` on the XZ plane.

| | |
|---|---|
| **Parameters** | `origin: BasePart`, `target: BasePart` |
| **Returns** | `number` |

```lua
local angle = RapidForge.angleToTarget(root, enemy)
```

---

### `isInRange(partA, partB, range)`

Returns `true` if the distance between two parts is within `range`.

| | |
|---|---|
| **Parameters** | `partA: BasePart`, `partB: BasePart`, `range: number` |
| **Returns** | `boolean` |

```lua
if RapidForge.isInRange(root, chest, 10) then
    -- open chest
end
```