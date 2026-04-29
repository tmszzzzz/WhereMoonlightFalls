local SpotlightWipe = require("#Celeste.SpotlightWipe")

function onTalk()
    makeUnskippable()
    disableMovement()

    player.ForceCameraUpdate = true

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

    -- 这里换成你的目标房间 / 目标坐标
    instantTeleportTo(-1510, 1104, "T1")

    endCutscene()
end