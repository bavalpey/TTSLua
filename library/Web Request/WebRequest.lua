---@meta WebRequest

---# Web Request Manager

---`WebRequest` is a static global class that allows you to send HTTP requests from the game host's computer only.
---
--->### ✏️ Note
---> This is an advanced feature that allows you to send and receive data to/from web services. You could, for example,
--->provide a companion web server for your game which has a persistent database.
---
---@class WebRequest
WebRequest = {}

---Performs a HTTP request using the specified method, data, and headers.
---@param url string the URL.
---@param method string The [HTTP method](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods).
---@param download bool Whether you want to handle the response body. Must be `true` if you intend to read the response [text](https://api.tabletopsimulator.com/webrequest/instance/#text).
---@param headers {[string]: string} Table of request headers.
---@param callback_function? fun(request: WebRequestInstance) The function to call when the request completes or fails. *Optional, but you will be unable to handle the response (or errors) if unused.*
---@return WebRequestInstance
---
---***
---### Example Usage
---We're going to make an (intentionally invalid) attempt to use Github's APIs to create a Github issue.
---
---We'll include a JSON request body and some request headers. Once the request completes, we're going to inspect the
---response headers, decode the response, and finally print the reason why our request was denied by Github.
---```
---local headers = {
---    -- Github's APIs require an Authorization header
---    Authorization = "token 5199831f4dd3b79e7c5b7e0ebe75d67aa66e79d4",
---    -- We're sending a JSON body in the request
---    ["Content-Type"] = "application/json",
---    -- We're expecting a JSON body in the response
---    Accept = "application/json",
---}
---
----- Some JSON data (that represents a new Github issue).
----- See: https://docs.github.com/en/rest/guides/getting-started-with-the-rest-api#creating-an-issue
---local data = {
---    title = "New logo",
---    body = "We should have one",
---    labels = {"design"}
---}
---
----- Encode the data as JSON, so we can send it in our request body.
---local body = JSON.encode(data)
---
----- Our request is targeting the Berserk Games API docs Github repository's issues endpoint.
---local url = "https://api.github.com/repos/Berserk-Games/Tabletop-Simulator-API/issues"
---
----- Perform the request
---WebRequest.custom(url, "POST", true, body, headers, function(request)
---    -- Check if the request failed to complete e.g. if your Internet connection dropped out.
---    if request.is_error then
---        print("Request failed: " .. request.error)
---        return
---    end
---
---    -- Check that Github responded with JSON
---    local contentType = request.getResponseHeader("Content-Type") or ""
---    if contentType ~= "application/json" and not contentType:match("^application/json;") then
---        -- We're expecting a JSON response only, if we get something else we'll print an error
---        print("Uh oh! Github sent us something we didn't expect.")
---        print("Content-Type: " .. contentType)
---        return
---    end
---
---    print("Request denied with status code: " .. request.response_code)
---
---    -- Decode the JSON response body
---    local responseData = JSON.decode(request.text)
---
---    -- When Github denies a request, they include a "message" field in the JSON body to explain. Let's print it.
---    print("Reason: " .. responseData.message)
---end)
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/webrequest/#custom)
---
function WebRequest.custom(url, method, download, data, headers, callback_function) end

---Performs a HTTP DELETE request.
---@param url string The URL
---@param callback_function? fun(request: WebRequestInstance) The function to call when the request completes (or fails). *Optional, but you will be unable to handle the response (or errors) if unused.*
---@return WebRequestInstance
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/webrequest/#delete)
---
function WebRequest.delete(url, callback_function) end

---Performs a HTTP GET request.
---@param url string The URL.
---@param callback_function? fun(request: WebRequestInstance) The function to call when the request completes (or fails). *Optional, but you will be unable to handle the response (or errors) if unused.*
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/webrequest/#get)
---
function WebRequest.get(url, callback_function) end

---Performs a HTTP HEAD request.
---@param url string The URL.
---@param callback_function? fun(request: WebRequestInstance) The function to call when the request completes or fails. *Optional, but you will be unable to handle the response (or errors) if unused.*
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/webrequest/#head)
---
function WebRequest.head(url, callback_function) end

---Performs a HTTP POST request, sending the specified data. Returns a
---[Web Request Instance](https://api.tabletopsimulator.com/webrequest/instance/).
---
---The form will be sent as the body of the request (`Content-type: application/x-www-form-urlencoded`).
---@param url string The URL.
---@param form string|{[string]: string} The form to post.
---@param callback_function? fun(request: WebRequestInstance) The function to call when the request completes or fails. *Optional, but you will be unable to handle the response (or errors) if unused.*
---@return WebRequestInstance
---
---🔥 When `form` is provided as a `table`, the data will be URL encoded for you. The table keys and values must both be `string`.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/webrequest/#post)
---
function WebRequest.post(url, form, callback_function) end

---Performs a HTTP PUT request, sending the specified data. Returns a
---[Web Request Instance](https://api.tabletopsimulator.com/webrequest/instance/).
---
---The data will be UTF-8 encoded and sent as binary data in the body of the request (`Content-type: application/octet-stream`).
---@param url string The URL.
---@param data string The request body.
---@param callback_function? fun(request: WebRequestInstance) The function to call when the request completes (or fails). *Optional, but you will be unable to handle the response (or errors) if unused.*
---@return WebRequestInstance
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/webrequest/#put)
---
function WebRequest.put(url, data, callback_function) end

return WebRequest
