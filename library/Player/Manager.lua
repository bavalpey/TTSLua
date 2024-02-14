---@meta PlayerManager

---# Player Manager
---`Player` is a global which allows you to retrieve
---[Player instances](https://api.tabletopsimulator.com/player/instance/)
---
---## Actions
---The [onPlayerAction](https://api.tabletopsimulator.com/events/#onplayeraction) event allows you to handle player
---actions. A list of player actions is available as `Player.Action`.
---@class Player: userdata
Player = {}

---Gets a table of strings of every valid seat color at the current table. Returned colors are in the default order.
---
---@return string[] # A table of strings of every valid seat color at the current table.
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/player/manager/#getavailablecolors)
---@nodiscard
function Player.getAvailableColors() end

---Returns a table of strings of every possible seat color. Returned colors are in the default order.
---
---@return string[] # A table of strings of every possible seat color.
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
