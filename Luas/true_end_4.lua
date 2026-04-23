local calc = require("#Monocle.Calc")
local color = require("#Microsoft.Xna.Framework.Color")

function onBegin()
    disableMovement()
    player.ForceCameraUpdate = true
    wait(3)
    setFlag("showblackfg", false)
    player.Speed = vector2(0,0)
    player.Facing = getEnum("Celeste.Facings", "Right")
    player.ForceCameraUpdate = false
    enableMovement()
    endCutscene()
end

function onEnd(room, wasSkipped)
    
    player.ForceCameraUpdate = false
    enableMovement()
    -- 如果过场被跳过，也要保证最终状态成立
    if wasSkipped then
        setFlag("showblackfg", false)
    end

end