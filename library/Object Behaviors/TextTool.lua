---@meta TextTool

---The `TextTool` behavior is present on the text objects created with the [text tool](https://kb.tabletopsimulator.com/game-tools/text-tool/).
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/texttool/)
---@class TextTool
local TextTool = {}

---
---Return the Color of the font
---@return Color
function TextTool.getColor() end

---
---Return the font size
---@return int
function TextTool.getFontSize() end

---
---Return the current text. Behaves the same as Object's [getValue()](https://api.tabletopsimulator.com/object/#getvalue).
---@return string
---
---***
---@see Object.getValue
function TextTool.getValue() end

---
---Set the color of the font.
---@param color Color
---@return bool
function TextTool.setColor(color) end

---
---Set the font size.
---@param size int
---@return bool
function TextTool.setFontSize(size) end

---
---Set the current text. Behaves the same as Object's [setValue()](https://api.tabletopsimulator.com/object/#setvalue).
---@param value string
---@return bool
function TextTool.setValue(value) end
