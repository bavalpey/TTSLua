---@meta TTSLua

---@class (exact) float: number
---@class (exact) int: integer
---@class (exact) bool: boolean

---@type Object|Global
self = ...

---The contents of _MOONSHARP which exposes some members specific to moonsharp
---@class MoonsharpTable
---@field version string The version of the MoonSharp interpreter
---@field luacompat string The version of the Lua interpreter MoonSharp attempts to emulate
---@field platform string The name of the platform it is running on.
---@field is_aot boolean `true` if running on an AOT platform.
---@field is_unity boolean `true` if running inside Unity.
---@field ismono boolean `true` if running on Mono.
---@field is_clr4 boolean `true` if running on CLR4.
---@field is_pcl boolean `true` if running os a portable class library.
---@field banner string A banner similar to the one in the REPL interpreter.

_MOONSHARP = {
	version = "2.0.0.0",
	platform = "limited.unity.dll.mono.clr4",
	is_aot = false,
	is_unity = true,
	is_clr4 = true,
	is_pcl = false,
	banner = "MoonSharp 2.0.0.0 [limited.unity.dll.mono.clr4]\\nCopyright (C) 2014-2016 Marco Mastropaolo\\nhttp://www.moonsharp.org\n",
}
