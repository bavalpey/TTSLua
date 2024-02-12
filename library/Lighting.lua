---@meta Lighting

---# Lighting

---@alias ambientTypeEnum
---| 1 # Background
---| 2 # Gradient

---Lighting, a static global class, is the in-game light of the map. It allows you to modify the lighting of the
---instance in the same way that the [in-game lighting menu](https://kb.tabletopsimulator.com/host-guides/lighting/)
---does. You call these functions like this: `Lighting.apply()`.
---
---For more information on lighting in Unity, [refer to the Unity documentation](https://docs.unity3d.com/Manual/LightingOverview.html).
---
---### Example Usage
---Make the lighting *bright* red.
---```
---Lighting.light_intensity = 2
---Lighting.setLightColor({r = 1, g = 0.6, b = 0.6})
---Lighting.apply()
---```
---@class Lighting: userdata
---@field ambient_intensity float The strength of the ambient light. Range = 0 to 4.
---@field ambient_type ambientTypeEnum The source of ambient light.
---@field light_intensity float The strength of the directional light shining down in the scene. Range = 0 to 4.
---@field lut_index int The LUT index of the light.
---@field lut_url string The URL of the LUT.
---@field reflection_intensity float The strength of the reflections from the background. Range = 0 to 1.
Lighting = {}

---Apply pending changes made via the Lighting class.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/lighting/#apply)
---
function Lighting.apply() end

---Return the Color of the gradient equator. Not used if `ambient_type = 1`.
---@return Color
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/lighting/#getambientequatorcolor)
---
function Lighting.getAmbientEquatorColor() end

---Return the Color of the gradient ground. Not used if `ambient_type = 1`.
---@return Color
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/lighting/#getambientgroundcolor)
---
function Lighting.getAmbientGroundColor() end

---Return the Color of the gradient sky. Not used if `ambient_type = 1`.
---@return Color
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/lighting/#getambientskycolor)
---
function Lighting.getAmbientSkyColor() end

---Return the Color of the directional light, which shines straight down on the table.
---@return Color
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/lighting/#getdirectionallightcolor)
---
function Lighting.getLightColor() end

---Set the Color of the gradient equator. Not used if `ambient_type = 1`.
---@param tint Color The new Color
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/lighting/#setambientequatorcolor)
---
function Lighting.setAmbientEquatorColor(tint) end

---Set the Color of the gradient ground. Not used if `ambient_type = 1`.
---@param tint Color The color to set the ground to.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/lighting/#setambientgroundcolor)
---
function Lighting.setAmbientGroundColor(tint) end

---Set the Color of the gradient sky. Not used if `ambient_type = 1`.
---@param tint Color The color to set the sky to.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/lighting/#setambientskycolor)
---
function Lighting.setAmbientSkyColor(tint) end

---Set the Color of the directional light, which shines straight down on the table.
---@param tint Color The Color to set the directional light to.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/lighting/#setdirectionallightcolor)
---
function Lighting.setLightColor(tint) end
