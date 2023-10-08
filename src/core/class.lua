shep.class = {}
shep.class.__index = shep.class

function shep.class:new() end

function shep.class:derive(strClass)
    local class = {}

    class.type = strClass
    class.__index = class
    class.__call  = shep.class.__call
    class.super = self
    setmetatable(class, self)

    return class
end

function shep.class:is(class)
    local base = getmetatable(class)

    while base do
        if base == shep.class then return true end
        base = getmetatable(class)
    end

    return false
end

function shep.class:isType(strClass)
    local base = self

    while base do
        if base.type == strClass then return true end
        base = base.super
    end

    return false
end

function shep.class:__call(...)
    local instance = setmetatable({}, self)
    instance:new(...)
    return instance
end