# Lua Data Types

While working on some pet-projects of mine, I've realized, that there are no out-of-the box implementations of certain basic data types (e.g. sets).

Lua tables basically provide all these desired features, yet their readability could be improved. Using data types does not always provide a shorter but (in my opinion) almost always provides a more readable code.

Adding an element to a set in "pure" Lua:

```lua
local some_element = "I should be included"
local my_set = {}

my_set[some_element] = true

if my_set[some_element] then
    -- some useful functionality
end
```

Adding an element to a set using data types:

```lua
local some_element = "I should be included"
local my_set = Set()

my_set:add(some_element)

if my_set:contains(some_element) then
    -- some useful functionality
end
```

I'll be adding the basic data types incrementally, as they're needed in my projects.

If they seem to be useful for you please feel free to fork the project and/or add additional functionalities via pull requests.

## Setup development environment and run tests

### Build development image from Dockerfile

```
docker-compose build --no-cache
```

### Run tests

```
docker-compose up
```
