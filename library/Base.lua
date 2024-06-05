---@meta Base

---# Base
---These are a loose collection of functions which can be used to perform a variety of actions within Tabletop Simulator.
---
---These functions can utilize in-game Objects, but none of them can be enacted on in-game `Objects`. They all deal with the game space.

---## Global Functions
---General functions which work within any script.

---Adds a menu item to the Global right-click context menu. Global menu is shown when player right-clicks on empty space or table.
---@param label string Label for the menu item.
---@param toRunFunc fun(player_color: string, menu_position: VectorLike) Execute if menu item is selected.<ul>`player_color` — [Player Color](https://api.tabletopsimulator.com/player/colors/) who selected the menu item.<br>`menu_position` — Global position of the right-click context menu.</ul>
---@param keep_open? bool Whether to keep the Context Menu open after menu item was selected. *Optional, Default: keep_open = false*
---@param require_table? bool Show Added menu item when right-clicked on empty space or table. *Optional, Default: require_table = false*
---
---***
---
---### Example Usage
---```
---function onLoad()
---    addContextMenuItem("doStuff", itemAction)
---end
---
---function itemAction(player_color, menu_position)
---    print(player_color)
---end
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#addcontextmenuitem)
---
function addContextMenuItem(label, toRunFunc, keep_open, require_table) end

---Clear all menu items added by [addContextMenuItem(...)](https://api.tabletopsimulator.com/base/#addcontextmenuitem).
---@return bool
function clearContextMenu() end

---Copy a list of Objects to the clipboard. Works with [paste(...)](https://api.tabletopsimulator.com/base/#paste).
---
---This is similar to highlighting the objects in-game and copying them.
---
---@param object_list Object[] A Table of in-game objects to be copied.
---@return bool
---
---***
---### Example Usage
---```
--- object_list = {
---     getObjectFromGUID("######"),
---     getObjectFromGUID("######"),
--- }
--- copy(object_list)
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#copy)
---
---***
---
---@see paste
---
function copy(object_list) end

---Destroy an Object.
---@param obj Object The Object you wish to delete from the instance.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#destroyobject)
---
function destroyObject(obj) end

---Flip the table.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#fliptable)
---
function flipTable() end

---[``deprecated``](https://api.tabletopsimulator.com/intro/#deprecated)
---*Use [`getObjects()`](https://api.tabletopsimulator.com/base/#getobjects)*
---
---Return a Table of all [Objects](https://api.tabletopsimulator.com/object/) in the game *except hand zones*.
---@return Object[]
---@deprecated
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#getallobjects)
---
---***
---
---@see getObjects
---
function getAllObjects() end

---Returns Object by its GUID. Will return ``nil`` if this GUID doesn't currently exist.
---@param guid string The GUID of the Object to get a reference of.
---@return Object?
---
--->### 🔥 Tip
---> + GUID can be obtained by right clicking an object and going to Scripting.
---> + In a script, it can be obtained from any Object by using `<object>.getGUID()`.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#getobjectfromguid)
---
function getObjectFromGUID(guid) end

---Return a table of all [Objects](https://api.tabletopsimulator.com/object/) in the game.
---@return Object[]
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#getobjects)
---
function getObjects() end

---Return a table of all [Objects](https://api.tabletopsimulator.com/object/) that have the specified tag attached.
---@param tag string The tag to search for.
---@return Object[] # The table of all objects with the specified tag.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#getobjectswithtag)
---
function getObjectsWithTag(tag) end

---Return a table of all [Objects](https://api.tabletopsimulator.com/object/) that have at least one of the specified
---tags attached.
---@param tags string[] The tags to search for.
---@return Object[] # The table of all objects with at least one of the specified tags.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#getobjectswithanytags)
---
function getObjectsWithAnyTags(tags) end

---Return a table of all [Objects](https://api.tabletopsimulator.com/object/) that have all of the specified tags
---attached.
---@param tags string[] The tags to search for.
---@return Object[] # The table of all objects that have all of the specified tags.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#getobjectswithalltags)
---
function getObjectsWithAllTags(tags) end

---Return a Table of the [Player Colors](https://api.tabletopsimulator.com/player/colors/) strings of seated players.
---@return string[] # A table of the player colors of seated players.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#getplayers)
---
function getSeatedPlayers() end

---Groups objects together, like how the ``G`` key does for players. It returns a table of object references to any
---decks/stacks formed.
---
---Not all objects CAN be grouped. if the ``*G`` key won't work on them, neither will this function.
---@param ... Object A list of objects to be grouped together.
---@return Object[] # A table containing the grouped objects, numerically indexed.<ul><ul><li>Different types of object are grouped independently i.e. cards will form into a deck, each type of checker will form their own stack.</li></ul></ul>
---
---### Example Usage
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
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#group)
---
function group(...) end

--- Pastes Objects in-game that were copied to the in-game clipboard. Works with
---[`copy(...)`](https://api.tabletopsimulator.com/base/#copy).
---
---@param parameters {position: Vector?, snap_to_grid: bool?} A Table containing instructions of where to spawn the Objects
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/base/#paste)
function paste(parameters) end

---Enable/disable the looking for group setting. This is visible in the server browsers, indicating whether the game is
---being recruited for.
---@param lfp bool
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#setlookingforplayers)
---
function setLookingForPlayers(lfp) end

---Spawn and object.
---
---Refer to the spawnable [Built-in Object](https://api.tabletopsimulator.com/built-in-object/) and
---[Custom Object](https://api.tabletopsimulator.com/custom-game-objects/) pages for details about the types of objects
---that can be spawned.
---
---If you are spawning a [Custom Object](https://api.tabletopsimulator.com/custom-game-objects/), you should immediately
---call [setCustomObject(...)](https://api.tabletopsimulator.com/base/#setcustomobject) on the object returned from
---this function.
---
---@param parameters SpawnObject.Parameters # The table of [spawn parameters](https://api.tabletopsimulator.com/base/#spawnobject-spawn-parameters)
---@return Object # A reference to the spawned object
---
---***
---
--->### ⚠️ Objects take a moment to spawn
--->The purpose of `callback_function` is to allow you to execute additional code after the object has finished
--->spawning.
---
---### Example Usage
---Spawn (with sound disabled) a 2x scale "RPG Bear" object in the center of the table and initiate a
---[smooth move](https://api.tabletopsimulator.com/object/#setpositionsmooth) on the object. Once the object has
---finished spawning, [log](https://api.tabletopsimulator.com/base/#log) the object's
---[bounds](https://api.tabletopsimulator.com/object/#getbounds).
---```
---local object = spawnObject({
---    type = "rpg_BEAR",
---    position = {0, 3, 0},
---    scale = {2, 2, 2},
---    sound = false,
---    callback_function = function(spawned_object)
---        log(spawned_object.getBounds())
---    end
---})
---object.setPositionSmooth({10, 5, 10})
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#spawnobject)
---
function spawnObject(parameters) end

---Spawn an object from an object data table representation.
---
---This API gives you complete control over all persistent properties that an object has.
---@param parameters SpawnObjectData.Parameters The table of [spawn parameters](https://api.tabletopsimulator.com/base/#spawnobjectdata-spawn-parameters).
---@return Object # A reference to the spawned object.
---
---***
--->### ⚠️ Objects take a moment to spawn
--->The purpose of `callback_function` is to allow you to execute additional code after the object has finished
--->spawning.
---
---### Example Usage
---Spawn a 2x scale "RPG Bear" object with a blue base in the center of the table and initiate a
---[smooth move](https://api.tabletopsimulator.com/object/#setpositionsmooth) on the object. Once the object has
---finished spawning, [log](https://api.tabletopsimulator.com/base/#log) the object's
---[bounds](https://api.tabletopsimulator.com/object/#getbounds).
---```
---local object = spawnObjectData({
---    data = {
---        Name = "rpg_BEAR",
---        Transform = {
---            posX = 0,
---            posY = 3,
---            posZ = 0,
---            rotX = 0,
---            rotY = 180,
---            rotZ = 0,
---            scaleX = 2,
---            scaleY = 2,
---            scaleZ = 2
---        },
---        ColorDiffuse = {
---            r = 0.3,
---            g = 0.5,
---            b = 0.8
---        }
---    },
---    callback_function = function(spawned_object)
---        log(spawned_object.getBounds())
---    end
---})
---object.setPositionSmooth({10, 5, 10})
---```
---
---***
---
--->### 🔥 Tip
--->You can derive your `data` table from another object by calling
---getData() on it, and manipulating the resultant table as you see fit.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#spawnobjectdata)
---
---***
---
---@see Object.getData
---
function spawnObjectData(parameters) end

---Spawn an object from a JSON string.
---
---This API gives you complete control over all persistent properties that an object has.
--->### 🔥 Tip
--->Unless you've already got an object's JSON representation at your disposal then
---[spawnObjectData(...)](https://api.tabletopsimulator.com/base/#spawnobjectdata) is the preferred API as it's less
---resource intensive.
---@param parameters SpawnObjectJSON.Parameters The table of [spawn parameters](https://api.tabletopsimulator.com/base/#spawnobjectjson-spawn-parameters).
---@return Object # A reference to the spawned object.
--->### ⚠️ Objects take a moment to spawn
--->The purpose of `callback_function` is to allow you to execute additional code after the object has finished
--->spawning.
---
---### Example Usage
---Spawn a 2x scale "RPG Bear" object with a blue base in the center of the table and initiate a
---[smooth move](https://api.tabletopsimulator.com/object/#setpositionsmooth) on the object. Once the object has
---finished spawning, [log](https://api.tabletopsimulator.com/base/#log) the object's
---[bounds](https://api.tabletopsimulator.com/object/#getbounds).
---```
---local object = spawnObjectJSON({
---    json = [[{
---        "Name": "rpg_BEAR",
---        "Transform": {
---            "posX": 0,
---            "posY": 3,
---            "posZ": 0,
---            "rotX": 0,
---            "rotY": 180,
---            "rotZ": 0,
---            "scaleX": 2,
---            "scaleY": 2,
---            "scaleZ": 2
---        },
---        "ColorDiffuse": {
---            "r": 0.3,
---            "g": 0.5,
---            "b": 0.8
---        }
---    }]],
---    callback_function = function(spawned_object)
---        log(spawned_object.getBounds())
---    end
---})
---object.setPositionSmooth({10, 5, 10})
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#spawnobjectjson)
---
function spawnObjectJSON(parameters) end

---Start a coroutine. A coroutine is similar to a function, but has the unique ability to have its run paused until the
---next frame of the game using `coroutine.yield(0)`.
---@param function_owner Object The Object that the function being called is on. Global is a valid target.
---@param function_name string Name of the function being called as a coroutine.
---@return bool
---
---***
---> ### ⚠️ Attention
--->You MUST return a 1 at the end of any coroutine or it will throw an error.
---
---### Example Usage
---```
---function onLoad()
---    startLuaCoroutine(Global, "print_coroutine")
---end
---
----- Prints a message, waits 250 frames, prints another message
---function print_coroutine()
---    print("Routine has Started")
---    count = 0
---    while count < 250 do
---        count = count + 1
---        coroutine.yield(0)
---    end
---
---    print("Routine has Finished")
---
---    return 1
---end
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#startluacoroutine)
---
---***
---
---@see coroutine
---
function startLuaCoroutine(function_owner, function_name) end

---Converts a [Player Color](https://api.tabletopsimulator.com/player/colors/) string to a Color Table for tinting.
---@param player_color string A string of a [Player Color](https://api.tabletopsimulator.com/player/colors/).
---@return Color
---
---***
---
function stringColorToRGB(player_color) end

---# Hotkey Functions

---The definition for a hotkey callback function, with annotations on the parameters.
---@private
---@param playerColor string Player Color of the player that pressed the hotkey.
---@param hoveredObject Object The object that the Player's pointer was hovering over at the moment the key was pressed/released. `nil` if no object was under the Player's pointer at the time
---@param pointerPosition VectorLike World Position of the Player's pointer at the moment the key was pressed/released.
---@param isKeyUp bool Whether this callback is being triggered in response to a hotkey being released.
function addHotkeyCallback(playerColor, hoveredObject, pointerPosition, isKeyUp) end

---Add a bindable hotkey to the game.
---
--->### 🔥 Important
--->Added are unable to persist between loads/rewinds, because the bound callback function may no longer exist.
--->Therefore this function needs to be called each time the game is loaded. As long as the same labels are used,
--->then player hotkey bindings will persist.
---@param label string
---@param toRunFunc fun(playerColor: string, hoveredObject: Object, pointerPosition: Vector, isKeyUp: bool) The function that will be executed whenever the hotkey is pressed, and also when released if triggerOnKeyUp is true.
---@param trigger_on_key_up bool
---
---***
---
--->### ⚠️ Warning
--->Hotkey bindings do not prevent the behavior of Settings key bindings i.e. if "R" (shuffle by default) is assigned as
---a hotkey, the hotkey callback and the default shuffle behavior will both be executed whenever R is pressed.
---
---### Example Usage
---```
---function onLoad()
---    addHotkey("My Hotkey", function(playerColor, object, pointerPosition, isKeyUp)
---        local action = isKeyUp and "released" or "pressed"
---        print(playerColor .. " " .. action .. " the hotkey")
---    end, true)
---end
---```
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/base/#addhotkey)
---
function addHotkey(label, toRunFunc, trigger_on_key_up) end

---Clear all hotkeys previously added via [addHotkey(...)](https://api.tabletopsimulator.com/base/#addhotkey).
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#clearallhotkeys)
---
function clearAllHotkeys() end

---Show the hotkey configuration window under Options->Game Keys.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#showhotkeyconfig)
---
function showHotkeyConfig() end

---# Message Functions
---Functions that handle sending and displaying data.

---Print an on-screen message to all Players, as well as their in-game chat.
---@param message string The message to be displayed.
---@param message_tint? Color The color of the message.
---
---***
---
---### Example Usage
---```
---msg = "Hello all."
---rgb = Color(1, 0, 0)
---broadcastToAll(msg, rgb)
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#broadcasttoall)
---
function broadcastToAll(message, message_tint) end

---Print an on-screen message to a specific Player, as well as their in-game chat.
---@param message string The message to be displayed.
---@param player_color string [Player Color](https://api.tabletopsimulator.com/player/colors/) to receive the message.
---@param message_tint? ColorLike RBG color tint for the text.
---
---***
---
---### Example Usage
---```
---msg = "Hello White."
---color = "White"
---rgb = Color(1, 0, 0)
---broadcastToColor(msg, "Red", rgb)
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#broadcasttocolor)
---
function broadcastToColor(message, player_color, message_tint) end

---Logs a message to the *host's* System Console (accessible from `~` pane of in\-game chat window).
---@param value any The value you want to log
---@param label? string Text to be logged before `value`.* Defaults to an empty string. Empty strings are not displayed.*
---@param tags? string The log tag/style *or* a space separated list of log tags/styles. *Optional, defaults to logging with the <default> log style.*
---
---***
---
--->### ✏️ Notes
--->If `value` is not already a `string`, then it will be converted to a human\-readable representation.
--->
--->If `value` is a `table`, then the table's contents (keys & values) will be displayed. The contents of nested tables
--->will also be displayed up to a user-configurable depth. Users can configure the max depth via the
--->`log_max_table_depth` System Console command.
---
--->As an advanced feature, multiple log tags may be provided by space-separating several tags (in the one String)
--->provided as the tags parameter. The message style will be taken from the first tag that the user has not explicitly
--->disabled.
---
---### Example Usage
---Log a simple message
---```
---log("Something happened")
---```
---
---Log a table (of objects)
---```
---log(getObjects())
---```
---
---Log a message with a label and using the `"error"` log style
---```
---log("Something unexpected happened.", "Oh no!", "error")
---```
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#log)
---
function log(value, label, tags) end

---@param value any The value you want to log
---@param label? string Text to be logged before `value`. *Optional, defaults to an empty String. Empty strings are not displayed.*
---@param tags? string The log tag/style *or* a space separated list of log tags/styles. *Optional, defaults to logging with the <default> log style.*
---@param concise? bool Whether the resultant String should be generated in a more compact form (less newline characters). *Optional, defaults to `false`.*
---@param displayTag? bool Whether the specified tag(s) should be included as prefix of the resultant String. *Optional, defaults to `false`.*
---@return string
---
---***
---
--->### ✏️ Notes
--->If `value` is not already a `string`, then it will be converted to a human\-readable representation.
--->
--->If `value` is a `table`, then the table's contents (keys & values) will be displayed. The contents of nested tables
--->will also be displayed up to a user-configurable depth. Users can configure the max depth via the
--->`log_max_table_depth` System Console command.
---
--->In some circumstances, log strings have newlines inserted e.g. between the `label` and the textual representation of
--->`value`.  Providing `true` as the value for `concise` will use space separators instead of newlines.
---
---### Example Usage
---*Print*, as opposed to log, the contents of a table(of objects)
---```
---print(logString(getObjects()))
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#logstring)
---
function logString(value, label, tags, concise, displayTag) end

---@param tag string A string identifying this log style.
---@param tint string|Color RBG value to tint the log entry's text. *String color will also work. Example: "Red"
---@param prefix? string Text to place before this type of log entry. *Optional, defaults to an empty string. Empty strings are not displayed.*
---@param postfix? string Text to place after this type of log entry. *Optional, defaults to an empty string. Empty strings are not displayed.*
---@return bool
---
---***
---
---### Example Usage
---Sets the log style (grey text and a suffix) for the log tag `"seats"`. Then proceeds to log a table of available
---seat colors, using this tag/style.
---```
---logStyle("seats", {0.5, 0.5, 0.5}, "", "End List")
---log(Player.getAvailableColors(), nil, "seats")
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#logstyle)
---
function logStyle(tag, tint, prefix, postfix) end

---Print a string into chat that only the host is able to see. Commonly used for debugging scripts.
---@param message string Text to print into the chat log
---@return nil
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#printtobrowser)
---
function printToBrowser(message) end

---Print a message into the in-game chat of all connected players.
---@param message string Message to place into players' in-game chats.
---@param message_tint? string|Color RBG value to tint the message. *String color will also work. Example: "Red"
---@return bool
---
---***
---
---### Example Usage
---```
---printToAll("Hello World!", {r=1,g=0,b=0})
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#printtoall)
---
function printToAll(message, message_tint) end

---Print a message into the in-game chat of a specific player.
---@param message string Message to place into the player's in-game chat.
---@param player_color string [Player Color](https://api.tabletopsimulator.com/player/colors/) to receive the message.
---@param message_tint? string|Color RBG value to tint the message. *String color will also work. Example: "Red"
---@return bool
---
---***
---
---### Example Usage
---```
---printToColor("Hello Red!", "Red", {r=1,g=0,b=0})
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/base/#printtocolor)
---
function printToColor(message, player_color, message_tint) end

---Send a table to your external script editor. This is for custom editor functionality.
---@param data table The table to send to the external script editor.
---@return bool
function sendExternalMessage(data) end
