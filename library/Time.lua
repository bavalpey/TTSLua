---@meta

---# Time

---`Time`, not to be confused with the deprecated [Timer](https://api.tabletopsimulator.com/timer/) class, is a static
---global class which provides access to Unity's time information.
---
--->### ⚠️ All fields are read-only.
---
---@class Time
---@field time float The current time. Works like `os.time()` but is more accurate.
---@field delta_time float The time in seconds it took to complete the last frame.
---@field fixed_delta_time float The interval (in seconds) between physics updates.
---@see os.time
Time = {}

return Time
