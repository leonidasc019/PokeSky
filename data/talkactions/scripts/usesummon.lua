function onSay(player, words, param)
    if player:isSummonBlocked() then return false end

    local index = tonumber(param)
    if not index then return false end

    local pokeballs = player:getPokeballsCached()
    local ball = pokeballs[index]
    if not ball then
        print("WARNING! Player " .. player:getName() .. " had problems trying to use pokebar: selected ball not found.")
        doSendPokeTeamByClient(player)
        return false
    end

    local usingBall = player:getUsingBall()
    if hasSummons(player) then
        if not usingBall then
            print("WARNING! Player " .. player:getName() .. " had problems trying to use pokebar: doRemoveSummon.")
            doSendPokeTeamByClient(player)
            return false
        end
        local usingBallKey = getBallKey(usingBall:getId())
        doRemoveSummon(player:getId(), balls[usingBallKey].effectRelease, false, true, balls[usingBallKey].missile)
        usingBall:transform(balls[usingBallKey].usedOn)
    end

    if ball ~= usingBall then
        if not player:canReleaseSummon(ball:getSummonLevel(), ball:getSummonBoost(), ball:getSummonOwner()) then return false end
        local ballKey = getBallKey(ball:getId())
        ball:transform(balls[ballKey].usedOff)
        ball:setSpecialAttribute("isBeingUsed", 1)
        doReleaseSummon(player:getId(), player:getPosition(), balls[ballKey].effectRelease, true, balls[ballKey].missile)
    end

    return false
end
