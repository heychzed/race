--[[
types v1.0

types.lua: custom types & shorthands for race


changelog:
- added race.types

]]

local types = {}


types.empty = function()
    --[[
        Example of a simple empty data type. Data types in race may include functions, constants,
        mutable variables, arrays etc.

        Common methods:
        toString -> returns the type's data represented as a string.
        main -> ran on init of all race.lua

    ]]

    local return_tbl = {}

    return_tbl.empty_function = function()
    
    end

    return_tbl.to_string = function()
        return "null"
    end

    return_tbl.main = function()
        print("[ types.lua ] Function empty_function's main method ran.")
    end


    return_tbl.data = 0

    return return_tbl
end

types.lighting_preset = function()
    --[[
        Lighting preset to get, set and express a list of common lighting data for Roblox.

    ]]

    local return_tbl = {}

    return_tbl.default = {}

    default.Brightness = 2
    default.Ambient = Color3.new(200, 200, 200)    
    default.OutdoorAmbient = Color3.new(200, 200, 200)
    default.ExposureCompensation = 0.25 
    


    return_tbl.main = function()
        local lighting = game.Lighting

        default.Brightness = lighting.Brightness
        default.Ambient = lighting.Ambient
        default.OutdoorAmbient = lighting.OutdoorAmbient
        default.ExposureCompensation = lighting.ExposureCompensation
            
    end



    return_tbl.to_string = function()
        return table.concat(return_tbl.default)
    end

    return return_tbl
end



return types