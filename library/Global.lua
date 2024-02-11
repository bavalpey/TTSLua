---@meta Global

---# Global Function
---The functions can be used on Objects, but can also be used on the game world using `Global`.
---
--->### Examples of using Global and Object
---> + `self.getSnapPoints()` gets snap points attached to that Object.
---> + `Global.getSnapPoints()` gets snap points not attached to any specific Object but instead are attached to the
---game world.

---Global is a special Object that can be used to access the game world and perform various operations on it.
---
---### 🔥 All of the fields that exist on the Object class technically exist on the Global class.
---However, attempting to access fields not explicitly included on the Global class will result in a runtime error.
---@class Global: userdata
---@field script userdata
---@field script_code string
---@field script_state string 
---@field name string Always Scripting Manager
---@field spawning bool
---@private _registeredForCollisions bool
Global = {
    guid = "-1",
    name = "Scripting Manager",
    ---@type string
    type = "Untagged",
    ---@deprecated
    ---@type string
    tag = "Untagged",
    ---⚠️ Always true regardless of whether assets are loading
    ---@type bool
    loading_custom = true,
}



---# Undocumented
---These functions are not documented to work on global, but have been tested and shown to work.

---The GUID of the game world is always -1
---@return 1
function Global.getGUID() end

---@return bool
function Global.registerCollisions() end

---@return bool
function Global.unregisterCollisions() end


---@return false
function Global.reset() return false end

---Always returns `Vector(0, 0, 0)`
---@return {x: 0, y: 0, z:0}
function Global.getRotation() end

---Always returns `Vector(0, 0, 0)`
---@return {x: 0, y: 0, z:0}
function Global.getPosition() end

---Always returns the given vector
---@param position Vector
---@return Vector
function Global.positionToLocal(position) end


---Always returns the given vector
---@param position Vector
---@return Vector
function Global.positionToWorld(position) end

---Always returns `Vector(1, 0, 0)`
---@return {x: 1, y: 0, z: 0}
function Global.getTransformRight() end

---Always returns `Vector(0, 0, 1)`
---@return {x: 0, y: 0, z: 1}
function Global.getTransformForward() end

---Always returns `Vector(0, 1, 0)`
---@return {x: 0, y: 1, z: 0}
function Global.getTransformUp() end


---Returns all of the Objects in the game world
---@return Object[]
function Global.getObjects() end

---Always returns an empty table regardless of the zones in the game world.
---@return {}
function Global.getZones() end

---@param name ""
---@return GameObject
---@overload fun(name: string):nil
function Global.getChild(name) end

---Always returns an empty table.
---@return {}
function Global.getChildren() end

---Always returns {[1]: GameObject} if name is "Transform", otherwise returns an empty table.
---@param name "Transform"
---@return nil
---@overload fun(name: string):{}
function Global.getComponent(name) end

---Always returns {[1]: GameObject} if name is `""` or `"Transform"`, otherwise returns an empty table.
---@param name ""
---@return {[1]: GameObject}
---@overload fun(name: string):{}
function Global.getComponents(name) end

---Always returns {[1]: GameObject} if name is `""` or `"Transform"`, otherwise returns an empty table.
---@param name ""|"Transform"
---@return {[1]: GameObject}
--@overload fun(name: string):{}}
function Global.getComponentInChildren(name) end

---@return nil




--# Global Functions
---These functions can be used on Objects, but can also be used on the game world using `Global`.


---Add a Decal onto the game world
---@param parameters table
---@return boolean
---
---***
---
---### Example Usage
---```
---function onLoad()
---    local params = {
---        name     = "API Icon",
---        url      = "https://api.tabletopsimulator.com/img/TSIcon.png",
---        position = {0, 5, 0},
---        rotation = {90, 0, 0},
---        scale    = {1, 1, 1},
---    }
---    Global.addDecal(params)
---end
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#adddecal)
function Global.addDecal(parameters)
end
