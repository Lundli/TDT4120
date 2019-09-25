# Exercise 1: Merge Sort

# x og y er to sorterte tabeller, coordinate angir koordinat
function __mergearrays(x,y)
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
function __mergesort(x)
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


#A = mergesort(array)
#println(A)

A = [1 2; 2 5; 6 3; 8 7]
B = [2 3; 4 4; 5 1; 6 4]


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


C = [1 2; 2 2]
D = [2 1; 3 3]

#println(mergearrays(C, D, 2))



# x er en usortert tabell, coordinate angir koordinat vi skal sortere langs
function mergesort(x, coordinate)
    println("List: ", x)
    xLength = Int(length(x)/2)
    println("xLength: ", xLength)

    if (xLength <= 1)
        return x
    elseif (xLength > 1)
        middle = xLength ÷ 2
        println(middle)

        ##### THIS COPYING GOES WRONG; DOESNT COPY IN 2D ###
        Left = x[1:middle]
        Right = x[middle+1: xLength]
        ####################################################
        
        println("Left: " , Left)
        println("Right: ", Right)
    end


end

RESULT = mergesort([1 2; 4 6; 2 1; 3 5],1)
#println(RESULT)