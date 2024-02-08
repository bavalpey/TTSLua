---@meta Color

---@gen
---@class Color: float[]
---@field public [1] float
---@field public [2] float
---@field public [3] float
---@field public [4] float
---Returns a table of all color strings.
---```
---data = Color.list
----- Same as
---data = {
---    [1] => "White",
---    [2] => "Brown",
---    [3] => "Red",
---    [4] => "Orange",
---    [5] => "Yellow",
---    [6] => "Green",
---    [7] => "Teal",
---    [8] => "Blue",
---    [9] => "Purple",
---    [10] => "Pink",
---    [11] => "Grey",
---    [12] => "Black"
---}
---```
---
---[Open Documentation](https://api.tabletopsimulator.com/color/#colorlist)
---@field public list string[]
---Return a color from a color string ('Red', 'Green' etc).
---@overload fun(r?: float, g?: float, b?: float, a?: float):Color
---@overload fun(v: float[]):Color
Color = {}

---Return a color some part of the way between self and `otherCol`, numeric arg \[0, 1\] is the fraction.
---@param otherCol Color The color to compare with.
---@param fraction float Numeric ``fraction``.
---@return Color
---```
---local pink = Color.Red:lerp(Color.White, 0.5)
---print(pink) -- Color: { r = 0.928, g = 0.55, b = 0.547, a = 1 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/color/#lerp)
---
function Color:Lerp(otherCol, fraction)
end


---Player colors

---@type Color
Color.White = Color(1, 1, 1)
Color.Brown = Color(0.443, 0.231, 0.09)
Color.Red = Color(0.856, 0.1, 0.094)
Color.Orange = Color(0.956, 0.392, 0.113)
Color.Yellow = Color(0.905, 0.898, 0.172)
Color.Green = Color(0.192, 0.701, 0.168)
Color.Teal = Color(0.129, 0.694, 0.607)
Color.Blue = Color(0.118, 0.53, 1)
Color.Purple = Color(0.627, 0.125, 0.941)
Color.Pink = Color(0.96, 0.439, 0.807)
Color.Grey = Color(0.5, 0.5, 0.5)
Color.Black = Color(0.25, 0.25, 0.25)

return Color
