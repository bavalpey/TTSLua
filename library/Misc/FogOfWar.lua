---@meta FogOfWar


---The parameters to `setFogOfWarReveal` are a Table with these keys.
---
---All keys are optional; ommitting one will keep its current setting.
---@class FogOfWarRevealParameters
---@field reveal bool Whether the object reveals fog of war.
---The play colors that can see the revealed area. Setting this to "Black" or "All" will provide visibility to all
---players.
---@field color string
---@field range float How far from the Object the reveal effect reaches (radius, inches)
---@field height float Offset for the field of view of the fog of war revealed.
---@field FoV float The field of view of the fog of war revealed. *Range 0-360*
---@field FoVOffset float Offset for the field of view of the fog of war revealed.
---@field ShowOutline bool Whether an outline for the revealed area is shown.
