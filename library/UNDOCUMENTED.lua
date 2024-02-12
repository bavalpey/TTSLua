---@meta UNDOCUMENTED

---THINGS IN THIS MODULE EXIST IN TTS BUT ARE NOT OFFICIALLY DOCUMENTED (as of version 13.2.2 hotfix 1)


pack = table.pack
unpack = table.unpack


---https://www.moonsharp.org/additions.html#the-json-module
---@class jsonlib
json = {}

---Returns a table with the contents of `jsonString`.
---@param jsonString string
---@return table # A table with the contents of `jsonString`
---
---***
---
---[Open Documentation](https://www.moonsharp.org/additions.html#the-json-module)
function json.parse(jsonString) end

---@param table table
---
---***
---
---[Open Documentation](https://www.moonsharp.org/additions.html#the-json-module)
function json.serialize(table) end


---Returns true if the value specified is a null read from a json
---@param val any
---@return bool
---
---***
---
---[Open Documentation](https://www.moonsharp.org/additions.html#the-json-module)
function json.isnull(val) end

---@return userdata
function json.null() end


---This class describes the structure of the table returned by `inspect`.
---@class InspectResultTable
---@field name string
---@field variables {name: string, type: string}[]
---@see inspect

---Returns information
---@param var any
---@return table|nil
---
--->### ⚠️ Warning
--->This function is not officially Documented on Tabletop Simulator's API Documentation.
function inspect(var) end
