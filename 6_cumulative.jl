
# Exercise 3

function cumulative(weights)
    rows, cols = size(weights)

    # Initialise new array: deep copy
    array = zeros(Int, rows, cols)
    for row = 1:rows
        for col = 1:cols
            array[row, col] = weights[row, col]
        end
    end




end


weights = [3  6  8  6  3
                      7  6  5  7  3
                      4  10 4  1  6
                      10 4  3  1  2
                      6  1  7  3  9]


println(weights)
cumulative(weights)



#=
### Tests ###
printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test cumulative([1 1 ; 1 1]) == [1 1 ;2 2]
    #Dette er samme eksempel som det vist i oppgaveteskten
	@test cumulative([3  6  8 6 3; 7  6  5 7 3; 4  10 4 1 6; 10 4  3 1 2;6  1  7 3 9])== [3  6  8  6  3;10 9  11 10 6;13 19 13 7  12;23 17 10 8  9;23 11 15 11 17]
end

println("---------------------------------------------------------\n\n")
=#
