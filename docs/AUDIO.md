# Audio

Background music management with queue, playback control, volume, and fade support.

---

### `addToQueue(sound)`

Adds a `Sound` instance to the playback queue.

| | |
|---|---|
| **Parameters** | `sound: Sound` |

```lua
RapidForge.AudioService.addToQueue(soundInstance)
```

---

### `clearQueue()`

Clears all sounds from the queue and resets the index.

```lua
RapidForge.AudioService.clearQueue()
```

---

### `play()`

Resumes a paused sound or starts playback from the current queue position.

```lua
RapidForge.AudioService.play()
```

---

### `stop()`

Stops the current sound.

```lua
RapidForge.AudioService.stop()
```

---

### `pause()`

Pauses the current sound.

```lua
RapidForge.AudioService.pause()
```

---

### `skip()`

Skips to the next sound in the queue. Respects shuffle mode.

```lua
RapidForge.AudioService.skip()
```

---

### `previous()`

Goes back to the previous sound in the queue.

```lua
RapidForge.AudioService.previous()
```

---

### `setVolume(volume)`

Sets the volume of the current sound.

| | |
|---|---|
| **Parameters** | `volume: number` (0–1) |

```lua
RapidForge.AudioService.setVolume(0.5)
```

---

### `fadeIn(duration?, targetVolume?)`

Fades the current sound in from `0` to `targetVolume`.

| | |
|---|---|
| **Parameters** | `duration?: number = 1`, `targetVolume?: number = 1` |

```lua
RapidForge.AudioService.fadeIn(2, 0.8)
```

---

### `fadeOut(duration?, callback?)`

Fades the current sound out to `0`, then stops it. Calls `callback` when complete.

| | |
|---|---|
| **Parameters** | `duration?: number = 1`, `callback?: function` |

```lua
RapidForge.AudioService.fadeOut(1, function()
    print("faded out")
end)
```

---

### `setLooping(bool)`

Enables or disables looping of the current sound. When `true`, the current track repeats instead of advancing the queue.

| | |
|---|---|
| **Parameters** | `bool: boolean` |

```lua
RapidForge.AudioService.setLooping(true)
```

---

### `setShuffle(bool)`

Enables or disables shuffle mode. When `true`, the next track is picked randomly.

| | |
|---|---|
| **Parameters** | `bool: boolean` |

```lua
RapidForge.AudioService.setShuffle(true)
```

---

### `isPlaying()`

Returns `true` if a sound is currently playing.

| | |
|---|---|
| **Returns** | `boolean` |

```lua
if RapidForge.AudioService.isPlaying() then
    -- music is active
end
```

---

### `getCurrent()`

Returns the currently active `Sound` instance.

| | |
|---|---|
| **Returns** | `Sound?` |

```lua
local sound = RapidForge.AudioService.getCurrent()
```
