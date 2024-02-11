---@meta Color

---# Color

---Color is a type of Table that is used to define RGBA values for tinting. R for red, G for green, B for blue, and A
---for alpha (transparency).
---
---Check [Manipulation examples](https://api.tabletopsimulator.com/color/#manipulation-examples) for more detailed usage.
---
--->### 🔥 Tip
--->Vector and Color are the first classes to be defined in pure Lua. This means you **have** to use colon operator
--->(e.g. `col:lerp()`) to call member functions, not the dot operator. Failing to do so will fail with cryptic error
--->messages displayed.
---
---@class Color
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
---@overload fun(r?: float, g?: float, b?: float, a?: float):Color
---@overload fun(v: float[]):Color
Color = {}

---## Constructors summary
--->### 🔥 Tip
--->Every place that returns a coordinate table, `like obj.getColorTint()`, serves a Color class instance already - you
--->do not have to explicitly construct it. When constructing Color instances, the `.new` part can be omitted, making
--->e.g. `Color(1, 0.5, 0.75)` equivalent to `Color.new(1, 0.5, 0.75)`.
---
---## Constructors Examples
---```
---function onLoad()
---    local red = Color.new(1, 0, 0)
---    local green = Color(0, 1, 0) -- same as Color.new(0, 1, 0)
---
---    local orangePlayer = Color.fromString("Orange")
---    local purplePlayer = Color.Purple
---end
---```

---Return a color with specified components
---@param r? float Red component between 0 and 1. *Optional, defaults to 0*
---@param g? float Green component between 0 and 1. *Optional, defaults to 0*
---@param b? float Blue component between 0 and 1. *Optional, defaults to 0*
---@param a? float Alpha component between 0 and 1. *Optional, defaults to 1*
function Color.new(r, g, b, a) end

---Return a color from the table specifying the r,g,b, and a components
---@param t {r?: float, g?: float, b?: float, a?: float}
---
---***
---
---### Example Usage
---```
---local teal = Color({r = 0.129, g = 0.694, b = 0.607})
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/color/#colornew)
function Color.new(t) end

---Return a color from a color string ('Red', 'Green' etc), capitalization ignored.
---
---@param colorStr string Any [Player Color](https://api.tabletopsimulator.com/player/colors/) or color added with [Color.Add](https://api.tabletopsimulator.com/color/#coloradd).
---@return Color
---
---***
---
---### Example Usage
---```
---local col = Color.fromString("Blue")
---print(col) --> Color: Blue { r = 0.118, g = 0.53, b = 1 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/color/#fromstring)
---
function Color.fromString(colorStr) end

---Return a color from a hex string.
---
---@param hexStr string A hex string representing the color, in the form `"#RRGGBB"`, or `"#RRGGBBAA"`.  The `"#"` character is optional.
---
---***
---
---### Example Usage
---```
-----Without the # character
---local col = Color.fromHex("1e87ff")
---print(col) --> Color: Blue { r = 0.117647, g = 0.529412, b = 1 }
---
---With the # character and alpha
---local col2 = Color.fromHex("#da1917ff")
---print(col2) --> Color: Red { r = 0.854902, g = 0.098039, b = 0.090196 }
---
-----Alpha without the # character
---local col3 = Color.fromHex("3f3f3fff")
---print(col3) --> Color: Black { r = 0.247059, g = 0.247059, b = 0.247059 }
---```
---
---***
---
---~~[Open Documentation](https://api.tabletopsimulator.com/color/#fromhex)~~ Official documentation missing.
---
function Color.fromHex(hexStr) end

---# Element Access Summary
---In addition to accessing color components by their numeric indices (1, 2, 3, 4) and textual identifiers (r, g, b, a),
---the following methods may also be utilized.

---Sets a component to value and returns self.
---@param key int Index of component (1, 2, 3, or 4 for r, g, b, or a).
---@param num float New value.
---@return self # The updated Color instance.
---
---***
---
---### Example Usage
---```
---col = Color.Blue
---col:setAt(1, 128 / 255):setAt('a', 0.5)
---print(col) --> Color: { r = 0.501961, g = 0.53, b = 1, a = 0.5 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/color/#setat)
---
function Color:setAt(key, num) end


---Update all components of the vector and return self.
---
---Providing a nil value makes it ignore that argument.
---@param r? float New value of Red component.
---@param g? float New value of Green component.
---@param b? float New value of Blue component.
---@param a? float New value of Alpha component.
---@return self # The updated Color instance.
---
---***
---
---### Example Usage
---```
---col = Color.black
---col:set(41 / 255, 128 / 255, 185 / 255)
---print(col) --> Color: { r = 0.160784, g = 0.501961, b = 0.72549, a = 1 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/color/#set)
---
function Color:set(r, g, b, a) end

---Returns `r`, `g`, `b`, `a` components as four separate values.
---
---@return float, float, float, float
---
---***
---
---### Example Usage
---```
---col = Color.Blue
---r, g, b, a = col:get()
---print(r + g + b + a) --> 2.648
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/color/#get)
---
function Color:get() end

---Copy self into a new Color and return it.
---
---@return Color
---
---***
---
---### Example Usage
---```
---col1 = Color(1, 0.5, 0.75)
---col2 = col1:copy()
---col1:set(0.75, 1, 0.25)
---print(col1) --> Color: { r = 0.75, g = 1, b = 0.25, a = 1 }
---print(col2) --> Color: { r = 1, g = 0.5, b = 0.75, a = 1 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/color/#copy)
---
function Color:copy() end

---## Methods summary
---### Methods not modifying self

---Returns a hex string for `color`
---
---@param includeAlpha bool Whether or not to include the value for `a` *Default true*
---@return string
---
---***
---
---### Example Usage
---```
---print(Color.blue:toHex()) -- 1e87ffff
---print(Color.blue:toHex(true)) -- 1e87ffff
---print(Color.blue:toHex(false)) -- 1e87ff
---```
---
---[Open Documentation](https://api.tabletopsimulator.com/color/#tohex)
---
function Color:toHex(includeAlpha) end

---Return one of the existing `Color` strings that is closest to `self`.
---comment
---@param tolerance float Numeric `tolerance`. *Optional, defaults to 0.01*
---@return string
---
---***
---
---### Example Usage
---```
---print(Color( 0.118, 0.53, 1):toString()) -- Blue
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/color/#tostring)
---
function Color:toString(tolerance) end

function Color:equals(otherCol, num) end

---Return a color some part of the way between self and `otherCol`, numeric arg \[0, 1\] is the fraction.
---@param otherCol Color The color to compare with.
---@param fraction float Numeric ``fraction``.
---@return Color
---
---***
---
---### Example Usage
---```
---local pink = Color.Red:lerp(Color.White, 0.5)
---print(pink) -- Color: { r = 0.928, g = 0.55, b = 0.547, a = 1 }
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/color/#lerp)
---
function Color:Lerp(otherCol, fraction) end

---Return a string description of a color with an optional `prefix`.
---@return string 1 The string description of the color.
---@return float 2 An errant value returned by the last gsub used in the internal function.
---@param prefix string The prefix of the returned string.
---
---***
---
--->### ⚠️ Warning
--->This function returns one extra float that will be displayed in the print function.
--->This value is returned by the last gsub used in the internal function.
---
---### Example Usage
---```
---col = Color.Blue
---str = col:dump('Prefix')
---print(str) --> Prefix: Blue { r = 0.118, g = 0.53, b = 1, a = 1 }
---print(col:dump('Prefix')) --> Prefix: Blue { r = 0.118, g = 0.53, b = 1, a = 1 } 2
---print(Color.dump(col, 'Prefix')) --> Prefix: Blue { r = 0.118, g = 0.53, b = 1, a = 1 } 2
---```
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/color/#dump)
---
function Color:dump(prefix) end

---## Other methods

---Add your own color definition to the class
---
---@param name string The name of the color to add.
---@param yourColor Color The value the color will be.
---
---***
---
---### Example Usage
---```
---Color.Add("River", Color(52 / 255, 152 / 255, 219 / 255))
---local color, name = Color.River
---print(color) -- Color: River { r = 0.203922, g = 0.596078, b = 0.858824, a = 1 }
---print(name) -- River
---```
---
---***
---
--->### 🔥 Info
--->Colors added by this method are added to the global `Color` class, and can later be accessed directly via
--->`Color.yourColor` (case-insensitive). This will return the `Color` value from the color string, as well as the name
--->of the color.
---
---[Open Documentation](https://api.tabletopsimulator.com/color/#add)
---
---***
---
---See: [Color.Blue](https://api.tabletopsimulator.com/color/#colorblue)
function Color.add(name, yourColor) end


---Return a string description of a color.
---@return string
---
---***
---
---### Example Usage
---```
---function onLoad()
---    local col = Color({r = 0.118, g = 0.53, b = 1})
---
---    -- Color : Blue { r = 0.118, g = 0.53, b = 1, a = 1}
---    tostring(Color(0.118, 0.53, 1))
---
---    --> Color : { r = 0.3, g = 0.5, b = 1, a = 1}
---    tostring(Color({r = 0.3, g = 0.5, b = 1}))
---end
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/color/#tostring_1)
---
function tostring(color) end

---Player colors

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