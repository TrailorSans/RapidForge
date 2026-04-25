# GUI

Helpers for finding, modifying, and managing GuiObjects.

---

### `getGui(name)`

Returns a ScreenGui by name from the local player's PlayerGui.

| | |
|---|---|
| **Parameters** | `name: string` |
| **Returns** | `ScreenGui?` |

```lua
local hud = RapidForge.getGui("HUD")
```

---

### `setVisible(instance, bool)`

Sets the `Visible` property on any GuiObject.

| | |
|---|---|
| **Parameters** | `instance: GuiObject`, `bool: boolean` |

```lua
RapidForge.setVisible(frame, false)
```

---

### `clearChildren(parent)`

Destroys all children of a GuiObject.

| | |
|---|---|
| **Parameters** | `parent: GuiObject` |

```lua
RapidForge.clearChildren(listFrame)
```

---

### `cloneInto(template, parent)`

Clones a template instance and parents it to the given parent. Returns the clone.

| | |
|---|---|
| **Parameters** | `template: Instance`, `parent: Instance` |
| **Returns** | `Instance` |

```lua
local row = RapidForge.cloneInto(template, scrollFrame)
```

---

### `setTextAll(parent, text)`

Sets `Text` on all `TextLabel`, `TextButton`, and `TextBox` descendants inside a parent.

| | |
|---|---|
| **Parameters** | `parent: Instance`, `text: string` |

```lua
RapidForge.setTextAll(dialog, "")
```

---

### `centerObject(instance)`

Sets `AnchorPoint` to `(0.5, 0.5)` and `Position` to `UDim2.new(0.5, 0, 0.5, 0)`.

| | |
|---|---|
| **Parameters** | `instance: GuiObject` |

```lua
RapidForge.centerObject(popup)
```

---

### `setTheme(instance, theme)`

Applies a color theme table to a GuiObject and all its descendants. Only sets properties that exist on each descendant's class.

| | |
|---|---|
| **Parameters** | `instance: GuiObject`, `theme: table` |

Supported theme keys:

| Key | Applies to |
|-----|-----------|
| `BackgroundColor3` | All `GuiObject` descendants |
| `TextColor3` | `TextLabel`, `TextButton`, `TextBox` |

```lua
RapidForge.setTheme(frame, {
    BackgroundColor3 = Color3.fromRGB(30, 30, 30),
    TextColor3 = Color3.fromRGB(255, 255, 255),
})
```