---@meta Events

---# ⚠️ TODO: Make this work as an abstract base class. See  https://github.com/LuaLS/lua-language-server/issues/2453

---# Events
---Games frequently need to execute code in response to some action, interaction, or change takign place in the game,
---collectively referred to as *events*.
---## Event Handlers
---Event handlers are **functions you define**, that Tabletop Simulator calls.
---
---There are many event handlers that you can define. Each one gives you an opportunity to handle occurrences of a
---particular event.
---
---When Tabletop Simulator calls your function, it will provide event-specific details as arguments to your event
---handler function.
---
---In order for Tabletop Simulator to discover an event handler, it must be defined as a global variable with a specific
---name. The name that you use depends on which event you wish to handle.
---
--->### ✏️ Note
--->Whilst event handler *names* corresopnd with just one type of event, each event may have multiple corresponding
--->event handlers (i.e. event handler names) that Tapletop Simulator will look for and execute.
---
---There are three types of event handlers
---+ [Universal Event Handlers](https://api.tabletopsimulator.com/events/#universal-event-handlers)
---+ [Global Event Handlers](https://api.tabletopsimulator.com/events/#global-event-handlers)
---+ [Object Event Handlers](https://api.tabletopsimulator.com/events/#object-event-handlers)
---
---### Universal Event Handlers
---Universal Event Handlers may be defined in the
---[Global script](https://api.tabletopsimulator.com/intro/#global-script) *and/or*
---[Object scripts](https://api.tabletopsimulator.com/intro/#object-scripts).
---### Global Event Handlers
---Global Event Handlers may *only* be defined in the
---[Global script](https://api.tabletopsimulator.com/intro/#global-script).
---
---If you define a function using the name of a Global Event Handler in an
---[Object script](https://api.tabletopsimulator.com/intro/#object-scripts), it simply won't be called.
---## Event Handler Execution
---*Typically*, if there are multiple event handlers for one event, i.e. in an Object script and Global Script *and/or*
---multiple Object scripts, then *all* of these event handlers will be executed.
---
--->### 📚 Info
--->Some event handlers permit you to return a value in order to trigger an optional side effect. For example, returning
--->`false` from a "try" event handler will prevent whatever action is being *tried*. If you return a value that
--->triggers an optional side effect, then subsequent event handlers (for the same event occurence) will *not* be
--->executed.
---
--->### ⚠️ This is an abstract class for documentation purposes only
--->None of the functions defined within have any implementation until they are defined in a script.
---@class Events
local Events = {}

---Called when a player puts on or takes off their blindfold.
---@param player Player Player who put on or took off their blindfold.
---@param blindfolded bool Whether the player is now blindfolded
---
---### Example Usage
---Print a message indicating which player put on or took off their blindfold.
---```
---function onBlindfold(player, blindfolded)
---    if blindfolded then
---        print(player.color .. " put their blindfold on.")
---    else
---        print(player.color .. " took their blindfold off.")
---    end
---end
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/events/onblindfold/)
function Events.onblindfold(player, blindfolded) end

--[[
---@type fun(player: Player, blindfolded: bool)
onBlindfold = nil
]]--
