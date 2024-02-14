---@meta Object_Components

---# Introduction
--->### 🚨 Danger
--->Component APIs are an advanced feature. An **understanding of how Unity works is required** to utilize them.
---A Component is a collection of functions and variables that allow you to control object behavior.
---
---Components are a [Unity concept](https://docs.unity3d.com/Manual/Components.html), they're the building blocks that
---Tabletop Simulator objects are composed of.
---## Components
---GameObjects are themselves made up of [Components](https://api.tabletopsimulator.com/components/component/). A
---typical GameObject would contain a Collider, Transform, Mesh etc. These Components describe the GameObject's
---behavior and visual representation.
---
--->### 🔥 Tip
--->In addition to built\-in Objects, the Component APIs provide access the GameObjects and Components that exist in
---AssetBundles. This means that when creating an AssetBundle, you may attach all manner of components (lights, sounds
---etc.) and you'll be able to control them via these APIs.
---
---## Vars
---Each Component has **Vars**. These are variables which you can modify to change how that Component affects the
---GameObject it composes.
---
---## Materials
---GameObjects with Renderer components typically also have attached
---[Materials](https://api.tabletopsimulator.com/components/material/), which govern the appearance of the object.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/components/introduction/)

---Every object in Tabletop Simulator is a [GameObject](https://api.tabletopsimulator.com/components/gameobject/). When
---a game is created, GameObjects are loaded, initialized and some of these top-level GameObjects are then exposed via
---Tabletop Simulator's Lua scripting APIs as regular Objects, each with their own scripting contexts.
---
---Some Lua-exposed Objects are made-up of hierarchy of children GameObjects. The Component APIs allow to access and
---interact with these children GameObjects (which you'd otherwise be unable to control).
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/components/gameobject/)
---@class GameObject: userdata
---@field name string The name of the GameObject
local GameObject = {}

---Return a child GameObject matching the specified `name`.
---@param name string
---@return GameObject
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/components/gameobject/#getchild)
function GameObject.getChild(name) end

---Return the list of children GameObjects.
---@param name string
---@return GameObject[]
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/components/gameobject/#getchildren)
function GameObject.getChildren(name) end

---Return a Component matching the specified `name` from the GameObject's list of Components.
---@param name string
---@return Component
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/components/gameobject/#getcomponent)
function GameObject.getComponent(name) end

---Return a Component matching the specified `name`. Found by searching the Components of the GameObject and its
---[children](https://api.tabletopsimulator.com/components/gameobject/#getchildren) recursively (depth first).
---@param name string
---@return Component
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/components/gameobject/#getcomponentinchildren)
function GameObject.getComponentInChildren(name) end

---Return the GameObject's list of Components.
---@param name? string When specified, only Components with this `name` will be included.
---@return Component[]
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/components/gameobject/#getcomponents)
function GameObject.getComponents(name) end

---Return a list of Components found by searching the GameObject and its
---[children](https://api.tabletopsimulator.com/components/gameobject/#getchildren) recursively (depth first).
---@param name? string When specified, only Components with this `name` will be included.
---@return Component[]
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/components/gameobject/#getcomponentsinchildren)
function GameObject.getComponentsInChildren(name) end

---Return the GameObject's list of Materials.
---@return Material[]
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/components/gameobject/#getmaterials)
function GameObject.getMaterials() end

---Return a list of Materials found by searching the GameObject and its
---[children](https://api.tabletopsimulator.com/components/gameobject/#getchildren) recursively (depth first).
---@return Material[]
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/components/gameobject/#getmaterialsinchildren)
function GameObject.getMaterialsInChildren() end
