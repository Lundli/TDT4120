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
        ## if no more left in y, add leftovers from x
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



# Exercise 2: Binary search
function binaryintervalsearch(x, delta, coordinate)
    lower_index = -1
    upper_index = -1


    ## Find median
    ArrayLength = Int(length(x) / 2)
    if ((ArrayLength % 2) == 1)
        medianIndex = Int(((ArrayLength÷2)+1))
        median = x[medianIndex, coordinate]
    else
        m1 = Int(((ArrayLength÷2)))
        m2 = Int((ArrayLength÷2)+1)
        median = (x[m1, coordinate] + x[m2, coordinate]) / 2
    end


    min = median - delta
    max = median + delta


    for i = 1:ArrayLength
        if min <= x[i, coordinate] <= max
            if (lower_index == -1)
                lower_index = i
            end
        end

        if min <= x[i, coordinate] <= max
            upper_index = i
        end
    end
    return lower_index, upper_index
end


# Exercise 3: Brute force

function bruteforce(x)
    # Takes in a two dimensional array, ex: [1 1; 10 0; 2 2; 5 5]
    arrayLength = Int(length(x)/2)
    best = -1

    for i = 1: arrayLength
        for j = i+1:arrayLength

            X = x[i, 1] - x[j, 1]
            Y = x[i, 2] - x[j, 2]
            distance = X*X + Y*Y
            distance = sqrt(distance)

            if best == -1
                best = distance
            else
                if distance < best
                    best = distance
                end
            end
        end
    end

    return best
end


# Exercise 4: Split in two

function splitintwo(x,y)
    arrayLength = Int(length(x)/2)
    middle = arrayLength ÷ 2

    xLeft = zeros(middle, 2)
    xRight = zeros(arrayLength-middle, 2)

    for i = 1:middle
            xLeft[i, :] = x[i, :]
        end
    i = 1
    for j = middle+1:arrayLength
        xRight[i, :] = x[j, :]
    i += 1
    end

    yLeft = zeros(middle, 2)
    yRight = zeros(arrayLength-middle, 2)
    for i = 1:middle
            yLeft[i, :] = y[i, :]
        end
    i = 1
    for j = middle+1:arrayLength
        yRight[i, :] = y[j, :]
    i += 1
    end

    return xLeft, xRight, yLeft, yRight
end
