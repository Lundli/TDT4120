# Exercise 2

function lis(s, mls)
    ml = maximum(mls)
    lis = zeros(Int, ml)

    for i = length(mls):-1:1

        if mls[i] == ml
            index = length(lis)

            for j = i:-1:i-ml+1
                lis[index] = s[j]
                index -= 1
            end
            break

        end
    end
    println(lis)
    return lis
end


s =  [5,3,3,6,7,8, 19]
mls = [1,1,1,2,3,4, 5]

println(s)
println(mls)

lis(s, mls)
