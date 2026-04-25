# RapidForge Documentation

Welcome to the RapidForge documentation. RapidForge is a lightweight Luau utility library for Roblox.

## Requiring RapidForge

```lua
local RapidForge = require(game:GetService("ReplicatedStorage"):WaitForChild("Library"):WaitForChild("RapidForge"))
```

## Categories

| Category | Functions |
|---|---|
| [GUI](gui.md) | `indexGui`, `waitFor` |
| [Player](player.md) | `getPlayer`, `getCharacter` |
| [Animation](animation.md) | `tweenObject` |
| [Events](events.md) | `onEvent` |

## Extending RapidForge

To add your own function, create a new `ModuleScript` in the `Library` folder and register it in `RapidForge.lua`:

```lua
RapidForge.YourFunction = require(Library.YourFunction)
```

If your module exposes multiple functions:

```lua
local yourModule = require(Library.YourModule)
RapidForge.SubFunctionA = yourModule.SubFunctionA
RapidForge.SubFunctionB = yourModule.SubFunctionB
```

Have a suggestion? Post it in the <a href="https://www.roblox.com/communities/418459103/RapidTools-Development#!/about">Community Forums</a>.