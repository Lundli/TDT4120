# Exercise 1

function usegreed(coins)
    # loop from second coin to last
    flag = true

    for i = 2:length(coins)
        println(coins[i])
        if ((coins[i-1] % coins[i]) != 0)
            flag = false
        end
    end
    return flag
end