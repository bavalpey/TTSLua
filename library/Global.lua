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
---@field UI UI The global UI class that appears on each player's screen.
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
function Global.reset()
	return false
end

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

---Add a Decal onto an object or the game world
---
---@param parameters Decal.Parameters A Table of parameters used to determine how the function will act.
---@return bool
---
---***
---
--->### 🔥Relative Vectors
---When using this function, the vector parameters (position, rotation) are relative to what the decal is being placed
---on. For example, if you put a decal at ``{0,0,0}`` on Global, it will attach to the center of the game room. If you
---do the same to an object, it will place the decal on the origin point of the object.
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
--
function Global.addDecal(parameters) end

---Calls a Lua function on the Global script and passes an optional table as parameters to the function.
---
---@param function_name string Function name you want to activate.
---@param parameters? table A Table containing any data you want to pass to that function.<ul><ul><li>Optional, will not be sent by default.</li></ul></ul>
---@return any var #*Var is only returned if the function called has a `return`. Otherwise, return is `nil`. See example.*
---
---### Example Usage
---```
----- Call, used from an entity's script
---params = {
---    msg   = "Hello world!",
---    color = {r=0.2, g=1, b=0.2},
---}
----- Success would be set to true by the return value in the function
---success = Global.call("testFunc", params)
---```
---
---```
----- Function in Global
---function testFunc(params)
---    broadcastToAll(params.msg, params.color)
---    return true
---end
---```
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#call)
---
function Global.call(function_name, parameters) end

---Returns a table of sub-tables, each sub-table representing one Decal on in the world.
---
---@return Decal.Properties[]
---
---***
---
---### Example Returned Table
---```
----- If this object had 2 of the same decal on it
---decalTable = self.getDecals()
---
-----[[ This is what the table would look like
---{
---    {
---        name     = "API Icon",
---        url      = "https://api.tabletopsimulator.com/img/TSIcon.png",
---        position = {0, 5, 0},
---        rotation = {90, 0, 0},
---        scale    = {5, 5, 5}
---    },
---    {
---        name     = "API Icon",
---        url      = "https://api.tabletopsimulator.com/img/TSIcon.png",
---        position = {0, 5, 0},
---        rotation = {90, 0, 0},
---        scale    = {5, 5, 5}
---    },
---}
---]]--
---
----- Accessing the name of of the second entry would look like this
---print(decalTable[2].name)
---function Global.getDecals() end
---```
function Global.getDecals() end

---Get the Global Lua script.
---
---@return string
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getluascript)
---
function Global.getLuaScript() end

---Returns a table representing a list of snap points in the game world.
---@return SnapPoint.Properties[]
---***
---
---### Example Usage
---```
-----Log the list of global snap points
---log(Global.getSnapPoints)
function Global.getSnapPoints() end

---Get the reference to a table variable in the Global script.
---
---@param table_name string The name of the table to get.
---@return table?
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#gettable)
---
function Global.getTable(table_name) end

---Get the value of a variable in the Global script. Cannot return a table.
---
---@param var_name string
---@return any
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getvar)
---
function Global.getVar(var_name) end

---Returns a table of data representing the current Vector Lines in the game world.
---See [setVectorLines](https://api.tabletopsimulator.com/object/#setvectorlines) for table format.
---@return VectorLine.Properties[]
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getvectorlines)
---
function Global.getVectorLines() end

---Sets which decals are on the game world. This removes other decals already present, and can remove all decals as well.
---@param decals Decal.Parameters[] A table of Decal Properties to set on the Global.
---@return bool
---
---***
---
---### Example Usage
---```
---function onLoad()
---    local parameters = {
---        {
---            name     = "API Icon",
---            url      = "https://api.tabletopsimulator.com/img/TSIcon.png",
---            position = {-2, 5, 0},
---            rotation = {90, 0, 0},
---            scale    = 5,
---        },
---        {
---            name     = "API Icon",
---            url      = "https://api.tabletopsimulator.com/img/TSIcon.png",
---            position = {2, 5, 0},
---            rotation = {90, 0, 0},
---            scale    = 5,
---        },
---    }
---
---    Global.setDecals(parameters)
---end
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setdecals)
---
function Global.setDecals(decals) end

---Sets the Global Lua script.
---
---@param script string
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setluascript)
---
function Global.setLuaScript(script) end

---Creates/updates a table in this Global's script.
---
---@param table_name string The name of the table variable in the script.
---@param data table The data to set the table to.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#settable)
---
function Global.setTable(table_name, data) end

---Sets a variable in the Global script.
---
---@param var_name string The name of the variable in the script.
---@param value any The value to set the variable to.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setvar)
---
function Global.setVar(var_name, value) end

---Sets the Vector Lines in the game world.
---
---@param lines VectorLine.Parameters[] A table of Vector Line Properties to set on the Global.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setvectorlines)
---
function Global.setVectorLines(lines) end

---Sets the snap points on this object.
---@param snap_points SnapPoint.Parameters[] A list (numerically indexed table) of [snap points](https://api.tabletopsimulator.com/object/#setsnappoints-snap-points).
---@return bool
---
---***
---
---***
---
---### Example Usage
---```
-----Create 3 snap points. A regular snap point, a rotation snap point, and a rotation snap point with a tag.
---Global.setSnapPoints({
---    {
---        position = {5, 2, 5}
---    },
---    {
---        position = {5, 2, 5},
---        rotation = {0, 180, 0},
---        rotation_snap = true
---    },
---    {
---        position = {-3, 2, 0},
---        rotation = {0, 45, 0},
---        rotation_snap = true,
---        tags = {"meeple"}
---    }
---})
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setsnappoints)
---
function Global.setSnapPoints(snap_points) end

return Global
