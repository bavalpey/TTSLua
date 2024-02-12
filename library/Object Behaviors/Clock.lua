---@meta Clock

---# Clock
---The Clock behavior is present on the Digital Clock object.
---## Clock Modes
---- *Current Time*: Displays the current time of the host.
---- *Stopwatch*: Displays a running count up.
---- *Timer*: Displays a countdown and beeps once complete.
---@class Clock
---@field paused bool If the clock timer is paused.
local Clock = {}

---Get the current time in stopwatch or timer mode. Clock mode returns 0. This function acts the same as
---[Object's getValue()](https://api.tabletopsimulator.com/object/#getvalue).
---@return int
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/clock/#getvalue)
---
---***
---
---@see Object.getValue
function Clock.getValue() end

---Pause/resume a Clock in stopwatch or timer mode.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/clock/#pausestart)
---
function pauseStart() end


---Set the timer to display a number of seconds. This function acts the same as
---[Object's setValue()](https://api.tabletopsimulator.com/object/#setvalue). If the Clock is not in timer mode, it will
---be switched. If it is in timer mode, it will be paused and the remaining time will be changed.
---This will not start the countdown on its own.
---
---@param seconds int How many seconds will be counted down.
---@return bool
---
---***
---
---### Example Usage
---```
---self.Clock.setValue(30)
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/clock/#setvalue)
---
function Clock.setValue(seconds) end


---Switch the clock to display current time. It will clear any stopwatch or timer.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/clock/#showcurrenttime)
---
function Clock.showCurrentTime() end

---Switch the clock to stopwatch, setting time to 0. It will reset time if already in stopwatch mode.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/clock/#showstopwatch)
---
function Clock.showStopwatch() end
