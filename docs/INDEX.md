# RapidForge Docs

RapidForge is a lightweight Roblox utility library. Require it once and access all helpers through a single table.

```lua
local RapidForge = require(game.ReplicatedStorage.Library.RapidForge)
```

## Categories

| File | Description |
|------|-------------|
| [GUI.md](GUI.md) | GuiObject manipulation, visibility, cloning, theming |
| [ANIMATION.md](ANIMATION.md) | Fade, slide, and tween helpers |
| [PLAYER.md](PLAYER.md) | Local player, character, humanoid, inventory |
| [WORLD.md](WORLD.md) | Instance traversal, cloning, destruction, model utils |
| [MATH.md](MATH.md) | Lerp, clamp, random, distance, CFrame helpers |
| [UTILITY.md](UTILITY.md) | Debounce, throttle, table helpers, formatting |
| [EVENTS.md](EVENTS.md) | Event connection helpers |

## Conventions

- All functions are accessed via `RapidForge.*`
- All player functions target `Players.LocalPlayer` unless a `player` argument is specified
- Optional parameters are shown with a default value: `duration?: number = 0.3`
- Functions that return nothing are omitted from the Returns row