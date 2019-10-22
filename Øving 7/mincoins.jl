## Exercise 3

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



# Bottom up approach
function mincoins(coins, value)
   """
   Function takes in
        -an array of available coins, e.g. : [20, 10, 5, 1]
        -a value, positive integer
   Function will then return the miminum amount of coins needed to make change
    """

    # If value = 0 -> return 0
    if (value == 0)
        return 0
    end

    # If greedy approach works -> return usegreed()
    if (usegreed(coins))
		minCoins = mincoinsgreedy(coins, value)
		return minCoins
	end



    # Use bottom up approach
    max = value + 1;

    # Initialise list, first element 0 (because 0 coins needed to make change to a value of 0)
    arr = fill(max, max);
    arr[1] = 0;


    # solve for each value, starting with 1, ending 'value'
    for i = 2:max    # (max = value +1)
        # solve for each coin given
        for j = 1:length(coins)
            if (coins[j] <= i)
                arr[i] = min(arr[i], arr[i-coins[j] +1] +1);
            end

        end

    end

    println(arr);
end



mincoins([1,2,5],11)





# ------------------------------ Tests ------------------------------ #
printstyled("\n\n\n---------------\nTests\n---------------\n"; color = :magenta)

using Test
@testset "Tests" begin
	@test mincoins([4,3,1],18) == 5
  @test mincoins([1000,500,100,30,7,1],14) == 2
  @test mincoins([40, 30, 20, 10, 1], 90) == 3
end

println("---------------------------------------------------------\n\n")