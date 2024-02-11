---@meta Timer

---@diagnostic disable: deprecated

---@deprecated
---@class Timer
--->### ⚡ Deprecated
--->Use [Wait.frames()](https://api.tabletopsimulator.com/wait/#time) instead.
---@see Wait.frames
---`Timer` is a static global class which provides methods for executing other functions after a delay and/or
---repeatedly. Each timer is tracked by a unique "identifier" string.
--->### ⚠️ Warning
--->The "identifiers" are shared between Global and all Object scripts, so each Timer must have a unique name.
Timer = {}


---@deprecated
---@class TimerParameters
---@field identifier string Timer's name, used to destroy it. Must be unique within all other scripts.
---@field function_name string Name of function to trigger when time is reached.
---@field function_owner Object Where the function from function_name exists. *Optional, defaults to the calling Object*
---@field parameters table Table containing any data that will be passed to the function. *Optional, will not be used by default*
---Length of time in seconds before the function is triggered. *Optional, defaults to 0*<br>&emsp;&emsp; + *Use 0 for
---inifinite repetitions*
---@field delay float
---Number of times the countdown repeats. *Optional, defaults to 1*<br>&emsp;&emsp; + *Use 0 for inifinite repetitions*
---@field repetitions int

---Creates a Timer. It will auto-delete once its repetitions have been completed.
---@param parameters table
---@return bool
---
---***
---
---### Example Usage
---```
---function onLoad()
---dataTable = {welcome="Hello World!"}
---Timer.create({
---    identifier     = "A Unique Name",
---    function_name  = "fiveAfterOne",
---    parameters     = dataTable,
---    delay          = 1,
---    repetitions    = 5,
---})
---end
---
---function fiveAfterOne(params)
---print(params.welcome)
---end
---```
---
--->### 🔥 Tip
--->If your timer is on an Object, a good way to establish a unique identifier for it is to use the item's GUID!
---@deprecated
function Timer.create(parameters) end


---Destroys a Timer. A timer, if it completes its number of repetitions, will automatically destroy itself.
---@param identifier string The unique identifier for the timer you want to destroy.
---@return bool
---@deprecated
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/timer/#destroy)
function Timer.destroy(identifier) end
