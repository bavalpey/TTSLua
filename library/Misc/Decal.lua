---@meta Decal

---# Decals are an abstract class used by the addDecal functions.
---@class Decal


---The parameters used by the `Global.addDecal` and `Object.addDecal` functions.
---
---***
---@see Global.addDecal
---@see Object.addDecal
---@class Decal.Parameters
---@field name string The name of the decal being placed.
---@field url string The file path or URL for the image to be displayed.
---@field position Vector? Where to place the decal relative to the Object. *Optional, defaults to {x=0, y=0, z=0}*
---@field rotation Vector? How the decal should be rotated relative to the Object. *Optional, defaults to {x=0, y=0, z=0}*
---@field scale Vector? How the image should be scaled on each axis. *Optional, defaults to {x=1, y=1, z=1}*<br>&emps;&emsp;**🔥 Relative to the actual image's dimensions, not the object!**

---The properties of decals returned by the `Global.getDecals` and `Object.getDecals` functions.
---@class decal.Properties
---@field name string The name of the decal.
---@field url string The file path or URL of the displayed image.
---@field position Vector The position of the decal relative to the Object.
---@field rotation Vector The rotation of the decal relative to the Object.
---@field scale Vector How the image is scaled **🔥 Relative to the actual image's dimensions, not the object!**.
---
---@see Global.getDecals
---@see Object.getDecals
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/decal/)
---

