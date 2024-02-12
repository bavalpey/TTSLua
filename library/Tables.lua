---@meta Tables

---# Tables

---@alias TableNames
---| '"Table_Circular"'
---| '"Table_Custom"'
---| '"Table_Custom_Square"'
---| '"Table_Glass"'
---| '"Table_Hexagon"'
---| '"Table_None"'
---| '"Table_Octagon"'
---| '"Table_Plastic"'
---| '"Table_Poker"'
---| '"Table_RPG"'
---| '"Table_Square"'

---@alias HumanReadableTableNames
---| '"Custom Rectangle"'
---| '"Custom Square"'
---| '"Hexagon"'
---| '"None"'
---| '"Octagon"'
---| '"Poker"'
---| '"Rectangle"'
---| '"Round"'
---| '"Round Glass"'
---| '"Round Plastic"'
---| '"Square"'

---`Tables` is a global which provides the ability to interact with the Table object.
---
--->### 🔥 Imporant
--->Not to be confused with Lua's `table` type.
---
---@class Tables
Tables = {}

---Returns the image URL of the current
---[Custom Table](https://kb.tabletopsimulator.com/host-guides/tables/#custom-table), or `nil` if the current table is
---not a custom table.
---
---@return string|nil
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/tables/#getcustomurl)
---
function Tables.getCustomUrl() end

---Returns the current Table's [name](https://api.tabletopsimulator.com/object/#name) i.e. equivalent to
---`getTableObject().name`.
---
---@return TableNames
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/tables/#getname)
---
function Tables.getName() end

---Returns the current Table object.
---@return Object
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/tables/#gettableobject)
---
function Tables.getTableObject() end

---Sets the image URL for the current [Custom Table](https://kb.tabletopsimulator.com/host-guides/tables/#custom-table).
---Has no effect if the current Table is not a Custom Table.
---@param url string
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/tables/#setcustomurl)
---
function Tables.setCustomUrl(url) end

---Replaces the current table with the Table matching the specified `name`.
---@param name TableNames|HumanReadableTableNames Table name, can be either the `TableNames` or `HumanReadableTableNames`.
---@return bool
---
---***
---
---### Example Usage
---Replace the current table with the Poker Table.
---```
---Tables.setTable("Poker")
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/tables/#setname)
---
function Tables.setName(name) end
