---@meta Physics

---# Physics

---Physics, a static global class, allows access to casts and gravity. Physics casts are a way to detect Objects. You
---call these functions like this: `Physics.getGravity()`. This class also allows you to access elements of the
---environment.
---
---For more information on physics casts in Unity,
---[refer to the Unity documentation](https://docs.unity3d.com/ScriptReference/Physics.html) under
---BoxCast/RayCast/SphereCast.
---@class Physics: userdata
---
---The size of the play area being used. (i.e. how far from the midle you can get). Values from 0-1. Default is 0.5.
---@field play_area float
Physics = {}

---@alias castTypeEnum
---| 1 # Ray (A line)
---| 2 # Box (A cube, rectangle, plane).
---| 3 # Sphere (A round ball. You cannot make ovals.)

---The table used by the `Physics.cast` function to specify the parameters of the cast.
---@class CastParameters
---@field origin? Vector Position of the starting point. *Optional, defaults to {x=0, y=0, z=0}*
---@field direction? Vector The direction of the cast. *Optional, but cast is motionless without a direction*
---


---The table returned by the `Physics.cast` function containing information about the hit Objects.
---@class CastReturnTable
---@field point Vector Position the cast impacted the Object.
---@field normal Vector the surface normal of the impact point.
---@field distance float Distance between cast origin and impact point.
---@field hit_object Object An Object reference to the Object hit by the cast.

---Casts a ray, box, or sphere into the game world and returns information about the hit Objects.
---
--->### ⚠️ Warning
--->Physics casts are somewhat expensive. When running 30+ at once it will cause your game to stutter and/or crash. Do
--->not overuse.
--->
--->### ✏️ Note
--->The above warning, taken from the official documentation, is not entirely accurate. A common use case for phyiscs
--->casts is to find objects within a region. This can be efficiently done by setting `max_distance` to 0 and setting
--->`direction` to `{x=0, y=0, z=0}`, and then defining the cast region. By doing this 0, Unity will not have to perform
--->the expensive simulation of moving the cast through the game world.
---
---@param parameters CastParameters The parameters of the cast.
---@return CastReturnTable[] # A table of CastReturnTable containing information about the hit Objects.
---
---***
---
---### Example Usage
---```
----- This function, when called, returns a table of hit data
---function findHitsInRadius(pos, radius)
---    local radius = (radius or 1)
---    local hitList = Physics.cast({
---        origin       = pos,
---        direction    = {0,1,0},
---        type         = 2,
---        size         = {radius,radius,radius},
---        max_distance = 0,
---        debug        = true,
---    })
---
---    return hitList
---end
---function Physics.cast(parameters) end
----- Example returned Table
---{
---    {
---        point = {x=0,y=0,z=0},
---        normal = {x=1,0,0},
---        distance = 4,
---        hit_object = objectreference1,
---    },
---    {
---        point = {x=1,y=0,z=0},
---        normal = {x=2,0,0},
---        distance = 5,
---        hit_object = objectreference2,
---    },
---}
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/physics/#cast)
---
function Physics.cast(parameters) end

---Returns the directional Vector of the direction gravity is pulling.
---@return Vector #The current gravity vector.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/physics/#getgravity)
---
function Physics.getGravity() end

---Sets the direction gravity pulls.
---@param gravity Vector The new gravity vector.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/physics/#setgravity)
function Physics.setGravity(gravity) end
