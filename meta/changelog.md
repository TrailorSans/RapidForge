# Changelog

All notable changes to RapidForge will be documented here.

---

## [r2] - 2026-05-01 (Pre-Release)

### Changed
- `audioService` API is now flat (`RapidForge.play()` instead of `RapidForge.audioService.play()`)
- Internal `warn()` calls replaced with structured logger via `internalLogger`
- All library modules now have Luau type annotations

### Added
- Lazy loading via `__index` metamethod — modules are only loaded when first accessed
- `internalLogger` — shared internal logger instance used across all library modules
- `VERSION` constant accessible via `RapidForge.VERSION` — returns `"r2"`
- Input validation added to `audioService` functions

---

## [r1] - Initial Release

### Added
- `guiUtils` — GUI manipulation, visibility, cloning, theming, animations
- `playerUtils` — Local player, character, humanoid, inventory helpers
- `worldUtils` — Instance traversal, cloning, destruction, model utilities
- `mathUtils` — Lerp, clamp, random, distance, CFrame helpers
- `utilityUtils` — Debounce, throttle, once, retry, table helpers, formatting
- `audioService` — Background music queue, playback, volume, and fade support
- `logger` — Structured logging with levels and per-instance prefixes
- `indexGui` — GUI finder with PlayerGui and StarterGui fallback
- `indexService` — Safe Roblox service indexer
- `tweenObject` — Thin TweenService wrapper
- `onEvent` — Shorthand for event connections
- `waitFor` — WaitForChild wrapper with timeout warning
