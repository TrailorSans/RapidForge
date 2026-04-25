# Animation

Functions for animating instances.

---

## `tweenObject(instance, properties, duration?, easingStyle?, easingDirection?, repeats?, reverse?, delay?)`

Creates and immediately plays a tween on any instance. All parameters after `properties` are optional.

**Parameters**

| Name | Type | Default | Description |
|---|---|---|---|
| `instance` | Instance | required | The instance to tween |
| `properties` | table | required | A table of properties to animate |
| `duration` | number | `1` | Duration of the tween in seconds |
| `easingStyle` | Enum.EasingStyle | `Linear` | The easing style to use |
| `easingDirection` | Enum.EasingDirection | `Out` | The easing direction to use |
| `repeats` | number | `0` | How many times to repeat |
| `reverse` | boolean | `false` | Whether to reverse after each play |
| `delay` | number | `0` | Delay before the tween starts |

**Returns** `Tween`

**Example**

```lua
RapidForge.tweenObject(frame, { Size = UDim2.new(1, 0, 1, 0) }, 0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
```

You can also hold the returned tween to cancel or track it:

```lua
local tween = RapidForge.tweenObject(part, { Transparency = 1 }, 2)
tween.Completed:Connect(function()
    part:Destroy()
end)
```