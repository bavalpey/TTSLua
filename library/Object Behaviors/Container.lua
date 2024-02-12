---@meta Container

---# Container
---The Container behavior is present on Container objects such as Bags, Stacks and Decks.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/container/)
---
---@class Container
local Container = {}

---Show the Search window for the container to `player`. If you specify `max_cards` then the search will be limited to
---that many cards from the top of the deck.
---@param player Player The player to show the Search window to.
---@param max_cards? int Optional maximum number of cards to show.
---
---### Example Usage
---```
---deck.Container.search(Player.Blue, 3)
---```
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/container/#search)
---
function Container.search(player, max_cards) end



---The data returned when calling `getObjects()` on a Container or deck.
---@class ObjectInContainerData
---@field description string [Description](https://api.tabletopsimulator.com/object/#getdescription) of the contained object.
---@field gm_notes string [GM Notes](https://api.tabletopsimulator.com/object/#getgmnotes) of the contained object.
---@field guid string [GUID](https://api.tabletopsimulator.com/object/#guid) of the contained object.
---@field index int Index of the contained object, represents the item's order in the container.
---@field lua_script string [Lua script](https://api.tabletopsimulator.com/object/#script_code) on the contained object.
---@field lua_script_state string [Lua script saved state](https://api.tabletopsimulator.com/object/#script_state) of the contained object.
---@field memo string [Memo](https://api.tabletopsimulator.com/object/#memo) on the contained object.
---Name of the contained object.
---
---Will correspond with [getName](https://api.tabletopsimulator.com/object/#getname), unless it's blank, in which case
---it'll be the [internal resource name](https://api.tabletopsimulator.com/object/#name).
---@field name string
---@field tags string[] A table of strings representing the [tags](https://kb.tabletopsimulator.com/game-tools/object-tags/) on the contained object.
---
---***
---
---### Example Usage
---Find a contained object with the name "Super Card" (within the Bag/Deck `object`), and use its index to
---[take the object out](https://api.tabletopsimulator.com/object/#takeobject) of the container.
---```
----- Iterate through each contained object
---for _, containedObject in ipairs(object.getObjects()) do
---    if containedObject.name == "Super Card" then
---        object.takeObject({
---            index = containedObject.index
---        })
---        break -- Stop iterating
---    end
---end
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getobjects-containers)
---
local ObjectInContainerData = {
    ---*[``deprecated``](https://api.tabletopsimulator.com/intro/#deprecated) Use `name`.*
    ---
    ---[Name](https://api.tabletopsimulator.com/object/#getname) of the item.
    ---@deprecated
    ---@type string
    nickname = ...,
}