---@meta VectorLines

---@class VectorLine

---@class VectorLine.Properties
---@field points {[1]: Vector, [2]: Vector} The endpoints on this line.
---@field color Color The color of the line.
---@field thickness float How thick the line is (in Unity units). *Optional, defaults to default line size (0.1).*
---@field rotation Vector The rotation of the line. *Optional, defaults to {x=0, y=0, z=0}*

---Parameters for the `Global.addVectorLines` and `Object.addVectorLines` functions.
---@class VectorLine.Parameters
---@field points {[1]: Vector, [2]: Vector} The points to draw lines between.
---@field color? Color The color the lines should be. *Optional, defaults to {r=1, g=1, b=1, a=1} (white).*
---@field thickness? float How thick to make the line (in Unity units). *Optional, defaults to default line size (0.1).*
---@field rotation? Vector The rotation of the lines. *Optional, defaults to {x=0, y=0, z=0}*