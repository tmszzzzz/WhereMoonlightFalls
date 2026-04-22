local calc = require("#Monocle.Calc")
local color = require("#Microsoft.Xna.Framework.Color")

function onBegin()
    makeUnskippable()
    disableRetry()
    disableMovement()
    player.ForceCameraUpdate = true
    player.Speed = vector2(0,0)
    player.Facing = getEnum("Celeste.Facings", "Right")
    
    setFlag("true_ending", true)
    wait(2.5)
    say("tmszzzzz_WhereMoonlightFalls_LastScene5Dialog_true_end")
    
    local level = getLevel()
    local doneFlag = "my_book_closed"
    level.Session:SetFlag(doneFlag, false)

    local book = celeste.Mod.ShroomHelper.Entities.ShroomBook(
        player,
        "WhereMoonlightFalls/te_flower",
        doneFlag,
        false
    )

    level:Add(book)

    while not level.Session:GetFlag(doneFlag) do
        coroutine.yield()
    end

    say("tmszzzzz_WhereMoonlightFalls_LastScene6Dialog_true_end")
    
    wait(1)
    setFlag("showblackfg", true)
    wait(3)
    player.ForceCameraUpdate = false
    enableMovement()
    enableRetry()
    endCutscene()
    instantTeleportTo(16208, -17048, "R4-TE2")
end

function onEnd(room, wasSkipped)
    enableRetry()
    player.ForceCameraUpdate = false
    enableMovement()
    -- 如果过场被跳过，也要保证最终状态成立
    if wasSkipped then
        instantTeleportTo(16208, -17048, "R4-TE2")
    end
end