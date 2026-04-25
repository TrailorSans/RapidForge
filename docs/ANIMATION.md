# Animation

Tween-based animation helpers for GuiObjects.

---

### `animateFadeIn(instance, duration?)`

Fades a GuiObject in by tweening `BackgroundTransparency` from `1` to `0`. Sets `Visible` to `true` before playing.

| | |
|---|---|
| **Parameters** | `instance: GuiObject`, `duration?: number = 0.3` |
| **Returns** | `Tween` |

```lua
RapidForge.animateFadeIn(frame, 0.5)
```

---

### `animateFadeOut(instance, duration?)`

Fades a GuiObject out by tweening `BackgroundTransparency` to `1`. Sets `Visible` to `false` when complete.

| | |
|---|---|
| **Parameters** | `instance: GuiObject`, `duration?: number = 0.3` |
| **Returns** | `Tween` |

```lua
RapidForge.animateFadeOut(frame, 0.5)
```

---

### `animateSlideIn(instance, direction, duration?)`

Slides a GuiObject in from a given direction using its current `Position` as the target. Sets `Visible` to `true` before playing.

| | |
|---|---|
| **Parameters** | `instance: GuiObject`, `direction: string`, `duration?: number = 0.4` |
| **Returns** | `Tween` |

Valid directions: `"left"`, `"right"`, `"top"`, `"bottom"`

```lua
RapidForge.animateSlideIn(panel, "left", 0.4)
```

> **Note:** Set the GuiObject's final `Position` in Studio before calling this. The function reads that position as the slide target and offsets from it.

---

### `tweenObject(instance, properties, duration?, easingStyle?, easingDirection?, repeats?, reverse?, delay?)`

Low-level tween wrapper. Creates and plays a tween on any instance.

| | |
|---|---|
| **Parameters** | `instance: Instance`, `properties: table`, `duration?: number = 1`, `easingStyle?: Enum.EasingStyle = Linear`, `easingDirection?: Enum.EasingDirection = Out`, `repeats?: number = 0`, `reverse?: boolean = false`, `delay?: number = 0` |
| **Returns** | `Tween` |

```lua
RapidForge.tweenObject(frame, { Size = UDim2.new(1, 0, 1, 0) }, 0.5, Enum.EasingStyle.Quad)
```