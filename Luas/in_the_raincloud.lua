-- 1格 = 8像素
local TILE = 8

function onBegin()
    disableMovement()

    -- 让镜头在 Dummy 状态下继续按正常逻辑更新
    player.ForceCameraUpdate = true

    -- 等 Madeline 落地
    waitUntilOnGround()
    wait(1)

    -- 向左走 5 格
    walk(-5 * TILE)
    wait(1)

    -- 向右走 10 格
    walk(10 * TILE)
    wait(1)

    -- 向左走 5 格，回到原地
    walk(-5 * TILE)
    wait(1)

    -- 由你的 helper 在这段对话里负责召唤 / 控制 Badeline
    say("tmszzzzz_WhereMoonlightFalls_InTheRaincloudDialog")

    -- 激活 flag
    setFlag("go_up", true)

    -- 恢复控制
    player.ForceCameraUpdate = false
    enableMovement()
end

function onEnd(room, wasSkipped)
    -- 如果过场被跳过，也要保证最终状态成立
    if wasSkipped then
        setFlag("go_up", true)
    end

    player.ForceCameraUpdate = false
    enableMovement()
end