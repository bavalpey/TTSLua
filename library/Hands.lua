---@meta PlayerHands

---@alias HandHidingEnum
---| 1 # Default. The contents of a player's hands are only visible to the owner.
---| 2 # Reverse. The contents of a player's hands are visible to all players.
---| 3 # Disable. Contents of all player hands are visible to all players.

---# Hands
---@class Hands
Hands = {}


---The parameters used by the`PlayerInstance.setHandTransform` function.
---@class Hands.Transform.Parameters
---@field position? Vector Position of the hand zone. *Optional, deaults to {x=0, y=0, z=0}*
---@field rotation? Vector Rotation of the hand zone. *Optional, defaults to {x=0, y=0, z=0}*
---@field scale? Vector Scale of the hand zone. *Optional, defaults to {x=0, y=0, z=0}*<br>&emsp;&emsp; + ⚠️ If the scale is set to 0, the player's hand will exist, but will be unable to contain any Objects.

---@class Hands.Transform.Properties
---@field position Vector Position of the hand zone.
---@field rotation Vector Rotation of the hand zone.
---@field scale Vector Scale of the hand zone.
---@field forward Vector Forward direction of the hand zone.
---@field right Vector Right direction of the hand zone.
---@field up Vector Up direction of the hand zone.