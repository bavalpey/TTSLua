---@meta Component

---# Component
---> ### Danger
---> Component APIs are an advanced feature. An **understanding of how Unity works is required** to utilize them.
---@class Component
---@field game_object GameObject The GameObject the Component composes.	
---@field name string The name of the Component.
local Component = {}

---Obtain the value of a given Variable on a Component.
---@param name string
---@return any
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/components/component/#get)
function Component.get(name) end

---Returns a table mapping Var names to their type.
---@return table<string, string>
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/components/component/#getvars)
function Component.getVars() end

---Sets the Var of the specified `name` to the provided `value`.
---@param name string
---@param value any
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/components/component/#set)
function Component.set(name, value) end
