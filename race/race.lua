--[[
race v1.0

race.lua: main file, contains references and global race functions


changelog:
- added race.macro

]]

local race = {}

-- race.strict determines if code execution is halted on an error
race.strict = false
race.dev_mode = true

race.about = function(name, desc)
    local return_tbl = {}
    return_tbl.name = name
    return_tbl.desc = desc

    return return_tbl
end


return race
