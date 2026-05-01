local SpotlightWipe = require("#Celeste.SpotlightWipe")

function onTalk()
    makeUnskippable()
    disableRetry()
    disableMovement()

    player.ForceCameraUpdate = true

    say("tmszzzzz_WhereMoonlightFalls_Gym_Dialog")
    local ch = choice("tmszzzzz_WhereMoonlightFalls_Gym_Go","tmszzzzz_WhereMoonlightFalls_Gym_GoCancel")

    if ch == 1 then

        local level = player.Scene

        -- DoorField: EnterRoutine
        player.StateMachine.State = 11
        player.DummyAutoAnimate = false
        player.Sprite:Play("lookUp")

        wait(0.8)

        SpotlightWipe.FocusPoint = player.Position - level.Camera.Position - vector2(0, 8)
        coroutine.yield(SpotlightWipe(level, false))

        -- DoorField: Teleport 里的延时
        wait(1.7)
        setFlag("tutshowblackfg", true)
        wait(1)
        setFlag("tutshowblackfg", false)
        player.ForceCameraUpdate = false
        enableMovement()
        enableRetry()

        -- 这里换成你的目标房间 / 目标坐标
        instantTeleportTo(-1510, 1104, "T1")

        endCutscene()
    else
        player.ForceCameraUpdate = false
        enableMovement()
        enableRetry()
        endCutscene()
    end
end