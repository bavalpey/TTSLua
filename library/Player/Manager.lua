---@meta PlayerManager

---@alias PlayerRegularColor 'White' | 'Brown' | 'Red' | 'Orange' | 'Yellow' | 'Green' | 'Teal' | 'Blue' | 'Purple' | 'Pink'
---@alias PlayerGameMasterColor 'Black'
---@alias PlayerSpectatorColor 'Grey'

---@alias PlayerHandColor PlayerRegularColor | PlayerGameMasterColor
---@alias PlayerColor PlayerHandColor | PlayerSpectatorColor

---# Player Manager
---`Player` is a global which allows you to retrieve
---[Player instances](https://api.tabletopsimulator.com/player/instance/)
---
---## Actions
---The [onPlayerAction](https://api.tabletopsimulator.com/events/#onplayeraction) event allows you to handle player
---actions. A list of player actions is available as `Player.Action`.
---@class Player: userdata, { [PlayerColor]: PlayerInstance }
---@field White PlayerInstance
---@field Brown PlayerInstance
---@field Red PlayerInstance
---@field Orange PlayerInstance
---@field Yellow PlayerInstance
---@field Green PlayerInstance
---@field Teal PlayerInstance
---@field Blue PlayerInstance
---@field Purple PlayerInstance
---@field Pink PlayerInstance
---@field Black PlayerInstance
---@field Grey PlayerInstance
Player = {}

---## Actions

---The [onPlayerAction](https://api.tabletopsimulator.com/events/#onplayeraction) event allows you to handle player
---actions. A list of player actions is available as `Player.Action`.
---### Example
---Log all available player actions:
---```
---log(Player.Action)
---```
---For more details about these actions, please refer to the documentation for [onPlayerAction](https://api.tabletopsimulator.com/events/#onplayeraction).
---@enum PlayerAction
Player.Action = {
    --- Copy (or commence cloning) the targets.
    Copy = 0,
    ---Cut (copy and delete) the targets.
    Cut = 1,
    ---Delete the targets.
    Delete = 2,
    ---Incrementally rotate the targets counter-clockwise around their flip axes, typically the scene's Z-axis.
    FlipIncrementalLeft = 3,
    ---Incrementally rotate the targets clockwise around their flip axes, typically the scene's Z-axis.
    FlipIncrementalRight = 4,
    ---Rotate the targets 180 degrees around their flip axes, typically the scene's Z-axis i.e. toggle the targets
    ---between face up and face down.
    FlipOver = 5,
    ---Group the targets.
    Group = 6,
    ---Paste (spawn) the targets.
    Paste = 7,
    ---Pick up the targets.
    PickUp = 8,
    ---Randomize the targets.
    Randomize = 9,
    ---Rotate the targets incrementally counter-clockwise around the scene's Y-axis.
    --->### 🔥 Important
    --->Instead of being rotated exclusively around the Y-axis, dice will be rotated to the previous rotation value.
    RotateIncrementalLeft = 10,
    ---Rotate the targets incrementally clockwise around the scene's Y-axis.
    --->### 🔥 Important
    --->Instead of being rotated exclusively around the Y-axis, dice will be rotated to the next rotation value.
    RotateIncrementalRight = 11,
    ---Rotate the targets 180 degrees around the scene's Y-axis.
    RotateOver = 12,
    ---Add the targets to the player's selection.
    Select  = 13,
    ---Move the targets underneath objects below them on the table.
    Under = 14,
}


---Gets a table of strings of every valid seat color at the current table. Returned colors are in the default order.
---
---@return PlayerHandColor[] # A table of strings of every valid seat color at the current table.
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/player/manager/#getavailablecolors)
---@nodiscard
function Player.getAvailableColors() end

---Returns a table of strings of every possible seat color. Returned colors are in the default order.
---
---@return PlayerColor[] # A table of strings of every possible seat color.
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/player/manager/#getcolors)
---@nodiscard
function Player.getColors() end

---Returns a table of all [Player instances](https://api.tabletopsimulator.com/player/instance/).
---
---@return PlayerInstance[] # A table of all Player instances.
---
---***
---
---```
---### Example Usage
---for _, player in ipairs(Player.getPlayers()) do
---    player.blindfolded = true
---end
---```
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/player/manager/#getplayers)
---
---***
---
---@see PlayerInstance
---@nodiscard
function Player.getPlayers() end

---Returns a table of all spectator (Grey) [Player instances](https://api.tabletopsimulator.com/player/instance/).
---@return PlayerInstance[] # A table of all spectators
---
---***
---
---### Example Usage
---```
-----Print the steam name of all spectators.
---for _, spectator in ipairs(Player.getSpectators()) do
---    print(spectator.steam_name)
---end
---```
---
---***
---
---
---@nodiscard
function Player.getSpectators() end
