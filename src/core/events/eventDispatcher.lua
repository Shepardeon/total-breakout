shep.events.dispatcher = shep.class:derive("EventDispatcher")

function shep.events.dispatcher:new()
    self.events = {}
end

function shep.events.dispatcher:add(eventName)
    assert(type(eventName) == "string")
    assert(self.events[eventName] == nil)
    self.events[eventName] = {}
end

function shep.events.dispatcher:remove(eventName)
    self.events[eventName] = nil
end

function shep.events.dispatcher:hook(eventName, callback, replace)
    assert(self.events[eventName] ~= nil)
    assert(type(callback) == "function")
    replace = replace or false

    if replace then
        self.events[eventName] = callback
    else
        table.insert(self.events, callback)
    end
end

function shep.events.dispatcher:unhook(eventName, callback)
    assert(self.events[eventName] ~= nil)
    assert(type(callback) == "function")

    local i = table.indexOf(self.events[eventName], callback)

    if i > -1 then
        table.remove(self.events[eventName], pos)
    end
end

function shep.events.dispatcher:clear(eventName)
    if eventName == nil then
        self.events = {}
    else
        self.events[eventName] = {}
    end
end

function shep.events.dispatcher:fire(eventName, ...)
    local cbs = self.events[eventName]
    if cbs == nil then return end

    for i = 1, #cbs do
        cbs[i](...)
    end
end

shep.events.dispatcher.Global = shep.events.dispatcher()