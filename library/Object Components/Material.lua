---@meta Material

---# Material
---
---The Material of a Renderer [component](https://api.tabletopsimulator.com/components/component/) is the primary method of controlling that object's appearance.
---@class Material: userdata
---@field game_object GameObject The GameObject the Material is attached to.
---@field shader string The name of the shader used by the Material.
local Material = {}

---Obtain the value of a given Variable on a Material
---@param name string
---@return any
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/components/material/#get)
---
function Material.get(name) end

---Returns a table mapping Var names to their type
---@return table<string, string>
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/components/material/#getvars)
---
function Material.getVars() end

---Sets the Var of the specified `name` to the provided `value`
---@param name string
---@param value any
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/components/material/#set)
---
function Material.set(name, value) end
