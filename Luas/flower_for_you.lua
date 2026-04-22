function onBegin()
    disableMovement()
    player.Speed = vector2(0,0)
    player.Facing = getEnum("Celeste.Facings", "Right")
    say("tmszzzzz_WhereMoonlightFalls_LastScene4Dialog_true_end")
    enableMovement()
    endCutscene()
end

function onEnd(room, wasSkipped)
    -- 如果过场被跳过，也要保证最终状态成立
    if wasSkipped then
        setFlag("give_flower", true)
    end
    enableMovement()
end