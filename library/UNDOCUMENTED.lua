---@meta UNDOCUMENTED

---THINGS IN THIS MODULE EXIST IN TTS BUT ARE NOT OFFICIALLY DOCUMENTED (as of version 13.2.2 hotfix 1)


pack = table.pack
unpack = table.unpack


---https://www.moonsharp.org/additions.html#the-json-module
---@class jsonlib
json = {
    null =
    ---@return 
    function() end,
    ---Returns true if the value specified is a null read from json
    isNull=
    ---
    function(json) end,
    ---@type fun
}