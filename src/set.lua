local Object = require("classic")

local Set = Object:extend()

function Set:new(values)
    self.values = {}

    local initial_values = values or {}

    for i = 1, #initial_values do
        self.values[initial_values[i]] = true
    end
end

function Set:contains(value)
    return self.values[value] == true
end

function Set:add(value)
    self.values[value] = true
end

function Set:remove(value)
    self.values[value] = nil
end

function Set:elements()
    local result = {}

    for key, _ in pairs(self.values) do
        table.insert(result, key)
    end

    return result
end

local is_not_a_set = function (object)
    return type(object) ~= "table" or not object:is(Set)
end

local ensure_operand_is_a_set = function (object)
    if is_not_a_set(object) then
        error("Both operands should be sets")
    end
end

function Set:union(other)
    ensure_operand_is_a_set(other)

    local result = Set(self:elements())

    for _, value in pairs(other:elements()) do
        result:add(value)
    end

    return result
end

function Set:intersect(other)
    ensure_operand_is_a_set(other)

    local result = Set()

    for _, value in pairs(self:elements()) do
        if other:contains(value) then
            result:add(value)
        end
    end

    return result
end

return Set
