# Exercise 2
function mincoinsgreedy(coins, value)
    # Coins: a list of available coins
    # Value: a value composed by as few coins as possible

    usedCoins = 0
    remaining = value

    for i = 1:length(coins)
        while ((remaining >= coins[i]) && ((remaining - coins[i]) >= 0))
            remaining -= coins[i]
            usedCoins += 1

            # no need to continue looping if amount already reached
            if (remaining == 0)
                break
            end
        end

    end
    return usedCoins
end


mincoinsgreedy([1000,500,100,20,5,1],8)


