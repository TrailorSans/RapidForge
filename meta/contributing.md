# Contributing to RapidForge

Thanks for your interest in contributing. This document covers how to add functions, follow code conventions, and submit your work.

---

## Project Structure

```
library/          ModuleScripts loaded by RapidForge.lua
docs/             Markdown documentation for each category
meta/             Changelog, TODO, and project metadata
```

---

## Adding a Function

### 1. Pick the right module

| Category | File |
|----------|------|
| GUI / animation | `library/guiUtils.lua` |
| Player / character | `library/playerUtils.lua` |
| World / instances | `library/worldUtils.lua` |
| Math / CFrame | `library/mathUtils.lua` |
| Utility / tables | `library/utilityUtils.lua` |
| Audio | `library/audioService.lua` |

If your function doesn't fit any of these, create a new `ModuleScript` in `library/`.

### 2. Write the function

- Use `local function` declarations, not assignments to a table directly.
- Return a table at the bottom of the file with all exported functions.
- No unnecessary comments — only comment if the logic is genuinely non-obvious.

```lua
local function myFunction(param)
    -- only comment here if truly needed
    return param * 2
end

return {
    myFunction = myFunction,
}
```

### 3. Register it in `RapidForge.lua`

```lua
local myModule = require(Library.myModule)
RapidForge.myFunction = myModule.myFunction
```

### 4. Document it in the relevant `docs/*.md`

Follow the existing format exactly:

```markdown
### `myFunction(param)`

One sentence describing what it does.

| | |
|---|---|
| **Parameters** | `param: type` |
| **Returns** | `type` |

​```lua
local result = RapidForge.myFunction(value)
​```
```

If the function returns nothing, omit the **Returns** row.

### 5. Mark it in `meta/TODO.md`

Add a checked entry under the appropriate category:

```markdown
- [x] `myFunction(param)` - short description
```

---

## Code Conventions

- All functions must be accessible via `RapidForge.*`
- Optional parameters use a default in the implementation and are documented as `param?: type = default`
- Warn (don't error) on invalid input where recovery is possible — see `animateSlideIn` and `waitFor` for examples
- Do not use global state inside modules
- Client-only functions should guard with `Players.LocalPlayer` checks

---

## Submitting

Submit your [Pull request](https://github.com/StudlyCase/RapidForge/pulls).
If submitting a change to an existing function, describe what broke and why your fix is correct.
