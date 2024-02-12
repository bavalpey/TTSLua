---@meta States

---The data returned by `getStates` contains sub-Tables, each containing these key value pairs
---@class ObjectState.Properties
---@field name string The name of the item.
---@field description string The description of the item.
---@field guid string GUID of the item.
---@field id int Index of the item, represents the item's order in the states.
---@field lua_script string Any Lua scripting saved on the item.
---@field lua_script_state string Any JSON save data on this item.
local StateData = {
    ---A duplicate of the "name" field.<ul><ul><li>This is for backwards compatibility purposes only.</li></ul></ul>
    ---@deprecated
    ---@type string
    nickname = ...
}
