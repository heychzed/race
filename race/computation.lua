--[[
computation v1.1

computation.lua: simple functions which return a value for an input


changelog:
- added various distance calculation functions

]]

local computation = {}

computation.distance_1d = function(x, x2)
    return math.abs(x - x2)
end

computation.euclidian_dist_2d = function(point1, point2)
    local dist = computation.distance

    return math.sqrt( math.pow( dist(point1.X, point2.X), 2 ) + math.pow( dist(point1.Y, point2.Y), 2 )  )  
end

computation.euclidian_dist_3d = function(point1, point2)
    -- this is exact, what algorithms can replace this easily? 

    local dist = computation.distance

    return math.sqrt( math.pow( dist(point1.X, point2.X), 2 ) + math.pow( dist(point1.Y, point2.Y), 2 ) + math.pow( dist(point1.Z, point2.Z), 2 )  )  
end


return computation