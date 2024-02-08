---@meta Object

---@alias force_type
---| 1 Continuous force, uses mass. (Force)
---| 2 Continuous acceleration, ignores mass. (Acceleration)
---| 3 Instant force impulse, uses mass. (Impulse)
---| 4 Instant velocity change, ignores mass. (Velocity Change)

--- An in-game physical Object. Sometimes Global.
---
---The Object class represents any entity within tabletop simulator. Once you have a reference to an object in your script you can call functions on it directly. Example: ``obj.getPosition(...)``. You can get a reference to an object multiple ways;
---- Using the self property if your script is on an Object and referring to that Object.
---- Using [``getObjectFromGUID(...)``](https://api.tabletopsimulator.com/base/#getobjectfromguid) with the object's GUID (found by right clicking it with the pointer).
---- Getting it as a return from another function, like with [``spawnObject(...)``](https://api.tabletopsimulator.com/base/#spawnObject).
---@class Object
---@field alt_view_angle Vector When non-zero, the Alt view will use the specified Euler angle to look at the object.
---@field angular_drag float Angular drag. [Unity rigidbody proerty](https://docs.unity3d.com/2019.1/Documentation/Manual/class-Rigidbody.html).
---@field auto_raise bool If the object should be lifted above other objects to avoid collision when held by a player.
---@field bounciness float Bounciness, value of 0\-1. Unity physics material.
---@field drag float Drag. Unity rigidbody property.
---@field drag_selectable bool When `false`, the object will not be selected by regular (click and drag) selection boxes that are drawn around the object.<br><br>Players may proceed to override this behavior by holding the "Shift" modifier whilst drag selecting.
---@field dynamic_friction float Dynamic friction, value of 0\-1. [Unity physics material](https://docs.unity3d.com/2019.1/Documentation/Manual/class-PhysicMaterial.html).
---@field gizmo_selectable bool When `false`, the object cannot be selected with the Gizmo tool.
---@field grid_projection bool If grid lines can appear on the Object if visible grids are turned on.
---@field guid string The 6 character unique Object identifier within Tabletop Simulator. It is assigned correctly once the ``spawning`` member variable becomes false.
---@field held_by_color string The Color of the Player that is holding the object.
---@field held_flip_index int 0\-23 value. Changes when a player hits flip or alt + rotate.
---@field held_position_offset Vector Position offset from pointer.
---@field held_reduce_force bool When the Object collides with something while moving this is automatically enabled and reduces the movement force.
---@field held_rotation_offset Vector Rotation offset from pointer.
---@field held_spin_index int 0\-23 value. Changes when a Player rotates the Object.
---@field hide_when_face_down bool Hide the Object when face-down as if it were in a hand zone. The face is the "top" of the Object, the direction of its positive Y coordinate. Cards/decks default to ``true``.
---@field interactable bool If the object can be interacted with by Players. Other object will still be able to interact with it.
---@field is_face_down bool **Read Only** If the Object is roughly face-down (like with cards). The face is the "top" of the Object, the direction of its positive Y coordinate.
---@field loading_custom bool **Read only** If the Object's custom elements (images/models/etc) are loading.
---@field locked bool
---@field mass float Mass. [Unity rigidbody proerty](https://docs.unity3d.com/2019.1/Documentation/Manual/class-Rigidbody.html).
---@field max_typed_number int Determines the maximum number of digits which a user may type whilst hovering over the object.<br><br>As soon as a player types the maximum number of digits, the corresponding behavior (e.g. [onObjectNumberTyped](https://api.tabletopsimulator.com/events/#onobjectnumbertyped)/[onNumberTyped](https://api.tabletopsimulator.com/events/#onnumbertyped)) is triggered immediately, improving responsiveness.
---@field measure_movement bool Measure Tool will automatically be used when moving the Object.
---@field remainder Object **Read Only** If this object is a container that cannot exist with less than two contained objects (e.g. a deck), [taking out](https://api.tabletopsimulator.com/object/#takeObject) the second last contained object will result in the container being destroyed. In its place the last remaining object in the container will be spawned.<br><br>This variable provides a reference to the remaining object when it is being spawned. Otherwise, it's ``nil``.
---@field resting bool **Read Only** If the Object is at rest. [Unity rigidbody proerty](https://docs.unity3d.com/2019.1/Documentation/Manual/class-Rigidbody.html).
---@field script_code string The Lua Script on the Object.
---@field script_state string The saved data on the object. See [onSave()](https://api.tabletopsimulator.com/events/#onsave).
---@field spawning bool **Read Only** If the Object is finished spawning.
---@field static_friction float Static friction, value of 0\-1. [Unity physics material](https://docs.unity3d.com/2019.1/Documentation/Manual/class-PhysicMaterial.html).
---@field sticky bool If other Objects on top of this one are also picked up when this Object is.
---@field tooltip bool If the tooltip opens when a pointer hovers over the object. Tooltips display name and description.
---@field type string **Read Only** This object's type
---@field use_gravity bool If gravity affects this object.	
---@field use_grid bool If snapping to grid is enabled or not.	
---@field use_hands bool If this object can be held in a hand zone.	
---@field use_rotation_value_flip bool Switches the axis the Object rotates around when flipped.	
---@field use_snap_points bool If snap points are used or ignored.
---A numeric value associated with the object, which when non\-zero, will be displayed when hovering over the object.
---
---In the case of stacks, the value shown in the UI will be multiplied by the stack size i.e. you can use `value` to create custom stackable chips.
---
---When multiple objects are selected, values will be summed together with objects sharing overlapping [object tags](https://api.tabletopsimulator.com/object/#tag-functions).
---@field value int
---@field AssetBundle? AssetBundle **Available On** Custom "AssetBundle" objects.
---@field Book? Book **Available On** "Custom PDF" objects.
---@field Browser? Browser **Available On** "Tablet" Objects
---@field Clock? Clock **Available On** "Digital Clock" Objects
---@field Counter? Counter **Available On** "Counter" Objects
Object = {
    ---*[`Deprecated`]()Use [type](https://api.tabletopsimulator.com/object/#type)*
    ---
    ---**Read Only** This object's type. 
    ---@deprecated
    ---@type string
    tag = ...,
    ---*[`Deprecated`]()Use [object tags](https://api.tabletopsimulator.com/object/#tag-functions)*
    ---
    ---A [bit field](https://en.wikipedia.org/wiki/Bit_field). When objects with overlapping `value_flags` are selected and hovered over, their [values](https://api.tabletopsimulator.com/object/#value) will be summed together.
    ---@deprecated
    ---@type int
    value_flags = ...,
}



return Object