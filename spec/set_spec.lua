local Set = require("set")

describe("Set", function ()
    randomize()

    local subject

    before_each(function ()
        subject = Set()
    end)

    describe("#add", function ()
        it("adds a new value to the set", function ()
            subject:add("almafa")
            assert.is_true(subject:contains("almafa"))
        end)
    end)

    describe("#remove", function ()
        it("should remove an already existing element from the set", function ()
            subject:add("almafa")
            subject:remove("almafa")
            assert.is_false(subject:contains("almafa"))
        end)
    end)

    describe("#values", function ()
        it("should return an empty table if no elements were added", function ()
            assert.are.same({}, subject:elements())
        end)

        it("should return all values from in the set", function ()
            subject:add("almafa")
            subject:add("kortefa")

            expected_elements = {"almafa", "kortefa"}
            actual_elements = subject:elements()

            table.sort(expected_elements)
            table.sort(actual_elements)

            assert.are.same(expected_elements, actual_elements)
        end)
    end)

    describe("#union", function ()
        it("should merge the elements of two sets", function ()
            local lhs = Set({"almafa", "kortefa"})
            local rhs = Set({"szilvafa"})

            local result = lhs:union(rhs)

            local actual_elements = result:elements()
            local expected_elements = {"almafa", "kortefa", "szilvafa"}

            table.sort(actual_elements)
            table.sort(expected_elements)

            assert.are.same(expected_elements, actual_elements)
        end)

        it("should not alter the operand's elements", function ()
            local lhs = Set({"almafa"})
            local rhs = Set({"kortefa"})

            lhs:union(rhs)

            assert.are.same({"almafa"}, lhs:elements())
            assert.are.same({"kortefa"}, rhs:elements())
        end)

        it("should raise an error if operand is not a set", function ()
            assert.has.errors(function ()
                subject:union("I'm not a set")
            end)
        end)
    end)

    describe("#intersect", function ()
        it("should intersect the elements of two sets", function ()
            local lhs = Set({"almafa", "kortefa"})
            local rhs = Set({"szilvafa", "almafa"})

            local result = lhs:intersect(rhs)

            local actual_elements = result:elements()
            local expected_elements = {"almafa"}

            assert.are.same(expected_elements, actual_elements)
        end)

        it("should not alter the operand's elements", function ()
            local lhs = Set({"almafa"})
            local rhs = Set({"kortefa"})

            lhs:intersect(rhs)

            assert.are.same({"almafa"}, lhs:elements())
            assert.are.same({"kortefa"}, rhs:elements())
        end)

        it("should raise an error if operand is not a set", function ()
            assert.has.errors(function ()
                subject:intersect("I'm not a set")
            end)
        end)
    end)
end)
