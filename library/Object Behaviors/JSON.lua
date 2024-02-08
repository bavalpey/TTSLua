---@meta JSON

---@private
_JSON = require('_JSON')


---@alias JSONValue string | number | table
---@class JSONlib
JSON = {
    AUTHOR_NOTE = _JSON.AUTHOR_NOTE,
    VERSION = 20141223.14,
}

--[[
    JSON:
  functions:
    - [decode, any, 'Decodes a valid JSON string into a Lua string, number, or table.', /json/#decode]:
      - [json_string, string]
    - [encode, string, 'Encodes a Lua string, number, or table into a valid JSON string. This will not work with Object references.', /json/#encode]:
      - [variable, any]
    - [encode_pretty, string, 'Encodes a Lua string, number, or table into a valid JSON string formatted with indents (Human readable). This will not work with Object references.', /json/#encode_pretty]:
      - [variable, any]

--]]

---@class JSONlib
JSON = {
    AUTHOR_NOTE = _JSON.AUTHOR_NOTE,
    VERSION = 20141223.14,
}



_JSON = require('_JSON')

---@class JSONlib
JSON = {
    AUTHOR_NOTE = _JSON.AUTHOR_NOTE,
    VERSION = 20141223.14,
}

---Decodes a valid JSON string into a Lua string, number, or table.
---@param json_string string
---@return JSONValue
function JSON.decode(json_string) end

---Encodes a Lua string, number, or table into a valid JSON string. This will not work with Object references.
---@param variable JSONValue
---@return string
JSON.encode = function(variable) end

---Encodes a Lua string, number, or table into a valid JSON string formatted with indents (Human readable). This will not work with Object references.
---@param variable JSONValue
---@return string
---
---***
---
---[](tabletop)
JSON.encode_pretty = function(variable) end

