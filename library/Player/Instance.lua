---@meta Player.Instance

---# Player Instance
---Player instances can be retrieved from the [Player Manager](https://api.tabletopsimulator.com/player/manager/) and
---are also frequently passed to callbacks.
---@class PlayerInstance: userdata
---@field admin bool **Read Only** If the player is promoted or the host of the game.
---@field blindfolded bool **Read Only** If the player is blindfolded.
---@field color string **Read Only** The player's [Player Color](https://api.tabletopsimulator.com/player/colors/).
---@field host bool **Read Only** If the player is the host.
---The lift height for the player. This is how far an object is raised when held in a player's hand.
---Value is ranged 0 to 1.
---@field lift_height float
---@field promoted bool If the player is promoted.
---@field seated bool **Read Only** If a player is currently seated at this color.
---@field steam_id string **Read Only** The Steam ID of the player. This is unique to each player's Steam account.
---@field steam_name string **Read Only** The Steam name of the player.
---@field team "None"|"Clubs"|"Diamonds"|"Hearts"|"Spades"|"Jokers" The team of the player.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/)
local PlayerInstance = {}

---The parameters passed to `attachCameraToObject`.
---@class AttachCameraToObjectParameters
---@field object Object The object to attach the camera to.
---@field offset? VectorLike A Vector to offset the camera by. *Optional, defaults to {x=0, y=0, z=0}*

---Makes a Player's camera follow an object
---@param parameters AttachCameraToObjectParameters A table with parameters which guide the function.
---***
---
---### Example Usage
---```
---self.attachCameraToObject({object=self})
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#attachcameratoobject)
---
function PlayerInstance.attachCameraToObject(parameters) end

---Print message on Player's screen and their game chat log.
---
---@param message string The Message to be displayed.
---@param message_color ColorLike Tint of the message text. *Optional, defaults to {r=1, g=1, b=1}*
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#broadcast)
---
function PlayerInstance.broadcast(message, message_color) end

---Changes player to this [Player Color](https://api.tabletopsimulator.com/player/colors/) (seat).
---
---@param player_color string The [Player Color](https://api.tabletopsimulator.com/player/colors/) to move the player to.
---
---***
---
---### Example Usage
---```
---Player["White"].changeColor("Red")
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#changecolor)
---
function PlayerInstance.changeColor(player_color) end

---Clears a player's current selection.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#clearselected)
---
function PlayerInstance.clearSelected() end

---Makes the Player take the Copy action with the specified Objects.
---@param objects Object[]
---@return bool
---
---***
---
---### Example Usage
---```
---Player.Green.copy({the_dice, the_deck})
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#copy)
---
function PlayerInstance.copy(objects) end

---Number of [hand zones](https://kb.tabletopsimulator.com/host-guides/player-hands/) owned by this color.
---
---@return int # The number of hand zones owned by this color.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#gethandcount)
---
function PlayerInstance.getHandCount() end

---Return a Table of Objects that are in this [hand zone](https://kb.tabletopsimulator.com/host-guides/player-hands/).
---
---@param hand_index int An index, representing which hand zone to return Objects for. *Optional, defaults to 1*
---@return Object[] # A table of Objects in the hand zone.
---
--->### Indexing
--->Hand indexes start at 1 and are numbered in the order of their creation. Each Player color has its own indexes.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#gethandobjects)
---
function PlayerInstance.getHandObjects(hand_index) end

---Returns a Table of data on this [hand zone](https://kb.tabletopsimulator.com/host-guides/player-hands/).
---@param index int An index, representing which hand zone to return data on.
---@return Hands.Transform.Properties # The transform properties of the hand zone.
---
---***
---
--->### 🔥 Indexing
--->Hand indexes start at 1 and are numbered in the order of their creation. Each Player color has its own indexes.
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#gethandtransform)
---
function PlayerInstance.getHandTransform(index) end

---Returns a Table of Objects that are currently being held by the player.
---
---@return Object[] # The Objects currently held by the player.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#getholdingobjects)
---
function PlayerInstance.getHoldingObjects() end

---Returns the Object that the player is currently hovering over.
---
---@return Object # The Object that the player is currently hovering over.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#gethoverobject)
---
function PlayerInstance.getHoverObject() end

---Returns the position of the player's cursor.
---
---@return Vector # The coordinates of the player's cursor.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#getcursorposition)
---
function PlayerInstance.getCursorPosition() end

---Returns the rotation of the player's cursor.
---
---@return Vector # The rotation of the player's cursor.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#getcursorrotation)
---
function PlayerInstance.getCursorRotation() end

---Objects that the player has selected with an area selection.
---
---@return Object[] # The Objects that the player has selected with an area selection.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#getselectedobjects)
---
function PlayerInstance.getSelectedObjects() end

---Kick the player from the room.
---
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#kick)
---
function PlayerInstance.kick() end

---@class LookAtParameters
---@field position VectorLike The position to look at.
---@field pitch? float Pitch angle of the camera. 0 to 90. *Optional, defaults to 0*
---@field yaw? float Yaw angle of the camera. 0 to 360. *Optional, defaults to 0*
---@field distance? float Distance the camera is from the position Vector. *Optional, defaults to 40*

---Move a Player's camera, forcing 3rd person camera mode.
---
---@param parameters LookAtParameters A table of controlling parameters to point the player camera.
---@return bool
---
---***
---
---### Example Usage
---```
-- Assuming someone is in the White seat
---Player["White"].lookAt({
---    position = {x=0,y=0,z=0},
---    pitch    = 25,
---    yaw      = 180,
---    distance = 20,
---})
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#lookat)
---
function PlayerInstance.lookAt(parameters) end

---Mutes or unmutes the player, preventing/allowing voice chat.
---
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#mute)
---
function PlayerInstance.mute() end

---Makes the Player take the Paste action at the specified position
---
---@param position VectorLike The position to paste at.
---@return bool
---
---***
---
---### Example Usage
---```
---Player.Green.paste(Vector(0, 1, 0))
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#paste)
---
function PlayerInstance.paste(position) end

---Emulates the player using the ping tool at the given position (tapping Tab).
---
---@param position VectorLike The position to ping.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#ping)
---
function PlayerInstance.ping(position) end

---Prints a message into the Player's game chat.
---
---@param message string The text to be displayed.
---@param message_color ColorLike The color the text will be tinted. *Optional, defaults to {r=1, g=1, b=1}*
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#print)
---
function PlayerInstance.print(message, message_color) end

---Promotes the player to host.
---
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#promote)
---
function PlayerInstance.promote() end

---Sets the player's camera mode.
---
---@param mode "FirstPerson"|"ThirdPerson"|"TopDown" The camera mode to set.
---@return bool
---
---***
---
---### Example Usage
---```
---Player["White"].setCameraMode("FirstPerson")
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#setcameramode)
---
function PlayerInstance.setCameraMode(mode) end

---Sets transform elements of a [hand zone](https://kb.tabletopsimulator.com/host-guides/player-hands/).
---
---@param parameters Hands.Transform.Parameters A table of parameters to transform the hand zone with.
---@param hand_index int An index, representing which hand zone to transform. *Optional, defaults to 1*
---@return bool
---
---***
---
--->### Indexing
--->Hand indexes start at 1 and are numbered in the order of their creation. Each Player color has its own indexes.
---
---***
---
---### Example Usage
---```
-- Example of moving/rotating/scaling hand zone
---params = {
---    position = {x=0, y=5, z=0},
---    rotation = {x=0, y=45, z=0},
---    scale    = {x=2, y=2, z=2},
---}
---Player["White"].setHandTransform(params, 2)
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#sethandtransform)
---
function PlayerInstance.setHandTransform(parameters, hand_index) end

---Sets the UI theme for the player.
---
---@param theme string A string representing a theme.
---@return bool
---
---***
---
--->### Theme Format
---You can view the expected theme format by in-game going to Menu
---\-\> Configuration \-\> Interface \-\> Theme. Select a theme then press "Import/Export".
---
---### Example Usage
---```
-----Set the White player's default button background to pink.
---Player.white.setUITheme("button_normal #FFC0C0")
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#setuitheme)
---
function PlayerInstance.setUITheme(theme) end

---Displays `info` string to this player in the message box dialog.
---
---@param info string Information to display.
---@return bool
---
---***
---
---### Example Usage
---```
---Player["White"].showInfoDialog("Only active players may floop!")
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#showinfodialog)
---
function PlayerInstance.showInfoDialog(info) end

---Shows the confirm dialog to the player and executes the callback if they click OK.
---
---@param info string Information to display.
---@param callback? fun(player_color: string) The callback to execute if they click OK.
---@return bool
---
---***
---
---### Example Usage
---```
---chosen_player.showConfirmDialog("Really roll the dice?",
---    function (player_color)
---        dice.roll()
---        log(player_color .. " rolled the dice.")
---    end
---)
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#showconfirmdialog)
---
function PlayerInstance.showConfirmDialog(info, callback) end

---Shows the confirm dialogue to the player and executes the callback if they click OK.
---
---@param description? string Optional description of what the player should input.
---@param default_text? string Optional default value.
---@param callback? fun(text: string, player_color: string) The callback to execute if they click OK.
---
---***
---
---### Example Usage
---```
---chosen_player.showInputDialog("Set Name",
---    function (text, player_color)
---        chosen_object.setName(text)
---    end
---)
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#showinputdialog)
---
function PlayerInstance.showInputDialog(description, default_text, callback) end

---Shows the memo input dialog (large text input) to the player, and executes `callback` if the click OK.
---
---@param description? string Optional description of what the player should input.
---@param default_text? string Optional default value.
---@param callback? fun(text: string, player_color: string) Callback to execute if they click OK.
---
---***
---
---### Example Usage
---```
---chosen_player.showMemoDialog("Set Description",
---    function (text, player_color)
---        chosen_object.setDescription(text)
---    end
---)
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#showmemodialog)
---
function PlayerInstance.showMemoDialog(description, default_text, callback) end

---Shows the dropdown options dialog to the player, and executes `callback` if they click OK.
---
---@param description string Description of what the player is choosing.
---@param options string[] A table of strings representing the options.
---@param default_value int|string Optional default value, an integer index into the options table. Note you may alternatively use the option string itself.
---@param callback fun(option: string, player_color: string) Callback to execute if they click OK.
---
---***
---
---### Example Usage
---```
---chosen_player.showOptionsDialog("Choose Value", {"1", "2", "3", "4", "5", "6"}, dice.getValue(),
---    function (text, index, player_color)
---        dice.setValue(index)
---    end
---)
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#showoptionsdialog)
---
function PlayerInstance.showOptionsDialog(description, options, default_value, callback) end

---Shows the color picker dialogue to the player and executes the callback if they click OK.
---
---@param default_color? string Optional default color.
---@param callback? fun(color: Color, player_color: string) The callback to execute if they click Apply.
---
---***
---
---### Example Usage
---```
---chosen_player.showColorDialog(dice.getColorTint(),
---    function (color, player_color)
---        dice.setColorTint(color)
---    end
---)
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/instance/#showcolordialog)
---
function PlayerInstance.showColorDialog(default_color, callback) end
