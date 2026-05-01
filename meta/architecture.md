# Architecture

RapidForge is organized as a single-entry module that aggregates several utility modules. All functions are exposed through one table so scripts only need one `require`.

```
root/
├── RapidForge.lua    <- entry point
└── Library/
    ├── logger.lua
    ├── internalLogger.lua
    ├── guiUtils.lua
    ├── playerUtils.lua
    ├── worldUtils.lua
    ├── mathUtils.lua
    ├── utilityUtils.lua
    ├── indexGui.lua
    ├── tweenObject.lua
    ├── onEvent.lua
    ├── waitFor.lua
    ├── audioService.lua
    └── indexService.lua
```

## Entry Point

`RapidForge.lua` requires each module and registers its functions onto the `RapidForge` table. Scripts never require sub-modules directly.

```lua
local RapidForge = require(game.ReplicatedStorage.Library.RapidForge)
RapidForge.getHealth()
RapidForge.lerp(0, 100, 0.5)
```

## Modules

| Module | Functions | Notes |
|---|---|---|
| `guiUtils` | `getGui`, `setVisible`, `clearChildren`, `cloneInto`, `setTextAll`, `animateFadeIn`, `animateFadeOut`, `animateSlideIn`, `centerObject`, `setTheme` | Client-only; depends on `TweenService` |
| `playerUtils` | `getPlayer`, `getCharacter`, `getUserId`, `getDisplayName`, `isAlive`, `getHumanoid`, `getRootPart`, `getHealth`, `getTeam`, `getTool`, `getBackpack`, `getLeaderstats` | Client-only; all target `Players.LocalPlayer` |
| `worldUtils` | `getDescendantsOfClass`, `findFirstAncestorOfClass`, `destroyAfter`, `isDescendantOf`, `cloneAt`, `setAllProperties`, `countDescendants`, `getRandomChild`, `moveToSurface`, `getModelSize` | Server- and client-safe |
| `mathUtils` | `lerp`, `clamp`, `roundTo`, `randomFloat`, `randomInt`, `distanceBetween`, `lookAtCFrame`, `flattenVector`, `angleToTarget`, `isInRange` | Pure functions, no Roblox services |
| `utilityUtils` | `debounce`, `throttle`, `once`, `retry`, `formatNumber`, `formatTime`, `tableContains`, `tableKeys`, `tableLength`, `merge`, `deepCopy` | Pure functions, no Roblox services |
| `indexGui` | *(standalone)* | Falls back to `StarterGui` on the server |
| `tweenObject` | *(standalone)* | Thin wrapper around `TweenService` |
| `onEvent` | *(standalone)* | Thin wrapper around `:Connect()` |
| `waitFor` | *(standalone)* | Thin wrapper around `WaitForChild` with a warning |

## Adding a Module

1. Create a new `ModuleScript` inside `Library/`.
2. Return a table of functions from it.
3. Register each function in `RapidForge.lua`:

```lua
local myModule = require(Library.myModule)
RapidForge.myFunction = myModule.myFunction
```

## Client vs. Server

`playerUtils` and `guiUtils` depend on `Players.LocalPlayer` and are client-only. `worldUtils`, `mathUtils`, and `utilityUtils` have no client/server restriction. `indexGui` checks `RunService:IsClient()` and degrades gracefully on the server.
