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

---The Object supplied as param is destroyed and becomes a dummy Object child.
---@param object Object
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#addattachment)
---
function Object.addAttachment(object) end

---Add a context menu item onto the object.
---@param label string
---@param f function
---@param keep_open bool
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#addcontextmenuitem)
---
function Object.addContextMenuItem(label, f, keep_open) end

---Add a Decal onto the object.
---TODO: [{('decal', 'table'): [['name', 'string'], ['url', 'string'], ['position', 'Vector'], ['rotation', 'Vector'], ['scale', 'float']]}]
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#adddecal)
---
function Object.addDecal() end

---Adds a force vector to the Object.
---@param force_vector Vector
---@param force_type int
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#addforce)
---
function Object.addForce(force_vector, force_type) end

---Adds a tag to the Object.
---@param tag string
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#addtag)
---
function Object.addTag(tag) end

---Add object to player's selection
---@param player_color string
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#addtoplayerselection)
---
function Object.addToPlayerSelection(player_color) end

---Adds a torque vector to the Object.
---@param torque_vector Vector
---@param force_type int
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#addtorque)
---
function Object.addTorque(torque_vector, force_type) end

---Attaches a hider to the object (or removes it if enabled is false).
---@param hider string
---@param enabled bool
---@param players table
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#attachhider)
---
function Object.attachHider(hider, enabled, players) end

---Attaches an invisible hider to the object (or removes it if enabled is false).
---@param hider string
---@param enabled bool
---@param players table
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#attachhider)
---
function Object.attachInvisibleHider(hider, enabled, players) end

---Calls a Lua function owned by this Object and passes an optional table as parameters to the function.
---@param function_name string
---@param parameters table
---@return any
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#call)
---
function Object.call(function_name, parameters) end

---Clears all 3D UI buttons on this Object.
---@return bool
function Object.clearButtons() end

---Clears all added context menu items on this Object.
---@return bool
function Object.clearContextMenu() end

---Clears all 3D UI text inputs on this Object.
---@return bool
function Object.clearInputs() end

---Copies and pastes this Object. Returns a reference to the newly spawned Object.
---TODO: [{('parameters', 'table'): [['position', 'Vector', '[x=0, y=3, z=0]'], ['snap_to_grid', 'bool', '[false]']]}]
---@return Object
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#clone)
---
function Object.clone() end

---Creates a 3D UI button on this Object.
---TODO: [{('button', 'table'): [['click_function', 'string', '(required)'], ['function_owner', 'Object', '(required)'], ['label', 'string'], ['position', 'Vector'], ['rotation', 'Vector'], ['scale', 'Vector'], ['width', 'int'], ['height', 'int'], ['font_size', 'int'], ['color', 'Color'], ['font_color', 'Color'], ['hover_color', 'Color'], ['press_color', 'Color'], ['tooltip', 'string']]}]
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#createbutton)
---
function Object.createButton() end

---Creates a 3D UI text input on this Object. If input_function returns a string it overrides the input contents.
---TODO: [{('input', 'table'): [['input_function', 'string', '(required)'], ['function_owner', 'Object', '(required)'], ['label', 'string'], ['alignment', 'int', '(1 = Automatic, 2 = Left, 3 = Center, 4 = Right, 5 = Justified)'], ['position', 'Vector'], ['rotation', 'Vector'], ['scale', 'Vector'], ['width', 'int'], ['height', 'int'], ['font_size', 'int'], ['color', 'Color'], ['font_color', 'Color'], ['tooltip', 'Color'], ['value', 'string'], ['validation', 'int', '(1 = None, 2 = Integer, 3 = Float, 4 = Alphanumeric, 5 = Username, 6 = Name)'], ['tab', 'int', '(1 = None, 2 = Select Next, 3 = Indent)']]}]
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#createinput)
---
function Object.createInput() end

---Cuts a deck at the given card index and returns created objects.  If no index provided cuts deck in half.
---@param index int
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#cut)
---
function Object.cut(index) end

---Deals to player's hand. If no player_color supplied it will deal to all seated players.
---@param number int
---@param player_color string
---@param hand_index int
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#deal)
---
function Object.deal(number, player_color, hand_index) end

---Deals a Card to a player with an offset from their hand.
---@param offset Vector
---@param flip bool
---@param player_color string
---@return Object
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#dealtocolorwithoffset)
---
function Object.dealToColorWithOffset(offset, flip, player_color) end

---Destroys an attachment with the given index.
---@param index int
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#destroyattachment)
---
function Object.destroyAttachment(index) end

---Destroys all attachments.
---@return bool
function Object.destroyAttachments() end

---Destroys this Object. Mainly so you can call self.destruct().
---@return bool
function Object.destruct() end

---If held the object will be dropped.
---@return bool
function Object.drop() end

---Edits a 3D UI button on this Object based on its index.
---TODO: [{('button', 'table'): [['index', 'int', '(required)'], ['click_function', 'string'], ['function_owner', 'Object'], ['label', 'string'], ['position', 'Vector'], ['rotation', 'Vector'], ['scale', 'Vector'], ['width', 'int'], ['height', 'int'], ['font_size', 'int'], ['color', 'Color'], ['font_color', 'Color']]}]
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#editbutton)
---
function Object.editButton() end

---Edits a 3D UI input on this Object based on its index.
---TODO: [{('input', 'table'): [['index', 'int', '(required)'], ['input_function', 'string'], ['function_owner', 'Object'], ['label', 'string'], ['alignment', 'int', '(1 = Automatic, 2 = Left, 3 = Center, 4 = Right, 5 = Justified)'], ['position', 'Vector'], ['rotation', 'Vector'], ['scale', 'Vector'], ['width', 'int'], ['height', 'int'], ['font_size', 'int'], ['color', 'Color'], ['font_color', 'Color'], ['tooltip', 'Color'], ['value', 'string'], ['validation', 'int', '(1 = None, 2 = Integer, 3 = Float, 4 = Alphanumeric, 5 = Username, 6 = Name)'], ['tab', 'int', '(1 = None, 2 = Select Next, 3 = Indent)']]}]
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#editinput)
---
function Object.editInput() end

---Flips this Object.
---@return bool
function Object.flip() end

---Returns the current angular velocity vector of the Object.
---@return table
function Object.getAngularVelocity() end

---Returns a table in the same format as getObjects() for containers.
---TODO: [{'return': [{'items': [['name', 'string'], ['description', 'string'], ['guid', 'string'], ['index', 'int'], ['lua_script', 'string'], ['lua_script_state', 'string']]}]}]
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getattachments)
---
function Object.getAttachments() end

---Returns the tags attached to the Object.
---@return table
function Object.getTags() end

---Returns the world space axis aligned Bounds of the Object.
---@return table
function Object.getBounds() end

---Returns the world space axis aligned Bounds of the Object's colliders at zero rotation.
---@return table
function Object.getBoundsNormalized() end

---Gets a list of all the 3D UI buttons on this Object.
---TODO: [{'return': [{'items': [['index', 'int'], ['click_function', 'string'], ['function_owner', 'Object'], ['label', 'string'], ['position', 'Vector'], ['rotation', 'Vector'], ['scale', 'Vector'], ['width', 'int'], ['height', 'int'], ['font_size', 'int'], ['color', 'Color'], ['font_color', 'Color']]}]}]
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getbuttons)
---
function Object.getButtons() end

---Returns the color tint for this Object.
---@return Color
function Object.getColorTint() end

---Returns a child GameObject matching the specified name.
---@param name string
---@return GameObject
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getchild)
---
function Object.getChild(name) end

---Returns a table of all child GameObjects.
---@return table
function Object.getChildren() end

---Get the named component of an object.
---@param name string
---@return Component
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getcomponent)
---
function Object.getComponent(name) end

---Get the named component of an object or its children.
---@param name string
---@return Component
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getcomponentinchildren)
---
function Object.getComponentInChildren(name) end

---Get all components of an object. `name` is optional.
---@param name string
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getcomponents)
---
function Object.getComponents(name) end

---Get all components of an object or its children. `name` is optional.
---@param name string
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getcomponentsinchildren)
---
function Object.getComponentsInChildren(name) end

---Get the current value of a component of an object.
---@param component_name string
---@param variable_name string
---@return any
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getcomponentvar)
---
function Object.getComponentVar(component_name, variable_name) end

---Returns the custom parameters on a Custom Object.
---TODO: [{'return': [['image', 'string', '(Image URL for Custom Board, Custom Dice, Custom Figurine, Custom Tile, and Custom Token.)'], ['image_secondary', 'string', '(Secondary / Back Image URL for Custom Figurine or Custom Tile.)'], ['type', 'int', '(The number of sides of the Custom Dice, the shape of the Custom Tile, the type of Custom Mesh, or the type of Custom AssetBundle.)'], ['thickness', 'float', '(Thickness of the Custom Tile or Custom Token.)'], ['stackable', 'bool', '(Is this Custom Tile or Custom Token stackable?)'], ['merge_distance', 'float', "(The accuracy of the Custom Tile to it's base image.)"], ['mesh', 'string', '(Mesh URL for the Custom Mesh.)'], ['diffuse', 'string', '(Diffuse image URL for the Custom Mesh.)'], ['normal', 'string', '(Normal image URL for the Custom Mesh.)'], ['collider', 'string', '(Collider URL for the Custom Mesh.)'], ['convex', 'bool', '(Is this Custom Mesh concave?)'], ['material', 'int', '(The material for the Custom Mesh or Custom AssetBundle.)'], ['specular_intensity', 'float', '(The specular intensity for the Custom Mesh.)'], ['specular_color', 'Color', '(The specular color for the Custom Mesh.)'], ['specular_sharpness', 'float', '(The specular sharpness for the Custom Mesh.)'], ['fresnel_strength', 'float', '(The fresnel strength for the Custom Mesh.)'], ['cast_shadows', 'bool', '(Does this Custom Mesh cast shadows?)'], ['assetbundle', 'string', '(AssetBundle URL for this Custom AssetBundle.)'], ['assetbundle_secondary', 'string', '(Secondary AssetBundle URL for this Custom AssetBundle.)']]}]
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getcustomobject)
---
function Object.getCustomObject() end

---Returns a table data structure representation of the object. Works with spawnObjectData.
---TODO: [{'return': [['data', 'table'], ['position', 'Vector'], ['rotation', 'Vector'], ['scale', 'Vector'], ['callback_function', 'function']]}]
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getdata)
---
function Object.getData() end

---Returns a table of sub-tables, each sub-table representing one decal.
---TODO: [{'return': [{'items': [['name', 'string', '(Name of decal)'], ['url', 'string', '(Filepath or URL of image)'], ['position', 'Vector', '(Position on Object)'], ['rotation', 'Vector', '(Rotation relative to Object)'], ['scale', 'float', '(1 is normal scale)']]}]}]
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getdecals)
---
function Object.getDecals() end

---Gets the description for this Object.
---@return string
function Object.getDescription() end

---Returns the fog-of-war reveal settings for this Object: {bool reveal, string color, float range}.
---TODO: [{'return': [['reveal', 'bool'], ['color', 'string'], ['range', 'float']]}]
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getfogofwarreveal)
---
function Object.getFogOfWarReveal() end

---Returns the GM notes attached to this Object.
---@return string
function Object.getGMNotes() end

---Returns the GUID that belongs to this Object.
---@return string
function Object.getGUID() end

---Gets a list of all the 3D UI inputs on this Object.
---TODO: [{'return': [{'items': [['index', 'int'], ['click_function', 'string'], ['function_owner', 'Object'], ['label', 'string'], ['position', 'table'], ['rotation', 'table'], ['scale', 'table'], ['width', 'int'], ['height', 'int'], ['font_size', 'int'], ['color', 'Color'], ['font_color', 'Color'], ['tooltip', 'string'], ['alignment', 'int', '(1 = Automatic, 2 = Left, 3 = Center, 4 = Right, 5 = Justified)'], ['value', 'string'], ['validation', 'int', '(1 = None, 2 = Integer, 3 = Float, 4 = Alphanumeric, 5 = Username, 6 = Name)'], ['tab', 'int', '(1 = None, 2 = Select Next, 3 = Indent)']]}]}]
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getinputs)
---
function Object.getInputs() end

---Returns information on any joints attached from this Object.
---TODO: [{'return': [{'items': [['type', 'string', '(One of: "Fixed", "Hinge" [H], "Spring" [S])'], ['joint_object_guid', 'string', '(GUID of attached object)'], ['collision', 'bool', '(Is collision enabled?)'], ['break_force', 'float', '(Force required to break joint)'], ['break_torque', 'float', '(Torque required to break joint)'], ['axis', 'Vector', '([H] Axis of rotation)'], ['anchor', 'Vector', '([H] Position of anchor)'], ['connector_anchor', 'Vector', '([H] Position on connected Object)'], ['motor_force', 'float', '([H] Option A: Force of rotation)'], ['motor_velocity', 'float', '([H] Option B: Velocity of rotaton)'], ['motor_free_spin', 'bool', '(If enabled the motor will only accelerate but never slow down)'], ['spring', 'float', '(Force used to keep objects together)'], ['damper', 'float', '(Force used to dampen spring)'], ['max_distance', 'float', '(Maximum distance objects may be apart)'], ['min_distance', 'float', '(Minimum distance objects may be apart)']]}]}]
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getjoints)
---
function Object.getJoints() end

---Returns a serialization of the JSON string which represents this item.
---@param indented bool
---@return string
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#get-functions)
---
function Object.getJSON(indented) end

---Get the lock status of this object.
---@return bool
function Object.getLock() end

---Returns the index of the currently looping effect.
---@return int
function Object.getLoopingEffectIndex() end

---Returns a table with the keys "index" and "name" for each looping effect.
---@return table
function Object.getLoopingEffects() end

---Returns the Lua script for this Object.
---@return string
function Object.getLuaScript() end

---Get all materials of an object.
---@return table
function Object.getMaterials() end

---Get all materials of an object or its children.
---@return table
function Object.getMaterialsInChildren() end

---Returns the nickname for this Object.
---@return string
function Object.getName() end

---Bag or Deck: Returns all the Objects inside of this container.
---TODO: [{'return': [{'items': [['name', 'string'], ['description', 'string'], ['guid', 'string'], ['index', 'int'], ['lua_script', 'string'], ['lua_script_state', 'string']]}]}]
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getobjects-containers)
---
function Object.getObjects() end

---Zone: Returns all the Objects inside of this zone.
---TODO: [['ignore_tags', 'bool'], {'return': [{'items': [['object', 'Object']]}]}]
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getobjects-zones)
---
function Object.getObjects() end

---Gets the position for this Object.
---@return table
function Object.getPosition() end

---Gets the current smooth-move target position for this Object.
---@return table
function Object.getPositionSmooth() end

---Returns the number of Objects in a stack.
---@return int
function Object.getQuantity() end

---Gets the rotation of this Object in degrees.
---@return table
function Object.getRotation() end

---Gets the current smooth-move target rotation for this Object.
---@return table
function Object.getRotationSmooth() end

---Returns the rotation value for this Object.
---@return int
function Object.getRotationValue() end

---Returns the rotation values for this Object. List of tables with Keys: "value" and "rotation".
---TODO: [{'return': [{'items': [['value', 'int'], ['rotation', 'Vector']]}]}]
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getrotationvalues)
---
function Object.getRotationValues() end

---Gets the scale for this Object.
---@return table
function Object.getScale() end

---Returns a table of the Players currently selecting the Object.
---@return table
function Object.getSelectingPlayers() end

---Returns the snap points attached to the Object.
---TODO: [{'return': [{'items': [['position', 'Vector'], ['rotation', 'Vector'], ['rotation_snap', 'bool']]}]}]
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getsnappoints)
---
function Object.getSnapPoints() end

---Returns id of the active state for this object. Will return -1 if the object has no states.
---@return int
function Object.getStateId() end

---Returns a table with the keys "name", "guid", and "id".
---TODO: [{'return': [{'items': [['name', 'string'], ['description', 'string'], ['guid', 'string'], ['id', 'int'], ['lua_script', 'string'], ['lua_script_state', 'string']]}]}]
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getstates)
---
function Object.getStates() end

---Gets a Lua table for this Object.
---@param table_name string
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#gettable)
---
function Object.getTable(table_name) end

---Gets the forward direction of this Object.
---@return table
function Object.getTransformForward() end

---Gets the right direction of this Object.
---@return table
function Object.getTransformRight() end

---Gets the up direction of this Object.
---@return table
function Object.getTransformUp() end

---Returns a table with the keys "index" and "name" for each trigger effect.
---@return table
function Object.getTriggerEffects() end

---Returns the value for this Object.
---@return int
function Object.getValue() end

---Gets a Lua variable for this Object.
---@param variable_name string
---@return any
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getvar)
---
function Object.getVar(variable_name) end

---Returns the vector lines on this Object.
---TODO: [{'return': [{'items': [['points', 'table'], ['color', 'Color'], ['thickness', 'float'], ['rotation', 'Vector']]}]}]
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#getvectorlines)
---
function Object.getVectorLines() end

---Returns the current velocity vector of the Object.
---@return table
function Object.getVelocity() end

---Returns the world space axis aligned Bounds of the Object's renderers at zero rotation.
---@return table
function Object.getVisualBoundsNormalized() end

---Returns all the Zones which the object is currently inside.
---@return table
function Object.getZones() end

---Returns whether the Object has any tag attached to it.
---@return bool
function Object.hasAnyTag() end

---Returns whether the Object and the specified other Object share at least one tag.
---@param object Object
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#hasmatchingtag)
---
function Object.hasMatchingTag(object) end

---Returns whether the Object has the specified tag attached.
---@param tag string
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#hastag)
---
function Object.hasTag(tag) end

---Stop highlighting this object.
---@return bool
function Object.highlightOff() end

---Highlight this object with color for an optional duration. Color values are between 0 and 1.
---@param color Color
---@param duration float
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#highlighton)
---
function Object.highlightOn(color, duration) end

---Is the object smoothly moving from our smooth functions.
---@return bool
function Object.isSmoothMoving() end

---Returns true if the Object is (or will be) destroyed.
---@return bool
function Object.isDestroyed() end

---Joints objects together.
---TODO: [{('join', 'table'): [['type', 'string', '(required - "Fixed", "Hinge", or "Spring")'], ['collision', 'bool'], ['break_force', 'float'], ['break_torque', 'float'], ['axis', 'Vector'], ['anchor', 'Vector'], ['connected_anchor', 'Vector'], ['motor_force', 'float'], ['motor_velocity', 'float'], ['motor_free_spin', 'bool'], ['spring', 'float', '[10]'], ['damper', 'float', '[0.2]'], ['max_distance', 'float'], ['min_distance', 'float']]}]
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#jointto)
---
function Object.jointTo() end

---Starts playing a looping effect. Index starts at 0.
---@param index int
---@return void
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/behavior/assetbundle/#playloopingeffect)
---
function Object.playLoopingEffect(index) end

---Starts playing a trigger effect. Index starts at 0.
---@param index int
---@return void
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/behavior/assetbundle/#playtriggereffect)
---
function Object.playTriggerEffect(index) end

---Converts the world position to a local position of this Object.
---@param vector Vector
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#positiontolocal)
---
function Object.positionToLocal(vector) end

---Converts the local position of this Object to a world position.
---@param vector Vector
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#positiontoworld)
---
function Object.positionToWorld(vector) end

---Add this object to the current object. Works for stacking chips, decks, and bags.
---@param object Object
---@return Object
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#putobject)
---
function Object.putObject(object) end

---Same as pressing the "R" key on an Object. Shuffles deck/bag, rolls dice/coin, lifts any other object up in the air.
---@return bool
function Object.randomize() end

---Same as pressing the "R" key on an Object. Triggers onObjectRandomize as if specified player hit it.
---@param player string
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#randomize)
---
function Object.randomize(player) end

---Registers object to be checked for collisions: required for onObjectCollisionEnter etc.
---@param include_stay_events bool
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#registercollisions)
---
function Object.registerCollisions(include_stay_events) end

---Reloads this object by destroying and spawning it place. Returns the newly spawned object. Very useful if using setCustomObject().
---@return table
function Object.reload() end

---Removes a child with the given index. Use getAttachments() to find out the index property.
---@param index int
---@return Object
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#removeattachment)
---
function Object.removeAttachment(index) end

---Detaches the children of this Object. Returns a table of object references.
---@return table
function Object.removeAttachments() end

---Removes a 3D UI button from this Object by its index.
---@param index int
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#removebutton)
---
function Object.removeButton(index) end

---Removes a 3D UI text input from this Object by its index.
---@param index int
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#removeinput)
---
function Object.removeInput(index) end

---Remove object from player's selection
---@param player_color string
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#removefromplayerselection)
---
function Object.removeFromPlayerSelection(player_color) end

---Removes the specified tag from the Object.
---@param tag string
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#removetag)
---
function Object.removeTag(tag) end

---Resets this Object.
---@return bool
function Object.reset() end

---Rolls this Object. Works on Dice and Coins.
---@return bool
function Object.roll() end

---Smoothly rotates this Object with the given offset in degrees.
---@param rotation Vector
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#rotate)
---
function Object.rotate(rotation) end

---Scales this Object by the given amount.
---@param scale Vector
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#scale)
---
function Object.scale(scale) end

---Scales this Object in all axes by the given amount.
---@param scale float
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#scale)
---
function Object.scale(scale) end

---Sets the angular velocity of the object.
---@param vector Vector
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setangularvelocity)
---
function Object.setAngularVelocity(vector) end

---Sets the color tint for this Object.
---@param color Color
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setcolortint)
---
function Object.setColorTint(color) end

---Set the current value of a component of an object.
---@param component_name string
---@param variable_name string
---@param value any
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setcomponentvar)
---
function Object.setComponentVar(component_name, variable_name, value) end

---Used to create a Custom Object.
---@param custom_object table
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setcustomobject)
---
function Object.setCustomObject(custom_object) end

---Sets which decals are on an object. This removes other decals already present; use an empty table to remove all decals.
---TODO: [{('decals', 'table'): [{'items': [['name', 'string'], ['url', 'string'], ['position', 'Vector'], ['rotation', 'Vector'], ['scale', 'float']]}]}]
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setdecals)
---
function Object.setDecals() end

---Sets the description for this Object.
---@param description string
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setdescription)
---
function Object.setDescription(description) end

---Sets whether the object reveals fog-of-war: {bool reveal, string color, float range}
---TODO: [{('fog_setting', 'table'): [['reveal', 'bool'], ['color', 'string'], ['range', 'float']]}]
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setfogofwarreveal)
---
function Object.setFogOfWarReveal() end

---Sets the GM notes attached to this Object.
---@param notes string
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setgmnotes)
---
function Object.setGMNotes(notes) end

---Hides the object from the specified players as if it were in a hand zone.
---@param players table
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#sethiddenfrom)
---
function Object.setHiddenFrom(players) end

---Makes the object invisible to the specified players.
---@param players table
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#seinvisibleto)
---
function Object.setInvisibleTo(players) end

---Set the lock status of an object.
---@param lock bool
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setlock)
---
function Object.setLock(lock) end

---Sets the Lua script for this Object.
---@param script string
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setluascript)
---
function Object.setLuaScript(script) end

---Sets the nickname for this Object.
---@param nickname string
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setname)
---
function Object.setName(nickname) end

---Sets the world space position for this Object.
---@param position Vector
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setposition)
---
function Object.setPosition(position) end

---Smoothly moves this Object from its current position to a given world space position.
---@param position Vector
---@param collide bool
---@param fast bool
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setpositionsmooth)
---
function Object.setPositionSmooth(position, collide, fast) end

---Sets the rotation of this Object in degrees.
---@param rotation Vector
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setrotation)
---
function Object.setRotation(rotation) end

---Smoothly rotates this Object to the given orientation in degrees.
---@param rotation Vector
---@param collide bool
---@param fast bool
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setrotationsmooth)
---
function Object.setRotationSmooth(rotation, collide, fast) end

---Sets the rotation values of this Object: {{int value, Vector rotation}, ...}
---TODO: [{('rotation_values', 'table'): [{'items': [['value', 'int'], ['rotation', 'Vector']]}]}]
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setrotationvalues)
---
function Object.setRotationValues() end

---Sets the scale for this Object.
---@param scale Vector
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setscale)
---
function Object.setScale(scale) end

---Sets the snap points attached to this Object: {{Vector position, Vector rotation, bool rotation_snap}, ...}
---TODO: [{('snap_points', 'table'): [{'items': [['position', 'Vector'], ['rotation', 'Vector'], ['rotation_snap', 'bool']]}]}]
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setsnappoints)
---
function Object.setSnapPoints() end

---Sets the State on this Object and returns reference to the new State.
---@param state int
---@return Object
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setstate)
---
function Object.setState(state) end

---Sets a Lua table for this Object.
---@param table_name string
---@param lua_table table
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#settable)
---
function Object.setTable(table_name, lua_table) end

---Replaces all tags on the Object with those specified.
---@param tags table
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#settags)
---
function Object.setTags(tags) end

---Sets the value for this Object.
---@param value any
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setvalue)
---
function Object.setValue(value) end

---Sets a Lua variable for this Object.
---@param variable_name string
---@param value any
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setvar)
---
function Object.setVar(variable_name, value) end

---Sets the vector lines attached to this Object: {{table points, Color color, float thickness, Vector rotation}, ...}
---TODO: [{('vector_lines', 'table'): [{'items': [['points', 'table'], ['color', 'Color'], ['thickness', 'float'], ['rotation', 'Vector']]}]}]
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setvectorlines)
---
function Object.setVectorLines() end

---Sets the velocity of the object.
---@param vector Vector
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#setvelocity)
---
function Object.setVelocity(vector) end

---Shuffles this Object.
---@return bool
function Object.shuffle() end

---Shuffles the States on this Object and returns reference to the new State.
---@return Object
function Object.shuffleStates() end

---Splits a deck into the chosen number of stacks and returns created objects.
---@param stacks int
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#split)
---
function Object.split(stacks) end

---Spreads the cards of a deck out on the table.
---@param distance float
---@return table
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#spread)
---
function Object.spread(distance) end

---Takes an Object from this container.
---TODO: [{('parameters', 'table'): [['position', 'Vector', '[container position, x+2]'], ['rotation', 'Vector', '[container rotation]'], ['callback_function', 'function'], ['params', 'table'], ['smooth', 'bool'], ['flip', 'bool'], ['guid', 'string'], ['index', 'int'], ['top', 'bool', '[true]']]}]
---@return Object
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#takeobject)
---
function Object.takeObject() end

---Smoothly moves this Object from its current position to a given offset.
---@param position Vector
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/lua-in-tabletop-simulator/object/#translate)
---
function Object.translate(position) end

---Unregisters object to be checked for collisions: onObjectCollisionEnter etc. will no longer work.
---@return bool
function Object.unregisterCollisions() end


return Object