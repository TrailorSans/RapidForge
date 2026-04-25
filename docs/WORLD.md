# World / Instances

Helpers for traversing, modifying, and managing instances in the game world.

---

### `getDescendantsOfClass(parent, className)`

Returns all descendants of `parent` that match the given class name.

| | |
|---|---|
| **Parameters** | `parent: Instance`, `className: string` |
| **Returns** | `{Instance}` |

```lua
local parts = RapidForge.getDescendantsOfClass(workspace, "Part")
```

---

### `findFirstAncestorOfClass(instance, className)`

Walks up the instance tree and returns the first ancestor matching the given class.

| | |
|---|---|
| **Parameters** | `instance: Instance`, `className: string` |
| **Returns** | `Instance?` |

```lua
local model = RapidForge.findFirstAncestorOfClass(part, "Model")
```

---

### `destroyAfter(instance, seconds)`

Destroys an instance after a delay. Does nothing if the instance is already destroyed.

| | |
|---|---|
| **Parameters** | `instance: Instance`, `seconds: number` |

```lua
RapidForge.destroyAfter(effect, 3)
```

---

### `isDescendantOf(instance, parent)`

Returns `true` if `instance` is a descendant of `parent`.

| | |
|---|---|
| **Parameters** | `instance: Instance`, `parent: Instance` |
| **Returns** | `boolean` |

```lua
local inside = RapidForge.isDescendantOf(part, workspace.Map)
```

---

### `cloneAt(template, cframe)`

Clones a model and places it at the given `CFrame` using `:PivotTo()`. Parents the clone to `workspace`.

| | |
|---|---|
| **Parameters** | `template: Model`, `cframe: CFrame` |
| **Returns** | `Model` |

```lua
local spawned = RapidForge.cloneAt(Templates.Tree, CFrame.new(0, 0, 0))
```

---

### `setAllProperties(parent, className, properties)`

Bulk-sets properties on all direct children of `parent` that match `className`.

| | |
|---|---|
| **Parameters** | `parent: Instance`, `className: string`, `properties: table` |

```lua
RapidForge.setAllProperties(workspace.Platforms, "Part", {
    Anchored = true,
    CanCollide = false,
})
```

---

### `countDescendants(parent, className)`

Returns the count of all descendants of `parent` matching the given class.

| | |
|---|---|
| **Parameters** | `parent: Instance`, `className: string` |
| **Returns** | `number` |

```lua
local count = RapidForge.countDescendants(workspace, "SpawnLocation")
```

---

### `getRandomChild(parent)`

Returns a random direct child of `parent`. Returns `nil` if the parent has no children.

| | |
|---|---|
| **Parameters** | `parent: Instance` |
| **Returns** | `Instance?` |

```lua
local spot = RapidForge.getRandomChild(workspace.SpawnPoints)
```

---

### `moveToSurface(part, targetPart)`

Moves `part` so it sits flush on top of `targetPart` based on both parts' Y sizes.

| | |
|---|---|
| **Parameters** | `part: BasePart`, `targetPart: BasePart` |

```lua
RapidForge.moveToSurface(crate, platform)
```

---

### `getModelSize(model)`

Returns the bounding box size and CFrame of a model.

| | |
|---|---|
| **Parameters** | `model: Model` |
| **Returns** | `size: Vector3, cframe: CFrame` |

```lua
local size, cf = RapidForge.getModelSize(workspace.Castle)
```