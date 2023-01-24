--[[
    tween v1.0

    tween.lua: easy tweening


    changelog:
    -   added race.tween

]]

local rtween = {}

rtween.presets = {}
rtween.presets.default = TweenInfo.new(  )

rtween.simple_tween = function(tweenData, preset, time)
    local tween = TweenService.create(tweenData, preset)

    tween:Play()
end

return rtween