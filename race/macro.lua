--[[
macro v1.0

macro.lua: macro library, containing loops, maids, shorthands and macro computation


changelog:
- added race.macro

]]

local macro = {}
local race = require(script.Parent)

macro.about = race.about("macro", "loops, maids and shorthands with repeated tasks")

macro.do_for = function(table, func, whichisa)
    --[[
        An inpairs loop with optional parameters.

        'table' is an object or table representing an array of values to perform func() on or for.
        When table's type is an 'Instance', macro will use :GetDescendants. When table's type is an array,
        macro will loop through all indexes of the array.

        'func' is code to be ran for each index of table. The values 'i' and 'v' are passed through the function.
        Macro will not omit ( using _ ) an unused value.

        'whichisa' allows type discrimination in the loop. If not provided, macro will not type check.
        If provided, macro will only run the code when the type of the value V is matching to the string provided
        in 'whichisa'.

        Code is ran in protected call. 

    ]]

    local tbl = {}

    if type(table) == "Instance" then tbl = table:GetDescendants() else tbl = table end

    whichisa = wichisa or false

    for i, v in table do
        if whichisa and not v:IsA(whichisa) then return end

        success, result = pcall(func, i, v)

        if not success then
            error("[ macro.lua ] Error caught on index " .. i .. ". Error thrown: " .. result)
            if race.strict then break end
        end
    end
end

macro.do_repeat = function(amount, func, iterator, starting)
    --[[
        A generic for with optional parameters.

        'amount' describes the value of 'i' the loop will quit on, or rather ( in most cases ) how many 
        times the loop will run. This value must be provided.

        'func' describes the function which will run inside the for loop. The value 'i', for index, is provided
        to the function. Errors are caught. If 'i' is unused, macro will not omit ( using _ ).
        
        'iterator' describes what number is added to 'i' every time the loop runs. If the value is not provided, 
        macro will default to 1.

        'starting' describes what number 'i' starts as. If the value is not provided, macro will default
        to 1.
    ]]

    iterator = iterator or 1
    starting = starting or 1

    for i = starting, amount, i += iterator do
        success, result = pcall(func, i)

        if not success then
            error("[ macro.lua ] Error caught on index " .. i .. ". Error thrown: " .. result)
            if race.strict then break end
        end        
    end
end

macro.while = function(condition, func, delay, iterate)
    --[[
        A generic while with optional parameters.

        'condition' describes the codition needed for the loop to run, acting the same as 
        "while condition do" in base lua.

        'function' describes the code to run for each loop. 'i' is passed in as a parameter if 'iterate'
        is set to true.

        'delay' is an optional parameter representing a delay in seconds for each execution of the loop.
        When unset, delay takes the default value of 0.

        'iterate' is an optional parameter representing if macro should iterate a value 'i' on each
        execution of the loop, and pass it to the function.

    ]]


    delay = delay or 0
    iterate = iterate or false

    local i = 1

    while condition do
        task.wait(delay)

        success, result = pcall(func, i)

        if not success then
            error("[ macro.lua ] Error caught on while loop. Error thrown: " .. result)
            if race.strict then break end
        end          

        if iterate then i += 1 end
    end
end

return macro