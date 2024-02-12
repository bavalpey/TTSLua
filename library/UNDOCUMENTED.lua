---@meta UNDOCUMENTED

---THINGS IN THIS MODULE EXIST IN TTS BUT ARE NOT OFFICIALLY DOCUMENTED (as of version 13.2.2 hotfix 1)


pack = table.pack
unpack = table.unpack


---https://www.moonsharp.org/additions.html#the-json-module
---@class jsonlib
json = {}

---Returns a table with the contents of `jsonString`.
---@param jsonString string
---@return table # A table with the contents of `jsonString`
---
---***
---
---[Open Documentation](https://www.moonsharp.org/additions.html#the-json-module)
function json.parse(jsonString) end

---@param table table
---
---***
---
---[Open Documentation](https://www.moonsharp.org/additions.html#the-json-module)
function json.serialize(table) end


---Returns true if the value specified is a null read from a json
---@param val any
---@return bool
---
---***
---
---[Open Documentation](https://www.moonsharp.org/additions.html#the-json-module)
function json.isnull(val) end

---@return userdata
function json.null() end


---This class describes the structure of the table returned by `inspect`.
---@class InspectResultTable
---@field name string
---@field variables {name: string, type: string}[]
---@see inspect

---Returns information
---@param var any
---@return table|nil
---
--->### ⚠️ Warning
--->This function is not officially Documented on Tabletop Simulator's API Documentation.
function inspect(var) end


---Add a console command.
---     
---@param name string
---@param callback fun(parameters: string[], ...:any) # The function to be called when the console command is used. `parameters` is a table whose first element is the Player Color string of the player who used the command. The rest of the elements are the arguments passed to the command line.
---@param arg3 bool # This is an undocumented function, and the purpose or meaning of the third argument is currently unknown.
function addConsoleCommand(name, callback, arg3) end



---Undocumented function that gets the player's hand position and rotation.
---@param playerColor? string The player color to get the hand position of. If `nil`, or if there is not a hand for the player color provided, `nil` is returned.
---@return nil|{pos_x: float, pos_y: float, pos_z: float, rot_x: float, rot_y: float, rot_z: float, trigger_forward_x: float, trigger_forward_y: float, trigger_forward_z: float, trigger_right_x: float, trigger_right_y: float, trigger_right_z: float, trigger_up_x: float, trigger_up_y: float, trigger_up_z: float}
---@deprecated
function getPlayerHandPositionAndRotation(playerColor) end

---Undocumented function that gets the pointer position of the specified player color
---@param playerColor string The player color to get the pointer position of.
---@return nil|Vector # The position of the specified player's pointer.
function getPointerPosition(playerColor) end

---Undocumented function that gets the pointer rotation of the specified player color
---@param playerColor string The player color to get the pointer rotation of.
---@return nil|Vector # The rotation of the specified player's pointer.
function getPointerRotation(playerColor) end


---Undocumented function that gets the player instance for the specified color.
---@param playerColor string The player color to get the player instance of.
---@return nil|Player # The player instance of the specified player color.
---
---@see Player.getPlayers
function getPlayer(playerColor) end

---Undocumented function that gets a variable defined in the Global script.
---@param name string The name of the variable to get.
---@return any # The value of the variable.
---@see Global.getVar
---@deprecated
function getGlobalScriptVar(name) end

---Undocumented function that sets a variable in the Global script. Does not work with `tables`.
---@param name string The name of the variable to set.
---@param value any The value to set the variable to.
---@see Global.setVar
---@deprecated
function setGlobalScriptVar(name, value) end

---Undocumented function that gets a variable of type `table` defined in the global script.
---@param name string The name of the table to get.
---@return table # The table.
---
---@see Global.setTable
---@deprecated
function getGlobalScriptTable(name) end

---Undocumented function that sets/updates a variable of type `table` in the global script.

---@param obj Object The object that owns the function you wish to call
---@param func string The name of the function to call
---@return any # Returns whatever the called function returns. 🚨 Be careful using the returned value if the function returns nil. In testing this undocumented function, its behavior was erratic.
---@deprecated
function callLuaFunctionWithParams(obj, func, parameters) end

---@param obj Object The object that owns the function you wish to call
---@param func string The name of the function to call
---@param parameters? table A table of parameters to pass to the function. The table will not be unpacked prior to being called.
---@return any # Returns whatever the called function returns. 🚨 Be careful using the returned value if the function returns nil. In testing this undocumented function, its behavior was erratic.
---@deprecated
function callLuaFunctionWithParams(obj, func, parameters) end

---Gets the steam_name of the player with the specified color.
---@param playerColor? string The color of the player to get the steam_name of. *Optional, defaults to "White"*
---@return nil|string # The steam_name of the player.
---@see PlayerInstance.steam_name
function getPlayerSteamName(playerColor) end

---Undocumented function\* that clears all drawings made with the
---[draw tool](https://kb.tabletopsimulator.com/game-tools/drawing-tools/). Akin to pressing the trash can button under
---the draw tool's the in-game menu.
---
---\*This function appears in the official
---[Atom API documentation](https://github.com/Berserk-Games/atom-tabletopsimulator-lua/blob/1a224adc9483f95aecc6b09020d178320557ffa7/lib/api.yaml)
---@return bool
---@deprecated
function clearVectorPaint() end

---Undocumented function\* with no apparent use. Probably clears some kind of paint that used to be able to be drawn. Does
---not effect anything drawn via the draw tool).
---
---\*This function appears in the official
---
---[Atom API documentation](https://github.com/Berserk-Games/atom-tabletopsimulator-lua/blob/1a224adc9483f95aecc6b09020d178320557ffa7/lib/api.yaml)
---@return bool
---@deprecated
function clearVectorPaint() end



---Undocumented function that appears to be equivalent to `Notes.getNotebookTabs`.
---@return NotebookTab.Properties
---@deprecated
---@see Notes.getNotebookTabs
function getNotebookTabs() end

---Undocumented function that appears to be equivalent to `Notes.addNotebookTab`.
---@param parameters Notebooktab.Parameters.Add
---@return int
---@deprecated
---@see Notes.addNotebookTab
function addNotebookTab(parameters) end

---Undocumented function that appears to be equivalent to `Notes.editNotebookTab`.
---@param parameters Notebooktab.Parameters.Edit
---@return bool
---@deprecated
---@see Notes.editNotebookTab
function editNotebookTab(parameters) end

---Undocumented function that appears to be equivalent to `Notes.removeNotebookTab`.
---@param index int
---@return bool
---@deprecated
---@see Notes.removeNotebookTab
function removeNotebookTab(index) end

---Undocumented function that appears to be equivalent to `Notes.getNote`
---@return string
---@deprecated
---@see Notes.getNote
function getNote() end

---Undocumented function that appears to be equivalent to `Notes.setNote`
---@param note string
---@return bool
---@deprecated
---@see Notes.setNote
function setNote(note) end

---Undocumented function that clears all console commands set by `addConsoleCommand`.
---
---@return bool
---
---@see addConsoleCommand
function clearConsoleCommands() end
