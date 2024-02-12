---@meta JSON


---# JSON

---@alias JSONValue string | number | table


---The static global JSON class provides the ability to encode/decode data into JSON strings. This is largely used by the onSave() event function, but has other potential applications as well. The JSON class can be used on any String, Int, Float or Table. You call these functions like this: JSON.encode(...).
---
--->### ⚠️ Warning
--->This class **does not** work with Object references. Use the Object's GUID instead.
---@class JSON
JSON = {
    AUTHOR_NOTE = "-[ JSON.lua package by Jeffrey Friedl (http://regex.info/blog/lua/json) version 20141223.14 ]-",
    VERSION = 20141223.14,
}

---Decodes a valid JSON string into a Lua string, number, or table.
---@param json_string string A String that is decoded, generally created by encode(...) or encode_pretty(...).
---@return JSONValue
---
---***
---
---### Example Usage
---```
---coded = JSON.encode("Test")
---print(coded) --Prints "Test"
---decoded = JSON.decode(coded)
---print(decoded) --Prints Test
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/json/#decode)
---
function JSON.decode(json_string) end

---Encodes a Lua string, number, or table into a valid JSON string. This will not work with Object references.
---@param variable JSONValue
---@return string
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/json/#encode)
---
JSON.encode = function(variable) end

---Encodes a Lua string, number, or table into a valid JSON string formatted with indents (Human readable). This will not work with Object references.
---@param variable JSONValue
---@return string
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/json/#encode_pretty)
JSON.encode_pretty = function(variable) end

return JSON
