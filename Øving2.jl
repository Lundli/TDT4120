# ---------- Code from exercise ---------- #

mutable struct Node
    next::Union{Node, Nothing} # next kan peke på et Node-objekt eller ha verdien nothing.
    value::Int
end

function createlinkedlist(length)
    # Creates the list starting from the last element
    # This is done so the last element we generate is the head
    child = nothing
    node = nothing

    for i in 1:length
        node = Node(child, rand(1:800))
        child = node
    end
    return node
end



# ---------- ---- Code end ----  ---------- #


# Exercise 1 - Traversere enkel liste
function findindexinlist(linkedlist, index)
    Node = linkedlist
    for i in 1:index
        if i == index
            return Node.value
        elseif Node.next == nothing
            return -1
        else
            Node = Node.next
        end
    end
end


#Exercise 2 - Stack





# Main function
function main()
    testList = createlinkedlist(5)
    println(testList)
    println(findindexinlist(testList, 5))
end



main()