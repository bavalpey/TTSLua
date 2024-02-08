---@meta Info

---# Info
---`Info` global allows you to manipulate the information about your game/mod, in the same way as the in-game Options -> Info menu.
---
---This information helps players find your game/mod within Tabletop Simulator's server list and via Steam Workshop's search/filter capabilities.
---#### Example Usage
--->```
--->Info.name = "My Game"
--->```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/info/)
---
Info = {
    ---The complexity of the current game/mod
    ---@type string
    complexity = ...,
    ---Name of the current game/mod.
    ---@type string
    name = ...,
    ---	The number of players the current game/mod allows.
    ---@type table
    number_of_players = ...,
    ---The amount of time the current game/mod takes.
    ---@type table
    playing_time = ...,
    ---The tags associated with the current game/mod.
    ---@type table
    tags = ...,
    ---The category of the current mod.
    ---@type string
    type = ...,
}
