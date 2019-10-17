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


### Tests ###
printstyled("\n\n\n---------------\nTests\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test usegreed([20, 10, 5, 1]) == true
  @test usegreed([20, 15, 10, 5, 1]) == false
  @test usegreed([100, 1]) == true
  @test usegreed([5, 4, 3, 2, 1]) == false
  @test usegreed([1]) == true

end

println("---------------------------------------------------------\n\n")
