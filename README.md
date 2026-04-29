# RapidForge

A lightweight Luau utility library for Roblox development.

## Getting Started

Require the main module at the top of your script:

```lua
local RapidForge = require(game:GetService("ReplicatedStorage"):WaitForChild("library"):WaitForChild("RapidForge"))
```

## Functions

All functions are documented inside the `docs/` folder. See the index below for a full overview.

## Docs

| File | Description |
|------|-------------|
| [docs/INDEX.md](docs/INDEX.md) | Full function index |
| [docs/GUI.md](docs/GUI.md) | GuiObject manipulation, visibility, cloning, theming |
| [docs/ANIMATION.md](docs/ANIMATION.md) | Fade, slide, and tween helpers |
| [docs/PLAYER.md](docs/PLAYER.md) | Local player, character, humanoid, inventory |
| [docs/WORLD.md](docs/WORLD.md) | Instance traversal, cloning, destruction, model utils |
| [docs/MATH.md](docs/MATH.md) | Lerp, clamp, random, distance, CFrame helpers |
| [docs/UTILITY.md](docs/UTILITY.md) | Debounce, throttle, table helpers, formatting |
| [docs/EVENTS.md](docs/EVENTS.md) | Event connection helpers |
| [docs/LOGGER.md](docs/LOGGER.md) | Structured logging |
| [docs/SERVICE.md](docs/SERVICE.md) | Service indexing |
| [docs/AUDIO.md](docs/AUDIO.md) | Background music, playback, volume, and fade. |

## Examples

| File | Description |
|------|-------------|
| [examples/healthbar.md](examples/healthbar.md) | Healthbar with RapidForge |
| [examples/ChestInteraction.md](examples/ChestInteraction.md) | Chest Interactions with RapidForge |
| [examples/EnemySpawner.md](examples/EnemySpawner.md) | Enemy Spawning with RapidForge |
| [examples/LeaderboardGui.md](examples/LeaderboardGui.md) | Guis with RapidForge |

## Project

| File | Description |
|------|-------------|
| [meta/CHANGELOG.md](meta/CHANGELOG.md) | Version history and release notes |
| [meta/TODO.md](meta/TODO.md) | Planned functions and improvements |
| [meta/contributing.md](meta/contributing.md) | How to contribute to RapidForge |
| [meta/architecture.md](meta/architecture.md) | RapidForge's architecture |

## Adding Your Own Functions

1. Create a new `ModuleScript` inside the `Library` folder with a unique name.
2. Open `RapidForge.lua` and register it:

```lua
RapidForge.YourFunction = require(Library.YourFunction)
```

If your module exposes multiple functions:

```lua
local yourModule = require(Library.YourModule)
RapidForge.SubFunctionA = yourModule.SubFunctionA
RapidForge.SubFunctionB = yourModule.SubFunctionB
```

## Contributing

Have a suggestion or want to share a function? Post it in the <a href="https://www.roblox.com/communities/418459103/RapidTools-Development#!/about">Community Forums</a>.

## License

Released into the public domain under the [CC0 1.0 Universal](LICENSE).
