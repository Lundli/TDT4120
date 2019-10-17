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
#--------------------------------------------#



# Exercise 3
function mincoins(coins, value)
    inf = typemax(Int)


	# If value is zero
    if (value == 0)
        return 0
    end


	# If greedy approach works
	if (usegreed(coins))
		minCoins = usegreed(coins)
		return minCoins
	end


    # Try each coin lower than Value

    for i = 1:length(coins)
        if (coins[i] <= value)

    		# recursive call
            sub_res = mincoins(coins, value-coins[i])

            # Check for INT_MAX to avoid overflow and see if
            # result can minimized
            if (sub_res != inf && sub_res + 1 < inf)
                inf = sub_res + 1
            end
        end
    end

    return inf
end




using Test
@testset "Tester" begin
	@test mincoins([4,3,1],18) == 5
  @test mincoins([1000,500,100,30,7,1],14) == 2
  @test mincoins([40, 30, 20, 10, 1], 90) == 3
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")