local calc = require("#Monocle.Calc")
local color = require("#Microsoft.Xna.Framework.Color")

function onBegin()
    disableMovement()
    player.ForceCameraUpdate = true
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
    player.ForceCameraUpdate = false
    enableMovement()
end

function onEnd(room, wasSkipped)
    -- 如果过场被跳过，也要保证最终状态成立
    if wasSkipped then
    end

    --player.ForceCameraUpdate = false
    enableMovement()
end