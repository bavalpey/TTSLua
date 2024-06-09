---@meta Vector

---Representation of 3D vectors and points.
---
---Example Usage:
---```
---target = Vector(1, 0, 0) + Vector(0, 2, 0):normalized()
---```

---@class Vector
---@field [1] float
---@field [2] float
---@field [3] float
---@field x float
---@field y float
---@field z float
---@overload fun(x?: float, y?: float, z?: float):Vector
---@overload fun(v: VectorLike):Vector
---@operator add(VectorLike):Vector
---@operator sub(VectorLike):Vector
---@operator mul(float):Vector
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/)
---
Vector = {}

---A table with x, y, and z keys that all have float values. Almost any function<sup>†</sup> that accepts a Vector will
---also accept this.
---> #### ⚠️ Warning
---> It is highly recommended to use the `Vector()` constructor expilcitly instead of a table like this.
---> See https://tabletopsimulator.nolt.io/2298
---@class XYZTable
---@field x? float The x component. If not present, defaults to 0.
---@field y? float The y component. If not present, defaults to 0.
---@field z? float The z component. If not present, defaults to 0.

---Similar to `XYZTable`, except x and y are required.
---@class XYTable: XYZTable
---@field x float
---@field y float
---@field z? float

---@alias VectorLike Vector | XYZTable

---Return a vector with specified (x, y, z) components.
---@param x float
---@param y float
---@param z float
---@return Vector
function Vector.new(x, y, z) end

---Return a vector with specified (x, y, z) components from the table.
---@param v VectorLike # A table.
---@return Vector
function Vector.new(v) end

---Return a vector with all components set to 0.
---@return Vector # A vector with all components set to 0.
function Vector.new() end

---Returns a vector that is made from the smallest components of two vectors.
---@param vec1 VectorLike First vector.
---@param vec2 VectorLike Second vector.
---@return Vector
---```
---vec1 = Vector(1, 2, 3)
---vec2 = Vector(4, 3, 2)
---print(Vector.min(vec1, vec2)) --> Vector: { 1, 2, 2 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#vectormin)
---
function Vector.min(vec1, vec2) end

---Returns a vector that is made from the largest components of two vectors.
---@param vec1 VectorLike First vector.
---@param vec2 VectorLike Second vector.
---@return Vector
---```
---vec1 = Vector(1, 2, 3)
---vec2 = Vector(4, 3, 2)
---print(Vector.max(vec1, vec2)) --> Vector: { 4, 3, 3 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#vectormax)
---
function Vector.max(vec1, vec2) end

---Return a vector pointing from vec1 to vec2.
---@param vec1 VectorLike First vector.
---@param vec2 VectorLike Second vector.
---@return Vector
---```
---vec1 = Vector(1, 2, 3)
---vec2 = Vector(4, 3, 2)
---print(Vector.between(vec1, vec2)) --> Vector: { 3, 1, -1 }
---```
---***
---[Open Documentation](https://api.tabletopsimulator.com/vector/#vectorbetween)
function Vector.between(vec1, vec2) end

---Update one component of the vector and returning self.
---@param key int|'x'|'y'|'z' Index of component (1, 2 or 3 for x, y or z).
---@param num float New value.
---@return Vector self
---```
---vec = Vector(1, 2, 3)
---vec:setAt(1, 4):setAt('y', 3)
---print(vec) --> Vector: { 4, 3, 3 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#setat)
---
function Vector:setAt(key, num) end

---Update all components of the vector and returning self.
---
---Providing a nil value makes it ignore that argument.
---@param x? float New value of X component.
---@param y? float New value of Y component.
---@param z? float New value of Z component.
---@return Vector self
---```
---vec = Vector(1, 2, 3)
---vec:set(4, 3, 2)
---print(vec) --> Vector: { 4, 3, 2 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#set)
---
function Vector:set(x, y, z) end

---Returns ``x``, ``y``, ``z`` components as three separate values.
---@return float, float, float
---```
---vec = Vector(1, 2, 3)
---x, y, z = vec:get()
---print(x + y + z) --> 6
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#get)
---
function Vector:get() end

---Returns a separate Vector with identical component values.
---@return Vector
---```
---vec1 = Vector(1, 2, 3)
---vec2 = vec1:copy()
---vec1:set(4, 3, 2)
---print(vec1) --> Vector { 4, 3, 2 }
---print(vec2) --> Vector { 1, 2, 3 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#copy)
---
function Vector:copy() end

---	Adds components of otherVec to self.
---@param otherVec VectorLike The vector to add.
---@return Vector self
---```
---vec = Vector(1, 2, 3)
---otherVec = Vector(4, 5, 6)
---vec:add(otherVec)
---print(vec) --> Vector: { 5, 7, 9 }
---
----- Same as
---vec = Vector(1, 2, 3)
---otherVec = Vector(4, 5, 6)
---vec = vec + otherVec
---print(vec) --> Vector: { 5, 7, 9 }
---```
---***
---[Open Documentation](https://api.tabletopsimulator.com/vector/#add)
---
function Vector:add(otherVec) end

---Subtracts components of otherVec from self.
---@param otherVec VectorLike The vector to subtracts.
---@return Vector self
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/vector/#sub)
function Vector:sub(otherVec) end

---Multiplies self-components by corresponding components from otherVec.
---@param otherVec VectorLike The vector to scale.
---@return Vector self
---```
---vec = Vector(1, 2, 3)
---otherVec = Vector(2, 3, 4)
---vec:scale(otherVec)
---print(vec) --> Vector: { 2, 6, 12 }
---vec:scale(2)
---print(vec) --> Vector: { 4, 12, 24 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#scale)
---
function Vector:scale(otherVec) end

---Multiplies self-components by a numeric factor.
---@param num float The numeric factor.
---@return Vector self
function Vector:scale(num) end

---If self-magnitude is higher than provided limit, scale self-down to match it and returning self.
---@param num float The numeric max magnitude.
---@return Vector self
---```
---vec = Vector(1, 2, 3)
---vec:clamp(2)
---print(vec) --> Vector: { 0.53, 1.07, 1.60 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#clamp)
---
function Vector:clamp(num) end

---Makes this vector have a magnitude of 1 and returning self.
---
---When normalized, a vector keeps the same direction but its length is 1.0.
---
---Note that this function will change the current vector. If you want to keep the current vector unchanged,
---use [normalized()](https://api.tabletopsimulator.com/vector/#normalized) method.
---@param otherVec Vector
---@return Vector self
---```
---vec = Vector(1, 2, 3)
---vec:normalize()
---print(vec) --> Vector: { 0.27, 0.53, 0.80 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#normalize)
function Vector:normalize(otherVec) end

---Make self into projection on another vector and return self.
---
---To understand vector projection, imagine that otherVec is resting on a line pointing in its direction.
---Somewhere along that line will be the nearest point to the tip of vector.
---The projection is just otherVec rescaled so that it reaches that point on the line.
---@param otherVec VectorLike The normal vector.
---@return Vector self
---```
---vec = Vector(2, 1, 4)
---vec:project(Vector(1, - 2, 1))
---print(vec) --> Vector: { 0.67, -1.3, 0.67 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#project)
---
function Vector:project(otherVec) end

---Projects a vector onto a plane defined by a normal orthogonal to the plane and return self.
---
---A Vector stores the position of the given ``vec`` in 3d space. A second Vector is given by `otherVec`
---and defines a direction from a plane towards vector that passes through the origin.
---Vector.projectOnPlane uses the two Vector values to generate the position of vector
---in the `otherVec` direction, and return the location of the Vector on the plane.
---@param otherVec VectorLike The plane normal vector.
---```
---vec = Vector(2, 1, 4)
---vec:projectOnPlane(Vector(1, - 2, 1))
---print(vec) --> Vector: { 1.33, 2.33, 3.33 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#projectonplane)
---
function Vector:projectOnPlane(otherVec) end

--- Make self into reflection on another vector and return self.
---
--- The `otherVec` vector defines a plane (a plane's normal is the vector that is perpendicular to its surface).
--- The ``vec`` vector is treated as a directional arrow coming in to the plane.
--- The returned value is a vector of equal magnitude to vec but with its direction reflected.
---@param otherVec VectorLike The normal vector.
---@return Vector
---```
---vec = Vector(1, 2, 3)
---vec:reflect(Vector(4, 3, 2))
---print(vec) --> Vector: { -3.41, -1.31, 0.79 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#reflect)
---
function reflect(otherVec) end

--- Multiply self-components by -1.
---@return Vector
---```
---vec = Vector(1, 2, 3)
---vec:inverse()
---print(vec) --> Vector: { -1, -2, -3 }
---```
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#inverse)
function inverse() end

---Move self towards another vector, but only up to a provided distance limit and return self.
---@param target VectorLike The position to move towards.
---@param num float The distance limit.
---@return Vector self
---```
---vec = Vector(1, 2, 3)
---vec:moveTowards(Vector(4, 3, 2), 0.5)
---print(vec) --> Vector: { 1.45, 2.15, 2.85 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#movetowards)
function Vector:moveTowards(target, num) end

---Rotate self towards another vector, but only up to a provided angle limit and return self.
---
---This function is similar to [moveTowards()](https://api.tabletopsimulator.com/vector/#movetowards) except that the vector
---is treated as a direction rather than a position. The current vector will be rotated round toward the target direction by an angle of `maxAngle`,
---although it will land exactly on the target rather than overshoot. If the magnitudes of current and target are different,
---then the magnitude of the result will be linearly interpolated during the rotation. If a negative value is used for `maxAngle`,
---the vector will rotate away from target until it is pointing in exactly the opposite direction, then stops.
---@param target VectorLike The position to rotate towards.
---@param maxAngle float
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#rotatetowards)<br>
---
---@see Vector.moveTowards
function Vector:rotateTowards(target, maxAngle) end

---Same as [rotateTowards()](#Vector.rotateTowards), but only works correctly if target Vector is normalized and return self. Less expensive than rotateTowards().
---```
---vec = Vector(1, 2, 3)
---vec:rotateTowardsUnit(Vector(4, 3, 2):normalized(), 45)
---print(vec) --> Vector: { 3.29, 0.87, -1.55 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#rotatetowardsunit)<br>
---
---@see Vector.rotateTowards
function Vector:rotateTowardsUnit(target, maxAngle) end

---Rotate a Vector angle degrees over given axis (can be ``'x'``, ``'y'``, ``'z'``) and return self.
---```
---vec = Vector(3, 2, 3)
---vec:rotateOver('y', 45)
---print(vec) --> Vector: { 4.24, 2, 0 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#rotateover)
---
function Vector:rotateOver(axis, angle) end

---Return the dot product of two vectors.
---
---The dot product is a float value equal to the magnitudes of the two vectors multiplied together and then multiplied by the cosine of the angle between them.
---
---For normalized vectors Dot returns 1 if they point in exactly the same direction, -1 if they point in completely opposite directions and zero if the vectors are perpendicular.
---@param vec1 VectorLike First vector.
---@param vec2 VectorLike Second vector.
---@return float
---```
---vec1 = Vector(0, 1, 2)
---vec2 = Vector(0, 2, 4)
---print(vec1:dot(vec2)) --> 10
---print(Vector.dot(vec1:normalized(), vec2:normalized())) --> 1
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#dot)
---
function Vector:dot(vec1, vec2) end

---Returns the length of this vector.
---@return float
---```
---vec = Vector(1, 2, 3)
---print(vec:magnitude()) --> 3.74 (sqrt of 14)
---print(Vector.magnitude(vec)) --> 3.74 (sqrt of 14)
---```
---***
---[Open Documentation](https://api.tabletopsimulator.com/vector/#magnitude)
function Vector:magnitude() end

---Returns the ssquared length of this vector.
---@return float
---```
---vec = Vector(1, 2, 3)
---print(vec:sqrMagnitude()) --> 14
---print(Vector.sqrMagnitude(vec)) --> 14
---```
---***
---[Open Documentation](https://api.tabletopsimulator.com/vector/#sqrmagnitude)
function Vector:sqrMagnitude() end

---Returns distance between two points.
---@param p1 VectorLike First point.
---@param p2 VectorLike Second point.
---@return float
---```
---p1 = Vector(1, 2, 3)
---p2 = Vector(4, 3, 2)
---print(p1:distance(p2)) --> 3.32
---print(Vector.distance(p1, p2)) --> 3.32
---print((p1 - p2):magnitude())  --> 3.32
---```
---***
---[Open Documentation](https://api.tabletopsimulator.com/vector/#distance)
function Vector:distance(p1, p2) end

---Returns squared distance between two points.
---@param p1 VectorLike First point.
---@param p2 VectorLike Second point.
---@return float
---```
---p1 = Vector(1, 2, 3)
---p2 = Vector(4, 3, 2)
---print(p1:sqrDistance(p2)) --> 11
---print(Vector.sqrDistance(p1, p2)) --> 11
---```
---***
---[Open Documentation](https://api.tabletopsimulator.com/vector/#distance)
function Vector:sqrDistance(p1, p2) end

---Returns true if two vectors are approximately equal. The ``margin`` argument is optional and defaults to tolerating a difference of ``~0.03`` in both vector magnitude.
---@param vec1 VectorLike First vector.
---@param vec2 VectorLike Second vector.
---@param margin? float Numeric tolerance.
---```
---vec1 = Vector(1, 2, 3.10)
---vec2 = Vector(1, 2, 3.15)
---print(vec1:equals(vec2)) --> false
---print(Vector.equals(vec1, vec2, 0.01)) --> true
---```
---***
---[Open Documentation](https://api.tabletopsimulator.com/vector/#equals)
function Vector:equals(vec1, vec2, margin) end

---Return string describing self, optional string prefix
---@param prefix? string
---@return string, float
---```
---vec = Vector(1, 2, 3)
---str = vec:string('Prefix')
---print(str) --> Prefix: { 1, 2, 3 }
---print(vec:string('Prefix')) --> Prefix: { 1, 2, 3 }0
---print(Vector.string(vec, 'Prefix')) --> Prefix: { 1, 2, 3 }0
---```
---#### Warning
---This function returns one extra float that will be displayed in print function. This value is returned by the last gsub used in internal function.
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/vector/#string)
function Vector:string(prefix) end

---Returns the angle in degrees between two vectors.
---@param vec1 VectorLike First vector.
---@param vec2 VectorLike Second vector.
---@return float
---```
---vec1 = Vector(1, 2, 3)
---vec2 = Vector(4, 3, 2)
---print(vec1:angle(vec2)) --> 37.43
---print(Vector.angle(vec1, vec2)) --> 37.43
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#angle)
---
function Vector:angle(vec1, vec2) end

---Return a cross-product vector of two vectors.
---
---The cross product of two vectors results in a third vector which is perpendicular to the two input vectors.
---The result's magnitude is equal to the magnitudes of the two inputs multiplied together and then multiplied
---by the sine of the angle between the inputs. You can determine the direction of the result vector using the
---"left hand rule".
---@param vec1 VectorLike First vector.
---@param vec2 VectorLike Second vector.
---@return Vector
---```
---vec1 = Vector(1, 2, 3)
---vec2 = Vector(4, 3, 2)
---print(vec1:cross(vec2)) --> Vector: { -5, 10, -5 }
---print(vec2:cross(vec1)) --> Vector: { -5, -10, 5 }
---print(Vector.cross(vec1, vec2)) --> Vector: { -5, 10, -5 }
---print(Vector.cross(vec2, vec1)) --> Vector: { -5, -10, 5 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#cross)
---
function Vector:cross(vec1, vec2) end

---Linearly interpolates between two points.
---Interpolates between the points a and b by the interpolant t. The parameter t is clamped to the
---range [0, 1]. This is most commonly used to find a point some fraction of the way along a line
---between two endpoints (e.g. to move an object gradually between those points).
---
---The value returned equals (b - a) * t. When t = 0 returns a. When t = 1 returns b. When t = 0.5
---returns the point midway between a and b.
---@param p1 VectorLike First point.
---@param p2 VectorLike Second point.
---@param t float Fraction.
---```
---p1 = Vector(1, 2, - 4)
---p2 = Vector(1, 2, 4)
---print(p1:lerp(p2, 0.25)) --> Vector: { 1, 2, -2 }
---print(Vector.lerp(p1, p2, 0.25)) --> Vector: { 1, 2, -2 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#lerp)
---
function Vector:lerp(p1, p2, t) end

---Return a new vector that is normalized (length 1) version of self.
---@return Vector
---```
---vec = Vector(1, 2, 3)
---print(vec:normalized()) --> Vector: { 0.27, 0.53, 0.80}
---print(Vector.normalized(vec)) --> Vector: { 0.27, 0.53, 0.80}
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#normalized)
---
function Vector:normalized() end

---Return three normalized vectors perpendicular to each other, first one
---being in the same direction as self. If ``binormalPlaner`` is provided, the second vector is guaranteed to be
---on a self-binormalPlanar plane.
---@param binormalPlanar? Vector The vector for binormalPlanar.
---@return Vector, Vector, Vector
---```
---vec = Vector(0, 0, 2)
---base, normal, binormal = vec:orthoNormalize(Vector(0, 1, 0))
---print(base) --> Vector: { 0, 0, 1}
---print(normal) --> Vector: { -1, 0, 0}
---print(binormal) --> Vector: { 0, -1, 0}
---```
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#orthonormalize)
---
function Vector:orthoNormalize(binormalPlanar) end

---Returns an angle (In degrees) of rotation of Vector over all axis (``'x'``, ``'y'``, ``'z'``).
---@return float, float, float
function Vector:heading() end

---Returns an angle (In degrees) of rotation of Vector over a given ``axis`` (can be ``'x'``, ``'y'``, ``'z'``).
---@param axis "x"|"y"|"z" Can be ``'x'``, ``'y'``, ``'z'``.
---@return float
---```
---vec = Vector(1, 2, 3)
---angle = vec:heading('z')
---print(angle) --> 26.57
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/vector/#heading)
---
function Vector:heading(axis) end

return Vector
