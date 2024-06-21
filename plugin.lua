local guide     = require 'parser.guide'
local vm        = require 'vm'
local astHelper = require 'plugins.astHelper'
local inspect   = require 'inspect'
local luadoc    = require 'parser.luadoc'

---Add parameters to events...


-- UTILITY FUNCTIONS

---Check if the file uri is global.
---@param uri any
---@return unknown
function isGlobalUri(uri)
    return uri:match('^%-1%.Global%.lua$')
end

---@class (exact) EVENT_DOC
---The documentation string for the event handler. Each element is a line of the documentation prepended with a '-'.
---The last element specifies the type of the event handler, with all parameters marked as optional.
---This is because it valid to define an event handler that ignores some of the parameters.
---Including this also provides diagnostics when the event handler is given extra arguments.
---@field docstring string[]
---@field params string[] The docstring for the parameter types for the event handler, with a %s format specifier as a placeholder for the parameter name.
---@field returns? string[] If the event handler returns a value, this is the docstring for the return value.

---@type table<string, EVENT_DOC>
local UNIVERSAL_EVENT_HANDLERS = {
    onBlindfold = {
        docstring = { '-Called when a player puts on or takes off their blindfold.', '-',
            '-### Example Usage',
            '-Print a message indicating which player put on or took off their blindfold.',
            '-```',
            '-function onBlindfold(player, blindfolded)',
            '-    if blindfolded then',
            '-        print(player.color .. " put their blindfold on.")',
            '-    else',
            '-        print(player.color .. " took their blindfold off.")',
            '-    end',
            '-end',
            '-```',
            '-',
            '-***',
            '-',
            '-[Open Documentation](https://api.tabletopsimulator.com/events/#onblindfold)',
            '-@type fun(player?: PlayerInstance, blindfolded?: bool):boolean?',
        },
        params = { '-@param %s PlayerInstance Player who put on or took off their blindfold.',
            '-@param %s boolean Whether the player is now blindfolded.' },
    },
    onChat = {
        docstring = { '-Called when a player sends a chat message.', '-',
            'Return `false` to prevent the message from appearing in the chat window.',
            '-### Example Usage',
            '-Print a message indicating which player sent a chat message.',
            '-```',
            '-function onChat(message, sender)',
            '-    if sender.color == "Blue" then',
            '-        print("Blue said: " .. message)',
            '-        return false',
            '-    end',
            '-',
            '-    return true',
            '-end',
            '-```',
            '-',
            '-***',
            '-',
            '-[Open Documentation](https://api.tabletopsimulator.com/events/#onchat),',
            '-@type fun(message: string, sender: PlayerInstance):boolean?',
        },
        params = { '-@param %s string Chat message which triggered the function.',
            '-@param %s PlayerInstance Player which sent the chat message.' }
    },
}

local function prependLuaDoc(ast, node, pos, text, type)
    return luadoc.buildAndBindDoc(ast, node, {
        type    = type == nil and 'comment.short' or type,
        start   = pos,
        finish  = pos,
        text    = text,
        virtual = true
    })
end


---Adds documentation to the event handler.
---@param ast parser.object
---@param node parser.object
local function addEventDoc(ast, node)
    ---@type EVENT_DOC?
    local doc = UNIVERSAL_EVENT_HANDLERS[node[1]]
    if doc then
        -- build the pre-param docs
        local lastfinish = node.start
        for _, docpart in ipairs(doc.docstring) do
            prependLuaDoc(ast, node, lastfinish + 1, docpart, 'comment.short')
            lastfinish = lastfinish + docpart:len()
        end
        -- Iterate through defined parameters, and build args.
        for index, value in ipairs(guide.getParams(node.value) or {}) do
            -- Stop if there are no parameters defined in the doc.
            local paramString = doc.params[index]
            if not paramString then
                break
            end
            paramString = paramString:format(guide.getKeyName(value))
            --guide.getKeyName(value) gets the name of the parameter, which is then formatted into the doc string.
            prependLuaDoc(ast, node, lastfinish + 1, paramString, 'comment.short')
            lastfinish = lastfinish + paramString:len()
        end
    end
end

local function isEventHandler(name, scope)
    return UNIVERSAL_EVENT_HANDLERS[name] ~= nil
end

--TODO: Add check for where event handler is defined... Local or global...

---@param ast   parser.object # The file ast
---@param scope? 'global' | 'local' # The scope of the event handler
local function AnnotateEvent(ast, scope)
    guide.eachSourceType(ast, 'setglobal', function(node)
        if node.value and node.value.type == 'function' and isEventHandler(node[1], scope) then
            addEventDoc(ast, node)
        end
    end
    )
end


---@param  uri  string # The uri of file
---@param  ast  parser.object # The file ast
---@return parser.object|nil ast
function OnTransformAst(uri, ast)
    if uri:match('main.lua$') then
        AnnotateEvent(ast)
    end
    -- annotateEvent(uri, ast)
end
