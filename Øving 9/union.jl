# Function from exercise 1
function findset(x)
    if x != x.p
        x.p = findset(x.p)
    end
    return x.p
end

# Exercise 2
function link(x, y)
    if (x.rank > y.rank)
        y.p = x
    else
        x.p = y
        if (x.rank == y.rank)
            y.rank = y.rank + 1
        end
    end
end


function union!(x, y)
    link(findset(x), findset(y))
end


