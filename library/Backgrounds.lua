---@meta Backgrounds

---# Backgrounds

---`Backgrounds` is a global class that provides the ability to interact with the background.
---
---[Open Documentation](https://api.tabletopsimulator.com/backgrounds/)
---@class Backgrounds
Backgrounds = {}

---Return the current background name.
---@return string
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/backgrounds/#getbackground)
function Backgrounds.getBackground() end

---Return the image URL of the current custom background, or `nil` if the current background is not a custom background.
---@return string|nil
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/backgrounds/#getcustombackground)
---
function Backgrounds.getCustomBackground() end

---Replace the current background with the background matching the specified `name`.
---@param name string
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/backgrounds/#setbackground)
function Backgrounds.setBackground(name) end

---Replace the current background with the custom background loaded from the specified `url`.
---@param url string
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/backgrounds/#setcustombackground)
function Backgrounds.setCustomBackground(url) end
