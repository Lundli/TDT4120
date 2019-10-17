# Helper function from exercise 1
function usegreed(coins)
    # loop from second coin to last
    flag = true

    for i = 2:length(coins)
        if ((coins[i-1] % coins[i]) != 0)
            flag = false
        end
    end
    return flag
end

# Helper function from exercise 2
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

#--------------------------------------------#



# Exercise 3
function mincoins(coins, value)
    inf = typemax(Int)


	# If value is zero: zero coins needed
    if (value == 0)
        return 0
    end


	# If greedy approach works: return result of greedy algorithm
	if (usegreed(coins))
		minCoins = mincoinsgreedy(coins, value)
		return minCoins
	end



    # Try each coin lower than Value
    for i = 1:length(coins)
        if (coins[i] <= value)

    		# recursive call
            req = mincoins(coins, value-coins[i])

            if (req != inf) && (req + 1 < inf)
                inf = req + 1
            end
        end
    end

	# return minimum amount of coins needed
    return inf
end



println("--------------- Tests start -----------------------------\n\n")
using Test
@testset "Tests" begin
  @test mincoins([4,3,1],18) == 5
  @test mincoins([1000,500,100,30,7,1],14) == 2
  @test mincoins([40, 30, 20, 10, 1], 90) == 3
end

println("---------------------------------------------------------\n\n")