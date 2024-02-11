---@diagnostic disable: duplicate-doc-field
---@meta OS_Time

---
---
---
---[View Documentation](https://www.lua.org/manual/5.2/manual.html#6.9)
---
---@class oslib
os = {}

---
---Returns an approximation of the amount in seconds of CPU time used by the program.
---
---@return number
---@nodiscard
function os.clock() end

---@class osdate
---
---four digits
---
---@field year  integer|string
---
---1-12
---
---@field month integer|string
---
---1-31
---
---@field day   integer|string
---
---0-23
---
---@field hour  integer|string
---
---0-59
---
---@field min   integer|string
---
---0-61
---
---@field sec   integer|string
---
---weekday, 1–7, Sunday is 1
---
---@field wday  integer|string
---
---day of the year, 1–366
---
---@field yday  integer|string
---
---daylight saving flag, a boolean
---
---@field isdst boolean

---
---Returns a string or a table containing date and time, formatted according to the given string `format`.
---
---@param format? string
---@param time?   integer
---@return string|osdate
---@nodiscard
function os.date(format, time) end

---
---Returns the difference, in seconds, from time `t1` to time `t2`.
---
---@param t2 integer
---@param t1 integer
---@return integer
---@nodiscard
function os.difftime(t2, t1) end

---@class osdateparam
---
---four digits
---
---
---@field year  integer|string
---
---1-12
---
---
---@field month integer|string
---
---1-31
---
---
---@field day   integer|string
---
---0-23
---
---
---@field hour  (integer|string)?
---
---0-59
---
---
---@field min   (integer|string)?
---
---0-61
---
---
---@field sec   (integer|string)?
---
---weekday, 1–7, Sunday is 1
---
---
---@field wday  (integer|string)?
---
---day of the year, 1–366
---
---
---@field yday  (integer|string)?
---
---daylight saving flag, a boolean
---
---
---@field isdst boolean?

---
---Returns the current time when called without arguments, or a time representing the local date and time specified by the given table.
---
---@param date? osdateparam
---@return integer
---@nodiscard
function os.time(date) end

return os