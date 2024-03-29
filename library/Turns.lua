---@meta Turns

---# Turns

----Turns, a static global class, is the in-game turns system. It allows you to modify the player turns in the same way
---that the in-game Turns menu does.
---@class Turns
---@field enable boolean Enable/disable the turns system.
---@field type int If the turn order is automatic or custom. 1=auto, 2=custom.
---@field order string[] A table of strings, representing the player turn order.
---@field reverse_order bool Enable/disable reversing turn rotation direction.
---@field skip_empty bool Enable/disable skipping empty turns of players with empty hands.
---@field pass_turns bool Enable/disable a player's ability to pass their turn to another.
---@field turn_color string The color of the Player whose turn it is.
---
---***
----
---[Open Documentation](https://api.tabletopsimulator.com/turns/)
Turns = {}

---Returns the Player Color string of the next player in the turn order.
---@return string
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/turns/#getnextturncolor)
---
function Turns.getNextTurnColor() end

---Returns the Player Color string of the previous player in the turn order.
---@return string
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/turns/#getpreviousturncolor)
---
function Turns.getPreviousTurnColor() end
