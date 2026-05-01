function onTalk()
    disableMovement()
    player.ForceCameraUpdate = true
    player.Speed = vector2(0,0)
    walkTo(12872)
    player.Facing = getEnum("Celeste.Facings", "Right")
    if getFlag("true_end") then
        say("tmszzzzz_WhereMoonlightFalls_AfterFlowerDialog")
    else
        say("tmszzzzz_WhereMoonlightFalls_TakeFlowerDialog")
    end
    player.ForceCameraUpdate = false
    enableMovement()
    endCutscene()
end

function onEnd(room, wasSkipped)
    -- 如果过场被跳过，也要保证最终状态成立
    if wasSkipped then
        setFlag("true_end", true)
    end
    player.ForceCameraUpdate = false
    enableMovement()
end