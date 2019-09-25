# Exercise 1: Merge Sort


## Takes inn two two-dimensional arrays, x and y, as well as coordinate, either 1 or 2
function mergearrays(x,y,coordinate)
    xLength = Int(length(x)/2)
    yLength = Int(length(y)/2)
    total = xLength + yLength

    ## Initialise new list with total length of x + y
    newList = zeros(Int64, total, 2)

    i = j = k = 1

    while (i <= xLength) | (j <= yLength)

        ## if no more left in x, add leftovers from y
        if (i > xLength)
            newList[k,:] = y[j,:]
            j += 1
            k += 1
        elseif (j > yLength)
            newList[k,:] = x[i,:]
            i += 1
            k += 1
        elseif x[i, coordinate] <= y[j, coordinate]
            newList[k,:] = x[i,:]
            i += 1
            k += 1
        elseif x[i, coordinate] > y[j, coordinate]
            newList[k,:] = y[j,:]
            j += 1
            k += 1
        end
    end
    return newList
end

# x er en usortert tabell, coordinate angir koordinat vi skal sortere langs
function mergesort(x, coordinate)
    xLength = Int(length(x)/2)
    if (xLength <= 1)
        return x
    elseif (xLength > 1)
        middle = xLength ÷ 2

        Left = zeros(Int64, middle, 2)
        Right = zeros(Int64, xLength-middle, 2)


        ## LEFT
        for i = 1:middle
            Left[i, :] = x[i, :]
        end
        ## RIGHT
        i = 1
        for j = middle+1:xLength
            Right[i, :] = x[j, :]
            i += 1
        end


        left = mergesort(Left, coordinate)
        right = mergesort(Right, coordinate)

        result = mergearrays(left, right, coordinate)
        return result

    end

end