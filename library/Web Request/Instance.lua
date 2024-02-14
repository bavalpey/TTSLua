---@meta WebRequest.Instance

---Web request instances reprsent a singular in-progress, completed or failed web request. They are created via the
---[Web Request Manager]. https://api.tabletopsimulator.com/webrequest/manager/
---@see WebRequest
---@class WebRequestInstance: userdata
---@field download_progress float Download percentage, represented as a number in the range 0-1.
---Reason why the request failed to complete.
---
---If the server responds with a
---[HTTP status code](https://api.tabletopsimulator.com/webrequest/instance/#response_code) that represents a HTTP
---error (4xx/5xx), this is *not* considered a request error.
---@field error string
---If the request failed due to an [error](https://api.tabletopsimulator.com/webrequest/instance/#error).
---@field is_error bool
---If the request completed or *failed*. If the request failed,
---[is_error](https://api.tabletopsimulator.com/webrequest/instance/#is_error) will be set.
---@field is_done bool
---@field text string Response body.
---@field upload_progress float Upload percentage, represented as a number from 0-1.
---@field url string The request's target URL. If the request was redirected, this will still return the initial URL.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/webrequest/instance/)
---
local WebRequestInstance = {}

---**Web reqeusts are automatically disposed of after a request completes/fails.**
---
---You may call this method to *try* to abort a request and dispose of it early.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/webrequest/instance/#dispose)
function WebRequestInstance.dispose() end

---Returns the value of the specified respones header, or `nil` if no such header exists.
---@param name string
---@return string|nil
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/webrequest/instance/#getresponseheader)
function WebRequestInstance.getResponseHeader(name) end

---Returns the table of response headers. Keys and values are both `string`.
---@return {[string]: string} # The table of response headers.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/webrequest/instance/#getresponseheaders)
function WebRequestInstance.getResponseHeaders() end
