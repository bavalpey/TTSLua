---@meta dynamic

---MoonSharp offers a dynamic module which allows for expression evaluation without compiling Lua bytecode using the
---current execution context.
---@class dynamiclib
---[Open Documentation](https://www.moonsharp.org/additions.html#the-json-module)
dynamic = {}

---Evaluates dynamically the expression contained in `expr`
---
---The evaluation will always perform raw access and will never call any function - it can be used to implement
---debuggers or things like a data load from a table source (using tables as if it was a formtat like JSON..
--- except Lua).
---@param expr string|userdata A string or an expression object created with `dynamic.prepare()`.
---@return any
---
---***
---
---[Open Documentation](https://www.moonsharp.org/additions.html#the-dynamic-module)
---
function dynamic.eval(expr) end

---
--- Creates a prepared expression object which can be passed to `dynamic.eval` for a faster execution than passing the
---string itself.
---@param expr string
---@return userdata
---
---***
---
---[Open Documentation](https://www.moonsharp.org/additions.html#the-dynamic-module)
---
function dynamic.prepare(expr) end

return dynamic
