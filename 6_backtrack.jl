# Exercise 4

function backtrack(pathweights)
    rows, cols = size(pathweights)
    Path = []

    a = pathweights'

    line = a[1:cols, rows]
    step = argmin(line)
    push!(Path, (rows, step))


    for i = (rows-1):-1:1
        line = a[1:cols, i]
        best = 1000

        # left
        if (step != 1)
            if (line[step-1] < best)
                best = line[step-1]
                temp = step-1
            end
        end

        # middle
        if (line[step] < best)
            best = line[step]
            temp = step
        end

        # right
        if (step != cols)
            if (line[step+1] < best)
                best = line[step+1]
                temp = step+1
            end
        end

        step = temp
        push!(Path, (i, step))
    end
    return Path
end



pathweights = [3  6  8  6  3
                          10 9  11 10 6
                          13 19 13 7  12
                          23 17 10 8  9
                          23 11 15 11 17]
backtrack(pathweights)
Path = []




printstyled("\n\n\n---------------\nTests\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test backtrack([1 1 ; 2 2]) == [(2,1),(1,1)]
	@test backtrack([3  6  8  6  3; 10 9  11 10 6; 13 19 13 7  12; 23 17 10 8  9; 23 11 15 11 17]) == [(5,2), (4,3), (3,4), (2,5), (1,5)]
end

println("---------------------------------------------------------\n\n")
