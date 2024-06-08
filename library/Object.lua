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
---@field UI UI # The XML UI class for the object.
---@field TextTool? TextTool # **Available on** "3DText" Objects.
local Object = {
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

---Adds force to an object in a directional Vector.
---@param force_vector Vector A Vector of the direction and magnitude of force.
---@param force_type force_type An Int representing the force type to apply. Options below.<ul><ul><li>Optional, defaults to 3.</li></ul></ul>
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#addforce)
---
function Object.addForce(force_vector, force_type) end

---Adds a torque vector to the Object.
---@param vector Vector
---@param force_type force_type An Int representing the force type to apply. Options below.<ul><ul><li>Optional, defaults to 3.</li></ul></ul>
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#addtorque)
---
function Object.addTorque(vector, force_type) end

---Returns Returns a Vector of the current angular velocity.
---@return Vector
function Object.getAngularVelocity() end

---@alias getBoundsReturn {center: Vector, size: Vector, offset: Vector}
---Returns a Table of Vector information describing the size of an object in Global terms.
---[Bounds](https://docs.unity3d.com/2019.1/Documentation/ScriptReference/Bounds.html) are part of Unity, and represent
---an imaginary square box that can be drawn around an object. Unlike scale, it can help indicate the size of an object
---in in-game units, not just relative model size.
---@return getBoundsReturn # The world space axis aligned Bounds of the Object.<ul>
---<ul><code>center</code> — The Vector of the center of the bounding box.<br>
---<code>size</code> — The Vector of the size of the bounding box.<br>
---<code>offset</code> — The Vector of the offset of the center of the bounding box from the middle of the Object model.
---</ul></ul>
---
---***
---#### Example Returned Table
---```
---{
---    center = {x=0, y=3, z=0, 0, 3, 0},
---    size = {x=5, y=5, z=5}, 5, 5, 5},
---    offset = {x=0, y=-1, z=0, 0, -1, 0}
---}
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getbounds)
---
function Object.getBounds() end

---Returns a Table of Vector information describing the size of the merged colliders on an object in Global terms, as
---if it was rotated to {0,0,0}. [Bounds](https://docs.unity3d.com/2019.1/Documentation/ScriptReference/Bounds.html)
---are part of Unity, and represent an imaginary square box that can be drawn around an object. Unlike scale, it can
---help indicate the size of an object in in-game units, not just relative model size.
---
---@return getBoundsReturn # The world space axis aligned Bounds of the Object's colliders at zero rotation.<ul>
---<ul><code>center</code> — The Vector of the center of the bounding box.<br>
---<code>size</code> — The Vector of the size of the bounding box.<br>
---<code>offset</code> — The Vector of the offset of the center of the bounding box from the middle of the Object model.
---</ul></ul>
---
---***
---#### Example Returned Table
---```
---{
---    center = {x=0, y=3, z=0, 0, 3, 0},
---    size = {x=5, y=5, z=5}, 5, 5, 5},
---    offset = {x=0, y=-1, z=0, 0, -1, 0}
---}
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getboundsnormalized)
---
function Object.getBoundsNormalized() end

---Returns a Vector of the current scale. Scale is not an absolute measurement, it is a multiple of the Object's
---default model size. So {x=2, y=2, z=2} would be a model twice its default size, not 2 units large.
---@return Vector
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getscale)
---
function Object.getScale() end

---Gets the forward direction of this Object.
---@return Vector # A Vector of the forward direction of this Object, relative to how the object is facing.
---### Example Usage
---```
----- Example of moving forward 5 units
---function onLoad()
---    distance = 5
---    pos_target = self.getTransformForward()
---    pos_current = self.getPosition()
---    pos = {
---        x = pos_current.x + pos_target.x * distance,
---        y = pos_current.y + pos_target.y * distance,
---        z = pos_current.z + pos_target.z * distance,
---    }
---    self.setPositionSmooth(pos)
---end
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#gettransformforward)
---
function Object.getTransformForward() end

---Gets the right direction of this Object.
---@return Vector # A vector of the right direction of this Object, relative to how the object is facing.
---### Example Usage
---```
----- Example of moving right 5 units
---function onLoad()
---    distance = 5
---    pos_target = self.getTransformRight()
---    pos_current = self.getPosition()
---    pos = {
---        x = pos_current.x + pos_target.x * distance,
---        y = pos_current.y + pos_target.y * distance,
---        z = pos_current.z + pos_target.z * distance,
---    }
---    self.setPositionSmooth(pos)
---end
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#gettransformright)
---
function Object.getTransformRight() end

---Gets the up direction of this Object.
---@return Vector # A Vector of the up direction of this Object, relative to how the object is facing.
---### Example Usage
---```
----- Example of moving up 5 units
---function onLoad()
---    distance = 5
---    pos_target = self.getTransformUp()
---    pos_current = self.getPosition()
---    pos = {
---        x = pos_current.x + pos_target.x * distance,
---        y = pos_current.y + pos_target.y * distance,
---        z = pos_current.z + pos_target.z * distance,
---    }
---    self.setPositionSmooth(pos)
---end
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#gettransformup)
---
function Object.getTransformUp() end

---Returns a Table of Vector information describing the size of the merged renderers on an object in Global terms, as
---if it was rotated to {0,0,0}. [Bounds](https://docs.unity3d.com/2019.1/Documentation/ScriptReference/Bounds.html)
---are part of Unity, and represent an imaginary square box that can be drawn around an object. Unlike scale, it can
---help indicate the size of an object in in-game units, not just relative model size.
---
---@return getBoundsReturn # The world space axis aligned Bounds of the Object's colliders at zero rotation.<ul>
---<ul><code>center</code> — The Vector of the center of the bounding box.<br>
---<code>size</code> — The Vector of the size of the bounding box.<br>
---<code>offset</code> — The Vector of the offset of the center of the bounding box from the middle of the Object model.
---</ul></ul>
---
---***
---#### Example Returned Table
---```
---{
---    center = {x=0, y=3, z=0, 0, 3, 0},
---    size = {x=5, y=5, z=5}, 5, 5, 5},
---    offset = {x=0, y=-1, z=0, 0, -1, 0}
---}
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getvisualboundsnormalized)
---
function Object.getVisualBoundsNormalized() end

---Indicates if an object is traveling as part of a Smooth move. Smooth moving is performed by `setPositionSmooth` and
---`setRotationSmooth`.
---
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#issmoothmoving)
---
function Object.isSmoothMoving() end

---Returns a Vector after converting a world vector to a local Vector. A world Vector is a positional Vector using the
---world's coordinate system. A Local Vector is a positional Vector that is relative to the position of the given
---object.
---
---@param vector VectorLike The world position to convert into a local position.
---@return Vector
---
---***
---
---> #### 🔥 Object Scale
---> This function takes the Object's scale into account, as the Object is the key relative point.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#positiontolocal)
---
function Object.positionToLocal(vector) end

---Returns a Vector after converting a locale vector to a world Vector. A world Vector is a positional Vector using the
---world's coordinate system. A Local Vector is a positional Vector that is relative to the position of the given
---object.
---
---@param vector VectorLike The local position to convert into a world position.
---@return Vector
---
---***
---
---> #### 🔥 Object Scale
---> This function takes the Object's scale into account, as the Object is the key relative point.
---
---***
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#positiontoworld)
---
function Object.positionToWorld(vector) end

---Rotates Object smoothly in the direction of the given Vector. This does not set the Object to face a specific
---rotation, it rotates the Object around by the number of degrees given for x/y/z.
---@param rotation VectorLike The amount of x/y/z to rotate by.
---@return bool
---
---***
---
---### Example Usage
---```
-----Rotates object 90 degrees around its Y axis
---self.rotate({x=0, y=90, z=0})
---```
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/object/#rotate)
---
---***
---
---@see Object.setRotation
---
function Object.rotate(rotation) end

---
---Scales this Object by the given amount.
---
---@param scale VectorLike Multiplier for scale.
---@return bool
---
---***
---
---### Example Usage
---```
-----Sacle an object by twice its current scale in x, y, and z
---self.scale({x=2, y=2, z=2})
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#scale)
---
---***
---
---@see Object.setScale
---
function Object.scale(scale) end

---Sets a Vector as the current angular velocity
---
---@param vector VectorLike The new angular velocity.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setangularvelocity)
---
function Object.setAngularVelocity(vector) end

---
---Instantly moves an Object to the given Vector. The Vector is interpreted as
---[World Position](https://api.tabletopsimulator.com/types/#position).
---
---@param vector VectorLike The position to move the Object to.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setposition)
---
function Object.setPosition(vector) end

---
---Smoothly moves this Object from its current position to a given world space position.
---@param position VectorLike A [positional](https://api.tabletopsimulator.com/types/#position) world space vector.
---@param collide? bool If the object will collide with other objects while moving.
---@param fast? bool If the object is moved quickly.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setpositionsmooth)
---
function Object.setPositionSmooth(position, collide, fast) end

---Instantly rotates this Object to the given Vector.
---
---@param vector VectorLike The new rotation.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setrotation)
---
function Object.setRotation(vector) end

---Smoothly rotates this Object to the given orientation in degrees.
---@param rotation VectorLike A [rotational](https://api.tabletopsimulator.com/types/#rotation) vector.
---@param collide bool
---@param fast bool
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setrotationsmooth)
---
function Object.setRotationSmooth(rotation, collide, fast) end

---Sets a Vector as the current scale.
---
---@param scale VectorLike The new scale.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setscale)
---
function Object.setScale(scale) end

---Set this Object's velocity to the given Vector.
---
---@param vector VectorLike The new velocity.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setvelocity)
---
function Object.setVelocity(vector) end

---Smoothly moves this Object by the given Vector offset.
---
---@param vector VectorLike The Vector to move the Object by.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#translate)
---
function Object.translate(vector) end

---# Tag Functions
---These functions deal with the [tags](https://kb.tabletopsimulator.com/game-tools/object-tags/) associated with the
---object. An individual tag is a `string` and is case-insensitive.
---
---If you want to create your own system in which object tags govern the interactions, the canonical logic is that if
---the system has no tags it interacts with everything, but if it has any tags then it only interacts with objects which
---share one of them. i.e. (assuming the system is represented by an in-game object):
---```
---allow_interaction = not system.hasAnyTag() or system.hasMatchingTag(object)
---```
---

---Adds a tag to this Object.
---@param tag string The tag to add to this object (case-insensitive).
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#addtag)
---
function Object.addTag(tag) end

---Returns the tags attached to this Object.
---@return string[] # The tags attached to this Object.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#gettags)
---
function Object.getTags() end

---Return whether this Object has any tags
---@return bool # True if this object has any tags.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#hastags)
---
function Object.hasTags() end

---Return whether this Object and the specified `Other` object share at least one tag in common.
---@param other Object The other object to compare tags with.
---@return bool # True if this object and the `Other` object share at least one tag in common.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#hasmatchingtag)
---
function Object.hasMatchingTag(other) end

---Remove a tag from this Object.
---@param tag string The tag to remove from this object (case-insensitive).
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#removetag)
---
function Object.removeTag(tag) end

---Replaces all tags on this Object with those contained in the specified table.
---
---@param tags string[] A table of tags to replace the current tags with.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#settags)
---
function Object.setTags(tags) end

---# UI Function Details
---There are two UI systems for Tabletop Simulator. The first is the Classic UI system that integrates nicely and has
---first class support, such as tooltips that follow the player's mouse and buttons that don't lock the scroll wheel.
---The second system, dubbed "Custom UI" utilizes an XML UI Framework based roughly off of
---[XMLLayout](https://www.digital-legacy.co.za/XmlLayout/Documentation/).
---The Custom UI system allows for far greater control over the UI elements, but has some limitations and is not as
---integrated with the game as the Classic UI system.
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#ui-functions)

---Removes all scripted buttons on the object.  *🔥 This does not clear buttons created using the Custom UI*
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#clearbuttons)
---
function Object.clearButtons() end

---Removes all scripted inputs on the object.  *🔥 This does not clear inputs created using the Custom UI*
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#clearinputs)
---
function Object.clearInputs() end

---Creates a button on the object.
---
---@param parameters Button.Parameters.Create A Table of parameters used to determine how the function will act.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#createbutton)
---
function Object.createButton(parameters) end

---Removes all scripted buttons.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#clearbuttons)
---
function Object.clearButtons() end

---Removes all scripted inputs.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#clearinputs)
---
function Object.clearInputs() end

---Creates a scripted button attached to the Object. Scripted buttons are buttons that can be clicked while in-game that trigger a function in a script.
---Buttons can not be clicked from their back side.
---
---@return bool
---@param parameters Button.Parameters.Create A Table containing the information used to spawn the button.
---
---***
---
---> #### input_function(obj: `Object`, player_clicker_color: `string` , input_value: `string`, selected: `bool`)
---> *The click function which is activated by editing the text in this input has its own parameters it is passed automatically.*
---> + *@param* `obj` — The Object the button is attached to.<br>
---> + *@param* `player_clicker_color` — [Player Color](https://api.tabletopsimulator.com/player/colors/) of the player that pressed the button.<br>
---> + *@param* `alt_click` — True if a button other than left-click was used to click the button.
---
---### Example Usage
--->```
---> function onLoad()
---> params = {
--->     click_function = "click_func",
--->     function_owner = self,
--->     label          = "Test",
--->     position       = {0, 1, 0},
--->     rotation       = {0, 180, 0},
--->     width          = 800,
--->     height         = 400,
--->     font_size      = 340,
--->     color          = {0.5, 0.5, 0.5},
--->     font_color     = {1, 1, 1},
--->     tooltip        = "This text appears on mouseover.",
---> }
--->
---> self.createButton(params)
---> end
--->
---> function click_func(obj, color, alt_click)
---> print(obj)
---> print(color)
---> print(alt_click)
---> end
---> ```
---
--->### 🐛 Bug
---> Button scale currently distorts button height and width if the button is rotated at anything besides {0, 0, 0}.
---<br><br>
--->### 🔥 Button Tips
---><ul>
--->    <ul>
--->        <li>Buttons can not be clicked from their back side.</li>
--->        <li>Buttons can not be clicked if there is another object between the pointer and the button. This does not include the Object the button is attached to.</li>
--->        <li>Buttons are placed relative to the Object they are attached to.</li>
--->        <li>The maximum font size is capped at 1000.</li>
--->        <li>The minimum width/height is 60. Any lower number (besides 0) will appear to be 60. This prevents visual glitches involving the corner rounding.</li>
--->        <li>A button width/height of 0 will cause the button not to be drawn, but its label will be. This can be a way to attach text to an Object.</li>
--->        <li>You cannot assign an index to a button. It is given one automatically.</li>
--->    </ul>
---></ul>
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#createinput)
function Object.createButton(parameters) end

---Creates a scripted button attached to the Object. Scripted buttons are buttons that can be clicked while in-game that trigger a function in a script.
---Buttons can not be clicked from their back side.
---
---@return bool
---@param parameters Input.Parameters.Create A Table containing the information used to spawn the input.
---
---***
---
---> #### input_function(obj: `Object`, player_clicker_color: `string` , input_value: `string`, selected: `bool`)
---> *The click function which is activated by editing the text in this input has its own parameters it is passed automatically.*
---> + *@param* `obj` — The Object the button is attached to.<br>
---> + *@param* `player_clicker_color` — [Player Color](https://api.tabletopsimulator.com/player/colors/) of the player that has selected/edited the input.<br>
---> + *@param* `input_value` — Text currently in the input.<br>
---> + *@param* `selected` — If the value box is still being edited or not.
---
---### Example Usage
---```
---function onLoad()
---    self.createInput({
---        input_function = "input_func",
---        function_owner = self,
---        label          = "Gold",
---        alignment      = 4,
---        position       = {x=0, y=1, z=0},
---        width          = 800,
---        height         = 300,
---        font_size      = 323,
---        validation     = 2,
---    })
---end
---
---function input_func(obj, color, input, stillEditing)
---    print(input)
---    if not stillEditing then
---        print("Finished editing.")
---    end
---end
---```
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#createinput)
---
---***
---@see createInputParameters
function Object.createInput(parameters) end

---
---Modify an existing button. The only parameter that is required is the index. The rest are optional, and not using
---them will cause the edited button's element to remain. Indexes start at 0. The first button on any given Object has
---an index of 0, the next button on it has an index of 1, etc. Each Object has its own indexes.
---
---@param parameters Button.Parameters.Edit A Table containing the information used to edit the button.
---@return bool
---
---#### Example Usage
---```
---self.editButton({index=0, label="New Label"})
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#editbutton)
---
---***
---
---@see Object.getButtons
---@see Object.createButton
---@see Button.Parameters.Edit
function Object.editButton(parameters) end

---
---Modify an existing input. The only parameter that is required is the index. The rest are optional, and not using
---them will cause the edited input's element to remain. Indexes start at 0. The first input on any given Object has
---an index of 0, the next input on it has an index of 1, etc. Each Object has its own indexes.
---
---@param parameters Input.Parameters.Edit A Table containing the information used to edit the input.
---@return bool
---
---#### Example Usage
---```
---self.editInput({index=0, label="New Label"})
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#editinput)
---
---***
---
---@see Object.getInputs
---@see Object.createInput
---@see Input.Parameters.Edit
function Object.editInput(parameters) end

---Returns a Table of all buttons on this Object. The Table contains parameters tables with the same keys as seen in
---the [createButton](https://api.tabletopsimulator.com/object/#createbutton) section, except each Table of parameters
---also contains an **index** entry. This is used to identify each button, used by
---[editButton](https://api.tabletopsimulator.com/object/#editbutton) and
---[removeButton](https://api.tabletopsimulator.com/object/#removebutton).
---
---Indexes start at 0.
---@return Button.Properties[]
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getbuttons)
---
---***
---
---@see Button
function Object.getButtons() end

---Returns a Table of all inputs on this Object. The Table contains parameters tables with the same keys as seen in
---the [createInput](https://api.tabletopsimulator.com/object/#createinput) section, except each Table of parameters
---also contains an **index** entry. This is used to identify each input, used by
---[editInput](https://api.tabletopsimulator.com/object/#editinput) and
---[removeInput](https://api.tabletopsimulator.com/object/#removeinput).
---
---Indexes start at 0.
---@return Input.Properties[]
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getinputs)
---
---***
---
---@see Input.Properties
function Object.getInputs() end

---Removes a specific button. Indexes start at 0. The first button on any given Object has an index of 0, the next
---button on it has an index of 1, etc. Each Object has its own indexes.
---
---Removing an index instantly causes all other higher indexes to shift down 1.
---@param index int Button index to remove.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#removebutton)
---
function Object.removeButton(index) end

---Removes a specific input. Indexes start at 0. The first input on any given Object has an index of 0, the next
---input on it has an index of 1, etc. Each Object has its own indexes.
---
---Removing an index instantly causes all other higher indexes to shift down 1.
---@param index int Input index to remove.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#removeinput)
---
function Object.removeInput(index) end

---## Custom UI
---Custom UI gives you a wide variety of element types, not just buttons and inputs, to place onto an Object. It is an
---extension of the UI class, and details on its use can be found on the
---[UI page](https://api.tabletopsimulator.com/ui/).

---# Get Function Details
---These functions obtain information from an object.

---Returns a table in the same format as `getObjects()` does for containers, but for the attachments of this object.
---@return ObjectInContainerData[]
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getattachments)
---
---***
---
---@see Object.getObjects
---@see ObjectInContainerData
---
function Object.getAttachments() end

---Returns the color tint for this Object.
---@return Color
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getcolortint)
---
function Object.getColorTint() end

---Returns a Table with the Custom Object information of a Custom Object. See the
---[Custom Game Objects](https://api.tabletopsimulator.com/custom-game-objects/) page for the kind of information returned.
---@return CustomObject.PropertiesKind
---
---***
---
---### Example Usage
---```
-- Example returned Table for a custom token
---{
---    image = "SOME URL HERE",
---    thickness = 0.2,
---    merge_distance = 15,
---    stackable = false,
---}
---```
---
---> #### 🔥 Jigsaw Puzzles
---> If you use getCustomObject() on a puzzle piece, it will also return ``desired_position``, which is its position if
---the puzzle is "solved". You can use this to determine where to put the piece.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getcustomobject)
---
function Object.getCustomObject() end

---Returns a table data structure representation of the object. Works with
---[spawnObjectData(...)](https://api.tabletopsimulator.com/base/#spawnobjectdata).
---
---@return table
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getdata)
---
function Object.getData() end

---Get the description of this Object that shows on its tooltip.
---@return string # The description on this Object.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getdescription)
---
function Object.getDescription() end

---Returns the fog-of-war reveal settings for this Object
---
---@return {reveal: bool, color: string, range: float}
---
---> #### ✏️ Color Selection
---> "Black" and "All" are synonymous for Fog of War. Either means that all players can see the revealed area when ``reveal = true``.
---
---***
---
---### Example Returned Table
---```
----- Example returned Table for a custom token
---{
---    reveal = false,
---    color = 'All',
---    range = 5
---}
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getfogofwarreveal)
---
function Object.getFogOfWarReveal() end

---Get the Game Master Notes only visible for [Player Color](https://api.tabletopsimulator.com/player/colors/) Black.
---
---@return string
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getgmnotes)
---
function Object.getGMNotes() end

---Get the unique GUID for this Object.
---
---@return string # The object's 6 digit GUID.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getguid)
---
function Object.getGUID() end

---Returns information on any joints attached from this Object.
---@return JointType.PropertiesKind[]
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getjoints)
---
---***
---
function Object.getJoints() end

---
---Returns a serialization of the JSON string which represents this item. Works with [spawnObjectJSON](https://api.tabletopsimulator.com/base/#spawnobjectjson).
---
---@param indented? bool If the JSON string should be indented or not. *Optional, defaults to true*
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getjson)
---
---***
---
---@see spawnObjectJSON
function Object.getJSON(indented) end

---Get the lock status of this object.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getlock)
---
function Object.getLock() end

---
---Returns the object's nickname that shows as part of the Object's tooltip.
---@return string
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getname)
---
function Object.getName() end

---
---Returns data describing the objects contained within the zone/bag/deck
---
---### Containers (Bags/Decks)
---Containers return a (numerically indexed) table consiting of sub-tables of `ObjectInContainer` data.
---@return ObjectInContainerData[]
---
---***
---
---### Example Usage
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
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getobjects-containers)
---
---***
---
---@see ObjectInContainerData
function Object.getObjects() end

---
---### Zones
---Zones return a (numerically indexed) table of game Objects occupying the zone
---
---@param ignore_tags bool If `true` then all objects in the zone will be returned, regardless of tags.
---@return Object[]
---
---***
---
---### Example Usage
---[Highlight](https://api.tabletopsimulator.com/object/#highlighton) red all cards occupying a zone (`object),
---regardless of tags.
---```
----- Iterate through object occupying the zone
---for _, occupyingObject in ipairs(object.getObjects(true)) do
---    if occupyingObject.type == "Card" then
---        occupyingObject.highlightOn('Red')
---    end
---end
---```
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getobjects-zones)
---
function Object.getObjects(ignore_tags) end

---Returns the number of objects contained within if this Object is a bag, deck, or stack. Otherwise, returns 1.
---
---@return int
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getquantity)
function Object.getQuantity() end

---Returns the current rotationValue. Rotation values are used to give value to different rotations (like dice) and are set
---using scripting or the Gizmo tool. The value returned is for the rotation that is closest to being pointed "up".
---
---The returned value will either be a number or a string, depending on the value that was given to that rotation.
---@return number|string
---
---***
---
---### Example Usage
---```
---local value = self.getRotationValue()
---print(value)
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getrotationvalue)
function Object.getRotationValue() end

---The data returned by `getRotationValues` contains sub-Tables, each containing these 2 key/value pairs.
---@class RotationValuesData
---What value is associated with a given rotation. *Starting a value with a # will cause it not to show in the Object's tooltip.
---@field value number|string
---@field rotation Vector Rotation of the Object that best represents the given value pointing up.

---Returns a Table of rotation values. Rotation values are used to give value to different rotations (like dice) based on
---which side is pointed "up". It works by checking all of the rotation values assigned to an object and determining which
---one of them is closest to pointing up, and then displaying the value associated with that rotation.
---
---You can manually assign rotation values to objects using the Rotation Value Gizmo tool (in the left side Gizmo menu)
---or using [setRotationValues(...)](https://api.tabletopsimulator.com/object/#setrotationvalues).
---
---@return RotationValuesData[]
---
---#### Example Returned Table
---```
----- Example returned Table for a coin
---{
---    {value="Heads", rotation={x=0, y=0, z=0}},
---    {value="Tails", rotation={x=180, y=0, z=0}},
---}
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getrotationvalues)
---
function Object.getRotationValues() end

---Returns a table of the player colors currently selecting this Object.
---
---@return string[] # A table of the player colors currently selecting this Object.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getselectedcolors)
---
function Object.getSelectedColors() end

---Current [state](https://kb.tabletopsimulator.com/host-guides/creating-states/) ID (index) an object is in.
---Returns -1 if there are no other states. State ids (indexes) start at 1.
---@return int
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getstateid)
---
function Object.getStateId() end

---Returns a Table of information on the [states](https://kb.tabletopsimulator.com/host-guides/creating-states/) of an
---Object. Stated Objects have ids (indexes) starting with 1.
---
---> #### **🔥 The returned table will NOT include data on the current state.**
---@return ObjectState.Properties[]
---
---#### Example Returned Table
---```
---{
---    {
---        name             = "First State",
---        description      = "",
---        guid             = "AAA111",
---        id               = 1,
---        lua_script       = "",
---        lua_script_state = "",
---    },
---    {
---        name             = "Second State",
---        description      = "",
---        guid             = "BBB222",
---        id               = 2,
---        lua_script       = "",
---        lua_script_state = "",
---    },
---}
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getstates)
---
function Object.getStates() end

---Returns the Object's value. This represents something different depending on the Object's type.
---
---@return any
---
---#### **🔥 Important**
---If the Object has [rotation values](https://api.tabletopsimulator.com/object/#getrotationvalues), then this method
---method will return the rotation value (i.e. behave the same as
---[getRotationValue](https://api.tabletopsimulator.com/object/#getrotationvalue)).
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getvalue)
---
---***
---@see Object.setValue
function Object.getValue() end

---Returns all the Zones which the object is currently inside.
---@return Object[]
---
--->#### Example Usage
--->Print a comma separated list of GUIDs belonging to zones an object is currently occupying.
--->```
---local guids = {}
---
---for _, zone in ipairs(object.getZones()) do
---    table.insert(guids, zone.guid)
---end
---
---if #guids > 0 then
---    print("Object is contained within " .. table.concat(guids, ", "))
---else
---    print("Object is not contained within any zones")
---end
--->```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getzones)
---
function Object.getZones() end

---Returns true if the Object is (or will be) destroyed.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#isdestroyed)
---
function Object.isDestroyed() end

---# Set Function Details
---These functions apply action to an object. They take some property in order to work.

---Sets the color tint.
---
---@param color ColorLike
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setcolortint)
---
function Object.setColorTint(color) end

---Sets a custom Object's properties.

---Used to create a Custom Object.
---
---@param parameters CustomObject.ParamsKind
---@return bool
---***
---
---### Example Usage
---```
----- Example of a custom token
---params = {
---    image = "SOME URL HERE",
---    thickness = 0.2,
---    merge_distance = 15,
---    stackable = false,
---}
---obj.setCustomObject(params)
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setcustomobject)
---
function Object.setCustomObject(parameters) end

---Sets a description for an Object. Shows in tooltip after delay.
---
---@param description string
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setdescription)
---
function Object.setDescription(description) end

---Establish the settings and enable/disable an Object's revealing of
---[Fog of War](https://kb.tabletopsimulator.com/game-tools/zone-tools/#fog-of-war-zone).
---
---@param fog_settings FogOfWarRevealParameters A table containing the information on if/how this Object should reveal Fog of War.<ul><ul><li>🔥 All keys are optional; ommitting one will keep its current setting.</li></ul></ul>
---@return bool
---
---### Example Usage
---```
----- Example of enabling reveal for all players at 3 units of radius.
---params = {
---    reveal = true,
---    color  = "Black",
---    range  = 3,
---}
---self.setFogOfWarReveal(params)
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setfogofwarreveal)
---
function Object.setFogOfWarReveal(fog_settings) end

---Sets Game Master Notes only visible for [Player Color](https://api.tabletopsimulator.com/player/colors/) Black.
---
---@param notes string
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setgmnotes)
---
function Object.setGMNotes(notes) end

---Set whether this objcet is locked in place.
---
---@param lock bool
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setlock)
---
function Object.setLock(lock) end

---Sets this Object's name. This is the name that shows as part of the Object's tooltip.
---
---@param name string
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setname)
---
function Object.setName(name) end

---Sets the Object's rotation value (i.e. physically rotate the object)
---
---@param rotation_value int|string|float
---
---***
---
--->### Example
---> Rotate a die to show the value 6.
---```
---die.setRotationValue(6)
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setrotationvalue)
---
function Object.setRotationValue(rotation_value) end

---@class setRotationValuesParameters
---Value associated with the rotation.<ul><ul><li>If <code>value</code> is a string starting with "#", then it will not
---be displayed in the Object's tooltip.
---@field value int|string|float
---@field rotation Vector Rotation of the Object that corresponds with the provided `value`.

---Sets rotation values of an object. Rotation values are used to give value to different rotations (like dice). It works by
---checking all of the rotation values assigned to an object and determining which one of them is closest to pointing up, and
---then displaying the value associated with that rotation.
---@param rotation_values setRotationValuesParameters[] A table containing Sub-Tables (see `setRotationValuesParameters`). 1 sub-Table per "face".
---@return bool
---
---***
---
--->#### Example
--->Set the two different sides (rotations) of a coin to have the values "Heads" and "Tails".
--->```
---self.setRotationValues({
---    {
---        value="Heads",
---        rotation={x=0, y=0, z=0}
---    },
---    {
---        value="Tails",
---        rotation={x=180, y=0, z=0}
---    },
---})
--->```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setrotationvalues)
---
function Object.setRotationValues(rotation_values) end

---Sets [state](https://kb.tabletopsimulator.com/host-guides/creating-states/) of an object. State ids (indexes) start
---at 1.
---@param state_id int
---@return Object
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setstate)
---
function Object.setState(state_id) end

---Sets the Object's value. This represents something different depending on the Object's type (see the table below)
---@param value int|string The value to set. Represents something different depending on the Object's [type](https://api.tabletopsimulator.com/object/#type).
--
---@return bool
---
---***
---
--| Object Type                | Value Type | Description                                                                                                        |
--|----------------------------|------------|--------------------------------------------------------------------------------------------------------------------|
--| `3D Text`                    |  `string`  | Replaces the 3D Text's content.                                                                                  |
--| `Clock`                      |   `int`    | Sets the remaining "Stopwatch" time on the Clock.                                                                |
--| `Counter (Digital Counter)`  |   `int`    | Sets the counter's value.                                                                                        |
--| `Fog (Hidden Zone)`          |  `string`  | Changes the hidden zone owner to the specified [Player Color](https://api.tabletopsimulator.com/player/colors/). |
--| `Hand (Hand Zone)`           |  `string`  | Changes the hand owner to the specified [Player Color](https://api.tabletopsimulator.com/player/colors/).        |
--| `Tablet`                     |  `string`  | Loads the specified URL in the tablet's browser.                                                                 |
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setvalue)
---
function Object.setValue(value) end

---# Action Functions
---These functions perform general actions on objects.
---[Open Documentation](https://api.tabletopsimulator.com/object/#action-function)

---The Object supplied as param is destroyed and becomes a dummy Object child.
---
---#### **⚠️ Any references to the destroyed object will become invalid after calling this.**
---@param object Object
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#addattachment)
---
function Object.addAttachment(object) end

---Adds a menu item to the object's right-click context menu.
---@param label string Label for the menu item.
---
---
---
---
---@param callback fun(player_color: string, object_position: Vector, object: string) Execute if menu item is selected. Called as callback(`player_color`, `object_position`, `object`)<br>&emsp;&emsp;`player_color` — [Player Color](https://api.tabletopsimulator.com/player/colors/) who selected the menu item.<br>&emsp;&emsp;`object_position` — Position of the object.<br>&emsp;&emsp;`object` — Object in question.
---@param keep_open? bool Keep context menu open after menu item was selected.<br>&emsp;&emsp;*Optional, Default: keep_open = false. Close context menu after selection.*
---@return bool
---
---***
---
---### Example Usage
---```
---function onLoad()
---    self.addContextMenuItem("doStuff", itemAction)
---end
---
---function itemAction(player_color, position, object)
---    log({player_color, position, object})
---end
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#addcontextmenuitem)
---
function Object.addContextMenuItem(label, callback, keep_open) end

---Adds this object to the specified player's selection
---@param player_color string
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#addtoplayerselection)
---
function Object.addToPlayerSelection(player_color) end

---Clears all menu items added by function
---[addContextMenuItem(...)](https://api.tabletopsimulator.com/object/#addcontextmenuitem).
---
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#clearcontextmenu)
---
function Object.clearContextMenu() end

---@class (exact) CloneParameters
---@field position? Vector Where the Object is placed.<br>&emsp;&emsp;*Optional, defaults to {x-0, y=3, z=0}*
---@field snap_to_grid? bool If the Object should snap to the grid.<br>&emsp;&emsp;*Optional, defaults to false*

---Copy/Paste this Object, returning a reference to the new Object.
---@param parameters? CloneParameters A Table with information used when pasting.
---@return Object
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#clone)
---
function Object.clone(parameters) end

---Cuts (splits) a deck down to a given card. In other words, it counts down from the top of the deck and makes a new
---deck of that size and puts the remaining cards in the other pile.
---
---After the cut, the resulting decks much each have at least 2 cards. This means the parameter used must be between
--- **2** and **totalNumberOfCards - 2**.
---@param count int How many cards down to cut the deck.<br>&emsp;&emsp;*Optional, if no value is provided, the deck will is cut in half.*
---@return {[1]: Object, [2]: Object} # The table that is returned.<br>&emsp;&emsp;`1` — The lower deck, containing the remaining cards in the deck.<br>&emsp;&emsp;`2` — The upper deck, containing *count* number of cards.</li></ul></ul>
---
---***
---> ### 🔥 Important
---> New decks take a frame to be created. This means trying to act on them immediately will not work. Use a coroutine or timer to add a delay.
---
---***
---
---### Example Usage
---```
---newDecks = deck.cut(5)
-----A delay would be required here for these next two lines to work.
-----The decks haven't been fully created yet.
---newDecks[1].deal(1)
---newDecks[2].deal(1)
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#cut)
---
function Object.cut(count) end

---Deals Objects to hand zones. Will deal from decks/bags/stacks as well as individual items. If dealing an individual
---item to a hand zone, it is a good idea to make sure that its
---[Member Variable](https://api.tabletopsimulator.com/object/#member-variables) for `use_hands` is `true`.
---@param number int How many to deal
---@param player_color string The [Player Color](https://api.tabletopsimulator.com/player/colors/) to deal to.<br>&emsp;&emsp;*Optional, defaults to an empty string. If not supplied, it will attempt to deal to all seated players.*
---@param index int Index of hand zone to deal to.<br>&emsp;&emsp;*Optional, defaults to the first created hand zone.*
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#deal)
---
function Object.deal(number, player_color, index) end

---Deals a Card to a player with an offset from their hand.
---@param offset VectorLike The x/y/z offset to deal around the given hand zone.
---@param flip bool If the card is flipped over when dealt.
---@param player_color string Hand zone [Player Color](https://api.tabletopsimulator.com/player/colors/) to offset dealing to.
---@return Object
---
---***
--- ### Example Usage
---```
----- Example of dealing 2 cards in front of the White player, face up.
---self.dealToColorWithOffset({-2,0,5}, true, "White")
---self.dealToColorWithOffset({ 2,0,5}, true, "White")
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#dealtocolorwithoffset)
---
function Object.dealToColorWithOffset(offset, flip, player_color) end

---Destroys an attachment with the given index.
---@param index int
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#destroyattachment)
---
function Object.destroyAttachment(index) end

---Destroys all attachments.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#destroyattachments)
---
function Object.destroyAttachments() end

---Destroys this Object. Allows for ``self.destruct()``.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#destroy)
---
function Object.destruct() end

---Forces this Object, if held by a player, to be dropped.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#drop)
---
function Object.drop() end

---Flips this Object over.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#flip)
---
function Object.flip() end

---Removes a highlight from around an Object.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#highlightoff)
---
function Object.highlightOff() end

---Highlight this object with color for an optional duration.
---@param color ColorLike The color to highlight the object with.
---@param duration? float The number of seconds this object will remain highlighted.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#highlighton)
---
function Object.highlightOn(color, duration) end

---Joints objects together, in the same way the [Joint tools](https://kb.tabletopsimulator.com/game-tools/joint-tool/) does.
---
---**Using obj.jointTo(), with no object or parameter used as arguments, will remove all joints from that Object.**
---@param object Object The Object that the selected Object will be jointed to.
---@param parameters JointType.ParametersKind A Table of parameters to specify the joint's properties.
---@return bool
---
---### Example Uses
---```
-----Example of Fixed joint
---self.jointTo(obj, {
---    ["type"]        = "Fixed",
---    ["collision"]   = true,
---    ["break_force"]  = 1000.0,
---    ["break_torgue"] = 1000.0,
---})
---```
---
---```
-----Example of Spring joint
---self.jointTo(obj, {
---    ["type"]        = "Spring",
---    ["collision"]   = false,
---    ["break_force"]  = 1000.0,
---    ["break_torgue"] = 1000.0,
---    ["spring"]      = 50,
---    ["damper"]      = 0.1,
---    ["max_distance"] = 10,
---    ["min_distance"] = 1
---})
---```
---
---```
-----Example of Hinge joint
---self.jointTo(obj, {
---    ["type"]        = "Hinge",
---    ["collision"]   = true,
---    ["axis"]        = {1,1,1},
---    ["anchor"]      = {1,1,1},
---    ["break_force"]  = 1000.0,
---    ["break_torgue"] = 1000.0,
---    ["motor_force"]  = 100.0,
---    ["motor_velocity"] = 10.0,
---    ["motor_free_spin"] = true
---})
---```
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#jointto)
---
function Object.jointTo(object, parameters) end

---Places an object into a container (chip stacks/bags/decks). If neither Object is a container, but they are able to be
---combined (like with 2 cards), then they form a deck/stack.
---@param put_object Object
---@return Object # The container is returned as the Object reference. Either this is the container/deck/stack the other Object was placed into, or the deck/stack that was formed by the putObject action.
---
--->### Putting Cards into Decks
--->When you call this `putObject()` to put a card into a deck, the card goes into the end of the deck which is closest
--->to it in Y elevation. So, if both the card and the deck are resting on the table, the card will be put at the bottom
--->of the deck. if the card is hovering above the deck, it will be put at the top."
---
---### Example Usage
---```
----- Example of a script on a bag that places Object into itself
---local obj = getObjectFromGUID("AAA111")
---self.putObject(obj)
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#putobject)
---
function Object.putObject(put_object) end

---	Shuffles deck/bag, rolls dice/coin, lifts other objects into the air. Same as pressing the "R" key by default.
---@param color? string If provided, this function will trigger `onObjectRandomized()`, passing that player color.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#randomize)
---
function Object.randomize(color) end

---Registers this object for Global collision events, such as
---[onObjectCollisionEnter](https://api.tabletopsimulator.com/events/#onobjectcollisionenter). Always returns `true`.
---@param stay? bool Whether we should register for [https://api.tabletopsimulator.com/events/#onobjectcollisionstay]. Stay events may negatively impact performance; only set this to `true` if absolutely necessary. *Optional, defaults to false*
---@return true
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#registercollisions)
---
function Object.registerCollisions(stay) end

---Returns Object reference of itself after it respawns itself. This function causes the Object to be deleted and
---respawned instantly to refresh it, so its old Object reference will no longer be valid.
---
---Most often this is used after using [setCustomObject(...)](https://api.tabletopsimulator.com/object/#setcustomobject)
---to modify a custom object.
---@return table
function Object.reload() end

---Removes a child with the given index. Use
---[getAttachments()](https://api.tabletopsimulator.com/object/#getattachments) to find out the index property.
---@param index int The index of the attachment to remove. Indexes start at 1.
---@return Object # The reference to the object that was removed.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#removeattachment)
---
function Object.removeAttachment(index) end

---Detaches the children of this Object. Returns a table of object references.
---@return Object[]
function Object.removeAttachments() end

---Removes this object from the specified player's selection
---@param player_color string The color of the player to remove the object from.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#removefromplayerselection)
---
function Object.removeFromPlayerSelection(player_color) end

---Resets this Object. Resetting a Deck brings all the Cards back into it. Resetting a Bag clears its contents (works
---for both Loot and Infinite Bags).
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#reset)
---
function Object.reset() end

---Rolls dice/coins
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#roll)
---
function Object.roll() end

---Shuffles/shakes up contents of a deck or bag.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#shuffle)
---
function Object.shuffle() end

---Returns an Object reference to a new [state](https://kb.tabletopsimulator.com/host-guides/creating-states/) after
---randomly selecting and changing to one.
---@return Object The Object reference to the new state.
function Object.shuffleStates() end

---Splits a deck, as evenly as possible, into a number of piles.
---@param piles? int How many piles to split the deck into. *Optional, defaults to 2*<br>&emsp;&emsp;*Minimum Value: 2*<br>&emsp;&emsp;*Maximum Value: Mumber-Of-Cards-In-Deck / 2*
---@return Object[] # The number of Objects in the table is equal to the number of decks created by the split. They are ordered so any larger decks come first.
---
--->### 🔥 Important
---> New decks take a frame to be created. This means trying to act on them immediately will not work. Use a coroutine or timer to add a delay.
---
---***
---
---### Example Usage
---```
---newDecks = deck.split(4)
-----A delay would be required here for these next four lines to work.
-----The decks haven't been fully created yet.
---newDecks[1].deal(1)
---newDecks[2].deal(1)
---newDecks[3].deal(1)
---newDecks[4].deal(1)
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#split)
---
function Object.split(piles) end

---Spreads the cards of a deck out on the table.
---@param distance float How far apart the cards should be. *Optional, if no value is provided, they will be 0.6 inches apart.*<br>&emsp;&emsp;*Negative values will spread to the left instead of the right.*
---@return Object[] # The number of Objects in the table is equal to the number of cards in the deck. They are returned in the order they were in the deck.
---
--->### 🔥 Important
---> Cards take a frame to be created. This means trying to act on them immediately will not work. Use a coroutine or timer to add a delay.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#spread)
---
function Object.spread(distance) end

---@class (exact) TakeObjectParameters
---A Vector of the positoon to place the object. *Optional, defaults to container's position + 2 on the x axis.
---@field position? Vector
---A Vector of the rotation to place the object. *Optional, defaults to container's rotation.*
---@field rotation? Vector
---If the Object should be flipped over when taken.
---*Optional, defaults to false.*<br>&emsp;&emsp;If `rotation` is specified, this will be ignored.
---@field flip? bool
---If the object is taken from the top (vs bottom). *Optional, defaults to true*
---@field top? bool
---If the object moves smoothly or instantly to `position`. *Optional, defaults to true*
---@field smooth? bool
---Callback which will be called when the taken object has finished spawning.
---*Optional, no default*<br>&emsp;&emsp;*The callback function will be the spawned object as its only parameter.*
---@field callback_function? fun(object: Object)

---@class (exact) TakeObjectParametersGuid: TakeObjectParameters
---@field guid string GUID of the object to take. *Only use index or guid, never both*

---@class (exact) TakeObjectParametersIndex: TakeObjectParameters
---0-based index of the object to take (from the top or bottom of the deck depending).
---*Only use index or guid, never both*<br>&emsp;&emsp;*Optional, defaults to 0*
---@field index int

---Takes an Object from this container.
---
--->⚠️ Objects that are taken out of a container will take one or more frames to spawn. Certain interactions (e.g.
--->physics) will not be able to take place until the object has finished spawning.
---@param parameters? TakeObjectParameters|TakeObjectParametersIndex|TakeObjectParametersGuid A table of parameters used to determine how takeObject iwll act. If neither guid nor index is specified, the top (or bottom, if `bottom` is true) object will be taken.
---@return Object
---
--->### Caution
---Certain containers only exist whilst they have more than one object contained within them (e.g. decks). Once you
---remove the second last object from a container, the container will be destroyed and the remaining contained object
---will spawn in its place. After calling takeObject(...) you can check for a
---[remainder](https://api.tabletopsimulator.com/object/#remainder).
---
--->### Example
--->Take an object out of a container. As we take it out we'll instruct the object to smooth move (default positioning
--->behavior) to coordinates (0, 5, 0). Additionally, we're going to add a blue highlight on the object we've taken out.
--->```
---local takenObject = container.takeObject({
---    position = {x = 0, y = 5, z = 0},
---})
---takenObject.highlightOn('Blue')
--->```
---
--->### Advanced example
--->Take an object out of a container, and then apply an upward force (impulse) shooting it into the air. We can only
--->[apply an impulse](https://api.tabletopsimulator.com/object/#addforce) to an object once its (underlying rigid body)
--->has finished spawning. Additionally, freshly spawned objects are frozen in place for a single frame. So we need to
--->wait for the taken object to finish spawning (i.e. `callback function`) *then*
--->[wait one more frame](https://api.tabletopsimulator.com/wait/#frames) before applying the impulse.
--->```
---container.takeObject({
---    callback_function = function(spawnedObject)
---        Wait.frames(function()
---            -- We've just waited a frame, which has given the object time to unfreeze.
---            -- However, it's also given the object time to enter another container, if
---            -- it spawned on one. Thus, we must confirm the object is not destroyed.
---            if not spawnedObject.isDestroyed() then
---                spawnedObject.addForce({0, 30, 0})
---            end
---        end)
---    end,
---    smooth = false, -- Smooth moving objects cannot have forces applied to them.
---})
--->```
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#takeobject)
---
function Object.takeObject(parameters) end

---Unregisters this object for Global collision events.
---@return bool # `true` if the object was previously registered, `false` otherwise.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#unregistercollisions)
---
function Object.unregsiterCollisions() end

---# Component Functions
---Component APIs are an advanced feature. **An understanding of how Unity works is required** to utilize them. See the
---[Introduction to Components](https://api.tabletopsimulator.com/components/introduction/) for more information.
---[Open Documentation](https://api.tabletopsimulator.com/object/#component-functions)

---Returns a child GameObject matching the specified `name`.
---@param name string
---@return GameObject
function getChild(name) end

---Returns the list of children GameObjects.
---@return GameObject[]
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getchildren)
---
function getChildren() end

---Returns a component matching the specified `name` from this Object's list of components.
---@param name string
---@return Component
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getcomponent)
---
function getComponent(name) end

---Returns this Object's list of Components. `name` is optional, when specified only Components with specified `name`
---will be included.
---
---@param name? string
---@return Component[]
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getcomponents)
---
function getComponents(name) end

---Returns a list of Components found by searching the Object and its
---[children](https://api.tabletopsimulator.com/object/#getchildren) recursively (depth first). `name` is optional, when
---specified only Components with specified `name` will be included.
---
---@param name? string
---@return Component[]
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getcomponentsinchildren)
---
function getComponentsInChildren(name) end

---# Hide Functions
---These functions can hide Objects, similar to how hand zones or hidden zones do.
---[Open Documentation](https://api.tabletopsimulator.com/object/#hide-functions)

---Hide this object from the specified players as if it were in a hand zone.
---@param players string[] A table containing strings of the color name of each player to hide the Object from. Using an empty table will cause the Objec tto remove the hiding effect.
---@return bool
---
---***
---### Example Usage
---```
---function onLoad()
---    self.setHiddenFrom({"Blue", "White"})
---end
---```
---
---***
---
--->### 🔥 Tip
--->Just like Objects in a hand zone, the player(s) the object is hidden from can still interact/move the hidden Object.
--->It still exists to them, but is shown as a question mark or as a hidden card.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#sethiddenfrom)
---
function Object.setHiddenFrom(players) end

---Hide this Object from the specified players as if it were in a hidden zone.
---@param players string[] A table containing strings of the color name of each player to hide the Object from. Using an empty table will cause the Objec tto remove the hiding effect.
---@return bool
---
---### Example Usage
---```
---function onLoad()
---    self.setInvisibleTo({"Blue", "White"})
---end
---```
---
---***
---
--->### 🔥 Tip
--->Just like Objects in a hand zone, the player(s) the object is hidden from can still interact/move the hidden Object.
--->It still exists to them, just invisibly so.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#seinvisibleto)
---
function Object.setInvisibleTo(players) end

---Attaches an invisible hider to the object (or removes it if enabled is false).
---
---A more advanced version of `setHiddenFrom(...)`, this function is also used to hide objects as if they were in a hand zone.
---It allows you to identify multiple sources of "hiding" by an ID and toggle the effect on/off easily.
---
---This function is slightly more complicated to use for basic hiding, but allows for much easier hiding in complex situations.
---@param id string The unique name for this hiding effect.<ul><ul><li>Tip: You can use descriptive tag names like "fog" or "blindness"</li></ul></ul>
---@param hidden bool If the hiding effect is enabled or not.
---@param players? string[] A table containing stromgs of the color name of each player to hide the Object from.<ul><ul><li>Optional, an empty table (or no table) hides for everyone.</li></ul></ul>
---@return bool
---### Example Usage
---```
---function onLoad()
---    --Enable hide
---    self.attachHider("hide", true, {"Blue", "White"})
---    --Disable hide
---    --self.attachHider("hide", false, {"Blue", "White"})
---end
---```
---
---***
---
--->### 🔥 Tip
--->Just like Objects in a hand zone, the player(s) the object is hidden from can still interact/move the hidden Object.
--->It still exists to them, but is shown as a question mark or as a hidden card.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#attachhider)
---
function Object.attachHider(id, hidden, players) end

---Attaches an invisible hider to the object (or removes it if enabled is false).
---
---A more advanced version of `setInvisibleTo(...)`, this function is also used to hide objects as if they were in a hidden zone.
---It allows you to identify multiple sources of "hiding" by an ID and toggle the effect on/off easily.
---
---This function is slightly more complicated to use for basic hiding, but allows for much easier hiding in complex situations.
---@param id string The unique name for this hiding effect.
---@param hidden bool If the hiding effect is enabled or not.
---@param players? string[] A table containing stromgs of the color name of each player to hide the Object from. *Optional, an empty table (or no table) hides for everyone*
---@return bool
---### Example Usage
---```
---function onLoad()
---    --Enable hide
---    self.attachInvisibleHider("hide", true, {"Blue", "White"})
---    --Disable hide
---    --self.attachInvisibleHider("hide", false, {"Blue", "White"})
---end
---```
---
---***
---
--->### 🔥 Tip
--->Just like Objects in a hand zone, the player(s) the object is hidden from can still interact/move the hidden Object.
--->It still exists to them, just invisibly so.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#attachinvisiblehider)
---
function Object.attachInvisibleHider(id, hidden, players) end

---# Global Function
---The functinos that can be used on both Objects and also the game world using `Global`.

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
function Object.addDecal(parameters) end

---Calls a Lua function owned by this Object and passes an optional table as parameters to the function.
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
function Object.call(function_name, parameters) end

---Returns a table of sub-tables, each sub-table representing one Decal
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
---function Object.getDecals() end
---```
function Object.getDecals() end

---Get the Lua script on this object as a string.
---
---@return string
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getluascript)
---
function Object.getLuaScript() end

---Returns a table representing a list of snap points.
---@return SnapPoint.Properties[]
---***
---
---### Example Usage
---```
-----Log the list of global snap points
---log(Global.getSnapPoints)
function Object.getSnapPoints() end

---Get the reference to a table variable in this Object's script.
---
---@param table_name string The name of the table to get.
---@return table
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#gettable)
---
function Object.getTable(table_name) end

---Get the value of a variable in another Object's script. Cannot return a table.
---
---@param var_name string
---@return any
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getvar)
---
function Object.getVar(var_name) end

---Returns a table of data representing the current Vector Lines on this object.
---See [setVectorLines](https://api.tabletopsimulator.com/object/#setvectorlines) for table format.
---@return VectorLine.Properties[]
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#getvectorlines)
---
function Object.getVectorLines() end

---Sets which decals are on this Object. This removes other decals already present, and can remove all decals as well.
---@param decals Decal.Parameters[] A table of Decal Properties to set on the Object.
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
function Object.setDecals(decals) end

---Sets the Lua script on this object.
---
---@param script string
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setluascript)
---
function Object.setLuaScript(script) end

---Sets the snap points on this object.
---@param snap_points SnapPoint.Parameters[] A list (numerically indexed table) of [snap points](https://api.tabletopsimulator.com/object/#setsnappoints-snap-points).
---@return bool
---
---***
---
--->### 🔥 Tip
--->This function can also be called on `Global` in order to create snap points directly within the scene, which are not
--->attached to any other Object.
---
---***
---
---### Example Usage
---```
-----Give an object 3 snap points. A regular snap point, a rotation snap point, and a rotation snap point with a tag.
---object.setSnapPoints({
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
function Object.setSnapPoints(snap_points) end

---Creates/updates a table in this Object's script.
---
---@param table_name string The name of the table variable in the script.
---@param data table The data to set the table to.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#settable)
---
function Object.setTable(table_name, data) end

---Sets a variable in this Object's script.
---
---@param var_name string The name of the variable in the script.
---@param value any The value to set the variable to.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setvar)
---
function Object.setVar(var_name, value) end

---Sets the Vector Lines on this object
---
---@param lines VectorLine.Parameters[] A table of Vector Line Properties to set on this object.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/object/#setvectorlines)
---
function Object.setVectorLines(lines) end
