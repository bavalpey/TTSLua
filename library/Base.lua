---@meta Base
---These are a loose collection of functions which can be used to perform a variety of actions within Tabletop Simulator.
---
---These functions can utilize in-game Objects, but none of them can be enacted on in-game `Objects`. They all deal with the game space.

---Adds a menu item to the Global right-click context menu. Global menu is shown when player right-clicks on empty space or table.
---@param label string Label for the menu item.
---@param toRunFunc fun(player_color: string, menu_position: Vector) Execute if menu item is selected.<ul>`player_color` — [Player Color](https://api.tabletopsimulator.com/player/colors/) who selected the menu item.<br>`menu_position` — Global position of the right-click context menu.</ul>
---@param keep_open? bool Keep Context Menu open after menu item was selected.<ul><ul><li>Optional, Default: keep_open = false. Close context menu after selection.</li></ul></ul>
---@param require_table? bool Show Added menu item when right-clicked on empty space or table.<ul><ul><li>Optional, Default: require_table = false. Show when right-clicked on empty space or table.</li></ul></ul>
---```
---function onLoad()
---    addContextMenuItem("doStuff", itemAction)
---end
---
---function itemAction(player_color, menu_position)
---    print(player_color)
---end
---```
---***
---[Open Documentation](https://api.tabletopsimulator.com/base/#addcontextmenuitem)
function addContextMenuItem(label, toRunFunc, keep_open, require_table)
end

---Clears all menu items added by function [addContextMenuItem(...)](https://api.tabletopsimulator.com/base/#addcontextmenuitem).
---@return bool
function clearContextMenu()
end

---Copy a list of Objects to the clipboard. Works with [paste(...)](https://api.tabletopsimulator.com/base/#paste).
---
---object_list: A Table of in-game objects to be copied.
---This is similar to highlighting the objects in-game and copying them.
---
---@param object_list table A Table of in-game objects to be copied.
---@return bool
---```
--- object_list = {
---     getObjectFromGUID("######"),
---     getObjectFromGUID("######"),
--- }
--- copy(object_list)
---```
---***
--- [Open Documentation](https://api.tabletopsimulator.com/base/#copy)<br>
---@see paste
function copy(object_list)
end

---Destroy an Object.
---@param obj Object The Object you wish to delete from the instance.
---@return bool
---***
---[Open Documentation](https://api.tabletopsimulator.com/base/#destroyobject)
function destroyObject(obj)
end


---Flip the table.
---@return bool
function flipTable() end

---[`deprecated`](https://api.tabletopsimulator.com/intro/#deprecated) *Use [`getObjects()`](https://api.tabletopsimulator.com/base/#getobjects)*
---
---Returns A table of all [Objects](https://api.tabletopsimulator.com/object/) in the game _except hand zones_.
---@deprecated
---@return Object[]
function getAllObjects() end

---Returns Object by its GUID. Will return ``nil`` if this GUID doesn't currently exist.
---@param guid string The GUID of the Object to get a reference of.
---<ul><ul>
---<li>GUID can be obtained by right clicking an object and going to Scripting.</li>
---<li>In a script, it can be obtained from any Object by using .getGUID().</li>
---</ul></ul>
---@return Object?
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/base/#getobjectfromguid)
function getObjectFromGUID(guid)
end

---Groups objects together, like how the ``G`` key does for players. It returns a table of object references to any decks/stacks formed.
---
---Not all objects CAN be grouped. if the ``*G`` key won't work on them, neither will this function.
---@param ... Object A list of objects to be grouped together.
---@return Object[] # A table containing the grouped objects, numerically indexed.<ul><ul><li>Different types of object are grouped independently i.e. cards will form into a deck, each type of checker will form their own stack.</li></ul></ul>
---### Example
---```
---function onLoad()
---    local objects = {
---        -- IMPORTANT: To get the example to work, you need to replace ###### by a real GUID of the object.
---        getObjectFromGUID("######"), -- card
---        getObjectFromGUID("######"), -- card
---        getObjectFromGUID("######"), -- checker
---        getObjectFromGUID("######"), -- checker
---    }
---    local objGroupedList = group(objects)
---    log(objGroupedList)
---end
---```
---```
----- Possible Output for objGroupedList
---{
---    1: <Deck>
---    2: <CheckerStack>
---}
---```
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/base/#group)
function group(...) end



--- Pastes Objects in-game that were copied to the in-game clipboard. Works with [`copy(...)`](https://api.tabletopsimulator.com/base/#copy).
---
---@param parameters {position: Vector?, snap_to_grid: bool?} A Table containing instructions of where to spawn the Objects
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/base/#paste)
function paste(parameters)
end
