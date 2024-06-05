---@meta Grid

---@alias GridTypeEnum
---| 1 # Rectangles
---| 2 # Horizontal hexes
---| 3 # Vertical hexes

---@alias GridSnappingEnum
---| 1 # Off
---| 2 # Lines
---| 3 # Center
---| 4 # Both

---A static global class controlling the in-game grid. It allows you to manipulate the placement and appearance of the
---grid in the same way as the in-game interface.
---@class Grid
---@field type GridTypeEnum The type of the grid.
---@field show_lines bool Visibility of the grid lines.
---@field color ColorLike Color of the grid lines.
---@field opacity float Opacity of the grid lines.
---@field thick_lines bool Thickness of the grid lines. false = Thin, true = Thick.
---@field snapping GridSnappingEnum Method of snapping objects to the grid.
---@field offsetX float X offset of the grid origin.
---@field offsetY float Y offset of the grid origin.
---@field sizeX float Width of the grid cells.
---@field sizeY float Height of the grid cells.
---
---***
---
---### Example Usage
---```
---Grid.show_lines= = true```
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/grid/)
Grid = {}

return Grid
