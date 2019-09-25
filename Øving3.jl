# Exercise 1: Merge Sort

# x og y er to sorterte tabeller, coordinate angir koordinat
function mergearrays(x,y)
    i = j = k = 1
    xLength = Int(length(x)) #/2
    yLength = Int(length(y)) #/2
    newList = []

    while (i <= xLength) | (j <= yLength)

        if (i > xLength)
            append!(newList, y[j])
            j += 1
            k += 1
        elseif (j > yLength)
            append!(newList, x[i])
            i += 1
            k += 1

        elseif x[i] <= y[j]
            append!(newList, x[i])
            i += 1
            k += 1

        elseif x[i] > y[j]
            append!(newList, y[j])
            j += 1
            k += 1
        end
    end
    return newList
end


#T = mergearrays(A,B)
#println(T)



array = [2, 1, 3, 4, 5, 6, 8, 1]

# x er en usortert tabell, coordinate angir koordinat vi skal sortere langs
function mergesort(x)
    if (length(x) <= 1)
        return x

    elseif (length(x) > 1)

        middle = length(x) ÷ 2

        Left = x[1 : middle]
        Right = x[middle + 1: length(x)]


        left = mergesort(Left)
        right = mergesort(Right)

        result = mergearrays(left, right)
        return result

    end


end


