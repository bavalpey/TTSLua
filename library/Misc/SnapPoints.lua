---@meta SnapPoints

---# Information for snap points
---### ⚠️ This is an abstract class that is not a part of the official Tabletop Simulator API.

---@class SnapPoint.Properties
---[Local Position](https://api.tabletopsimulator.com/types/#position) of the snap point. When attached to an object,
---position is relative to the object's center.
---@field position Vector
---[Local Rotation](https://api.tabletopsimulator.com/types/#rotation) of the snap point. When attached to an object,
---rotation is relative to the object's center.
---@field rotation Vector
---Whether the snap point is a [rotation snap point](https://kb.tabletopsimulator.com/game-tools/snap-point-tool/#rotation-snap).
---@field rotation_snap bool
---Table of `strings` representing the [tags](https://api.tabletopsimulator.com/game-tools/object-tags/) associated
---with the snap point.
---@field tags string[]

---@class SnapPoint.Parameters
---[Local Position](https://api.tabletopsimulator.com/types/#position) for the snap point. When attached to an object,
---position is relative to the object's center.
---@field position? Vector | XYTable | float[]
---[Local Rotation](https://api.tabletopsimulator.com/types/#rotation) for the snap point. When attached to an object,
---rotation is relative to the object's center.
---@field rotation? Vector | XYTable | float[]
---Whether the snap point should be a [rotation snap point](https://kb.tabletopsimulator.com/game-tools/snap-point-tool/#rotation-snap).
---@field rotation_snap? bool
---Table of `strings` to assign as [tags](https://api.tabletopsimulator.com/game-tools/object-tags/) to the snap point.
---@field tags? string[]
