local calc = require("#Monocle.Calc")
local color = require("#Microsoft.Xna.Framework.Color")

function onBegin()
    disableMovement()
    player.ForceCameraUpdate = true
    getLevel():Flash(color.White)
    player.Speed = vector2(0,0)
    instantTeleportTo(-2532, 598, "R4-TE1")
    playSound("event:/game/04_cliffside/gondola_scaryhair_01")
    player.ForceCameraUpdate = false
    enableMovement()
    endCutscene()
end

function onEnd(room, wasSkipped)
    -- 如果过场被跳过，也要保证最终状态成立
    if wasSkipped then
    end
    setFlag("true_ending", false)

    --player.ForceCameraUpdate = false
    enableMovement()
end