---@meta Joints

---# Joints
---### ⚠️ This class and its subclasses are abstract classes
---They do not really exist in Tabletop Simulator's Lua API. They are just interfaces to help with the
---[jointTo()](https://api.tabletopsimulator.com/object/#jointto) and
---[getJoints()](https://api.tabletopsimulator.com/object/#getjoints) functions.
---@class JointType

---
---Parameters used to create a Spring joint with [jointTo()](https://api.tabletopsimulator.com/object/#jointto).
---@class (fixed) JointType.Parameters.Spring
---@field type "Spring"
---Whether to enable collision between bodies connected with this joint. *Optional, defaults to false*
---@field collision? bool
---@field break_force? float Force required to break the joint. *Optional, defaults to infinity*
---Torque required to break the joint. *Optional, defaults to infinity*
---<ul><b>⚠️ This parameter is spelled as "break_torgue" internally</b></ul>
---@field break_torgue? float
---Where the joint is attached to on this object, relative to this object's center.
---*Optional, defaults to {x=0, y=0, z=0}*
---<ul><b>⚠️ Not officially documented for Spring Joints</b></ul>
---@field anchor? Vector
---Where to attach the joint on the object the joint is connecting to, relative to the object's center.
---*Optional, default depends on position of the objects*
---<ul><b>⚠️ Not officially documented for Spring Joints</b></ul>
---@field connector_anchor? Vector
---@field spring? float How much spring force to apply to keep the objects together. *Optional, defaults to 10*
---@field damper? float How much damper force to apply to dampen the spring joint. *Optional, defaults to 0.2*
---The maximum distance the spring can expand to, relative to the initial distance between the objects when the joint is applied.
---*Optional, defaults to 0*
---@field max_distance? float
---The minimum distance the spring can contract to, relative to the initial distance between the objects when the joint is applied.
---*Optional, defaults to 0*
---@field min_distance? float
---
---***
---
---[Open Documentation](https://kb.tabletopsimulator.com/game-tools/joint-tool/)
---

---
---Properties for the Spring joint type returned by [getJoints()](https://api.tabletopsimulator.com/object/#getjoints).
---@class (fixed) JointType.Properties.Spring
---@field type "Spring"
---@field joint_object_guid string The GUID of the connected object.
---Whether collision is enabled between bodies connected with this joint. *Optional, defaults to false*
---@field collision bool 
---@field break_force? float Force required to break the joint. *Optional, defaults to infintiy*
---Torque required to break the joint.
---*Optional, defaults to infintiy*<ul>**⚠️ This parameter is spelled as "break_torgue" internally**</ul>
---@field break_torgue? float
---Not officially documented for Spring joints. *Optional, defaults to {x=1, y=0, z=0}*
---@field axis? Vector
---Where the joint is attached to on this object, relative to this object's center.
---*⚠️ Returned by ``Object.getJoint()`` but is not officially documented for Spring Joints*
---@field anchor Vector
---Where the joint is attached to on the connected object, relative to its center.
---*⚠️ Returned by ``Object.getJoint()`` but is not officially documented for Spring joints*
---@field connector_anchor Vector
---*⚠️ Returned by ``Object.getJoint()`` but has no documented or discernable use for Spring joints*
---@field motor_force float
---*⚠️ Returned by ``Object.getJoint()`` but has no documented or discernable use for Spring joints*
---@field motor_velocity float
---*⚠️ Returned by ``Object.getJoint()`` but has no documented or discernable use for Spring joints*
---@field motor_free_spin bool
---@field spring float The spring force used to keep objects together.
---@field damper float The damper force used to dampen this spring joint.
---The maximum distance between the bodies connected with this joint, relative to the initial difference when the joint
---was applied.
---@field max_distance float
---The minimum distance between the bodies connected with this joint, relative to the initial difference when the joint
---was applied.
---@field min_distance float
---
---***
---
---[Open Documentation](https://kb.tabletopsimulator.com/game-tools/joint-tool/)
---




---
---Parameters passed to [jointTo()](https://api.tabletopsimulator.com/object/#jointto) to create a Hinge joint.
---
---"Motor" can be used to apply a force to rotate the joint.
---@class (fixed) JointType.Parameters.Hinge
---@field type "Hinge"
---Whether to enable collision between bodies connected with this joint. *Optional, defaults to false*
---@field collision? bool
---@field break_force? float Force required to break the joint. *Optional, defaults to infinity*
---Torque required to break the joint. *Optional, defaults to infinity*
---<ul><b>⚠️ This parameter is spelled as "break_torgue" internally</b></ul>
---@field break_torgue? float
---@field axis? Vector The axis the hinge joint will rotate around. *Optional, defaults to {x=1, y=0, z=0}*
---Where the joint is attached to on this object, relative to this object's center.
---*Optional, defaults to {x=0, y=0, z=0}*
---@field anchor? Vector
---Where to attach the joint on the object the joint is connecting to, relative to the object's center.
---*Optional, default depends on position of the objects*
---@field connector_anchor? Vector
---How much force to use to rotate the joint. *Optional, defaults to 0*
---@field motor_force? float
---How fast the motor will rotate the joint in degrees per second. *Optional, defaults to 0*
---@field motor_velocity? float
---Whether the motor will only accelerate and never slow down. *Optional, defaults to false*
---@field motor_free_spin? bool
---
---***
---
---[Open Documentation](https://kb.tabletopsimulator.com/game-tools/joint-tool/)
---

---
---Properties for the hinge joint type returned by [getJoints()](https://api.tabletopsimulator.com/object/#getjoints).
---@class (fixed) JointType.Properties.Hinge
---@field type "Hinge"
---@field joint_object_guid string The GUID of the connected object.
---@field collision bool Whether collision is enabled between bodies connected with this joint.
---@field break_force float Force required to break the joint.
---Torque required to break the joint. *⚠️ This parameter is spelled as "break_tor**g**ue" internally*
---@field break_torgue float
---@field axis Vector The axis of rotation for the hinge joint.
---@field anchor Vector The position of the hinge joint on this object.
---@field connector_anchor Vector The position of the hinge joint on the connected object.
---The motor will apply this force up to a maximum force to achieve the velocity in degrees per second.
---@field motor_force float
---The motor will apply a force up to a maximum force to achieve this velocity in degrees per second.
---@field motor_velocity float
---@field motor_free_spin bool If enabled, the motor will only accelerate but never slow down.
---*⚠️ Returned by ``Object.getJoint()`` but has no documented or discernable use for Hinge joints*
---@field spring float
---*⚠️ Returned by ``Object.getJoint()`` but has no documented or discernable use for Hinge joints*
---@field damper float
---*⚠️ Returned by ``Object.getJoint()`` but has no documented or discernable use for Hinge joints*
---@field max_distance float
---*⚠️ Returned by ``Object.getJoint()`` but has no documented or discernable use for Hinge joints*
---@field min_distance float
---
---***
---
---[Open Documentation](https://kb.tabletopsimulator.com/game-tools/joint-tool/)
---



---Parameters passed to [jointTo()](https://api.tabletopsimulator.com/object/#jointto) to create a Fixed joint.
---@class JointType.Parameters.Fixed
---@field type "Fixed"
---Whether to enable collision between bodies connected with this joint. *Optional, defaults to false*
---@field collision? bool
---@field break_force? float Force required to break the joint. *Optional, defaults to infinity*
---Torque required to break the joint. *Optional, defaults to infinity*
---<ul><b>⚠️ This parameter is spelled as "break_torgue" internally</b></ul>
---@field break_torgue? float
---Where the joint is attached to on this object, relative to this object's center.
---*Optional, defaults to {x=0, y=0, z=0}*
---<ul><b>⚠️ Not officially documented for Fixed Joints</b></ul>
---@field anchor? Vector
---Where to attach the joint on the object the joint is connecting to, relative to the object's center.
---*Optional, default depends on position of the objects*
---<ul><b>⚠️ Not officially documented for Fixed Joints</b></ul>
---@field connector_anchor? Vector
---
---***
---
---[Open Documentation](https://kb.tabletopsimulator.com/game-tools/joint-tool/)

---
---Properties for the Fixed joint type returned by [getJoints()](https://api.tabletopsimulator.com/object/#getjoints).
---
---@class (fixed) JointType.Properties.Fixed
---@field joint_object_guid string The GUID of the connected object.
---@field collision bool Whether collision is enabled between bodies connected with this joint.
---@field break_force float Force required to break the joint.
---Torque required to break the joint. *⚠️ This parameter is spelled "break_tor**g**ue"*
---&emsp;&emsp;
---@field break_torgue float
--- *⚠️ Returned by ``Object.getJoint()`` but has no documented or discernable use for Spring Joints*
---@field axis Vector
---The position of the Fixed joint on this object.
---*⚠️ Returned by ``Object.getJoint()`` but is not officially documented for Fixed joints*
---@field anchor Vector
---The position of the Fixed joint on the connected object.
---*⚠️ Returned by ``Object.getJoint()`` but is not officially documented for Fixed joints*
---@field connector_anchor Vector The position of the Fixed joint on the connected object.
---The motor will apply this force up to a maximum force to achieve the velocity in degrees per second.
---@field motor_force float
---The motor will apply a force up to a maximum force to achieve this velocity in degrees per second.
---@field motor_velocity float
---*⚠️ Returned by ``Object.getJoint()`` but has no documented or discernable use for Fixed joints*
---@field motor_free_spin bool
--*⚠️ Returned by ``Object.getJoint()`` but has no documented or discernable use for Fixed joints*
---@field spring float
--*⚠️ Returned by ``Object.getJoint()`` but has no documented or discernable use for Fixed joints*
---@field damper float
---*⚠️ Returned by ``Object.getJoint()`` but has no documented or discernable use for Fixed joints*
---@field max_distance float
---*⚠️ Returned by ``Object.getJoint()`` but has no documented or discernable use for Fixed joints*
---@field min_distance float
---***
---
---[Open Documentation](https://kb.tabletopsimulator.com/game-tools/joint-tool/)
---






---@alias JointType.PropertiesKind
---| JointType.Properties.Spring
---| JointType.Properties.Hinge
---| JointType.Properties.Fixed

---@alias JointType.ParametersKind
---| JointType.Parameters.Spring
---| JointType.Parameters.Hinge
---| JointType.Parameters.Fixed