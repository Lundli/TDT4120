mutable struct DisjointSetNode
    rank::Int
    p::DisjointSetNode
    DisjointSetNode() = (obj = new(0); obj.p = obj;)
end


# Exercise 1
function findset(x)
    if x != x.p
        x.p = findset(x.p)
    end
    return x.p
end
