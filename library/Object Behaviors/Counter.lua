---@meta Counter

---# Counter

---The Counter behavior is present on the Counter object.
---### Example
---Increment a counter's value.
---```
---object.Counter.increment()
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/counter/)
---
---@class Counter
local Counter = {}

---Resets Counter to 0.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/counter/#clear)
---
function Counter.clear() end

---Reduces Counter's value by 1.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/counter/#decrement)
---
function Counter.decrement() end

---Returns Counter's current value. This function behaves the same as
---[Object's getValue()](https://api.tabletopsimulator.com/object/#getvalue).
---@return int
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/counter/#getvalue)
---
---***
---@see Object.getValue
function Counter.getValue() end

---Increments Counter's value by 1.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/counter/#increment)
---
function Counter.increment() end

---Sets the current value of the Counter. This function behaves the same as
---[Object's setValue()](https://api.tabletopsimulator.com/object/#setvalue).
---@param value int The new value of the Counter.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/counter/#setvalue)
---
---***
---
---@see Object.setValue
---
function Counter.setValue(value) end
