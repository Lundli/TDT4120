function lis(s, mls)
    ml = maximum(mls)
    lis = zeros(Int, ml)

	# Initialise index, so that it can be set later
    index = -1

    for i = length(mls):-1:1
        if mls[i] == ml
            index = i
            #println("Index found: ", index)
            break
        end
    end

    # Put largest item at end of list, then decrease position by 1
    pos = length(lis)
    lis[pos] = s[index]
    pos -= 1

    # Loop through mls array
    # If item is 1 lower than that of last item, that is the next item
    last = index
    for i = (index-1):-1:1
        if mls[i]+1 == mls[last]
            last = i
            lis[pos] = s[i]
            pos -= 1
        end
    end

	# return lis-array (longest increasing subsequence)
    return lis
end



## ------------------------------ Test section ------------------------------ ##
printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test lis([5,3,3,6,7],[1, 1, 1, 2, 3]) == [3,6,7]
	@test lis([2,2,2,2],[1, 1, 1, 1]) == [2]
	@test lis([100,50,25,10],[1, 1, 1, 1]) == [10]
	@test lis([0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15],[1, 2, 2, 3, 2, 3, 3, 4, 2, 4, 3, 5, 3, 5, 4, 6]) == [0,2,6,9,11,15]
end

println("---------------------------------------------------------\n\n")