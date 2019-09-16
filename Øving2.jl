# ---------- Code supplied for exercise 1 ---------- #

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

# Main function for exercise 1
function main1()
    testList = createlinkedlist(5)
    println(testList)
    println(findindexinlist(testList, 5))
end




#Exercise 2 - Stack
function reverseandlimit(array, maxnumber)
    A = reverse(array)
    for i in 1:length(A)
        if A[i] > maxnumber
            A[i] = maxnumber
        end
    end
    return A
end


# Main function for exercise 2
function main2()
    array = [10,5,16,0]
    println(array)

    array = reverseandlimit(array, 8)
    println(array)
end




# ---------- Code supplied for exercise 3 ---------- #

mutable struct NodeDoublyLinked
    prev::Union{NodeDoublyLinked, Nothing} # Er enten forrige node eller nothing
    next::Union{NodeDoublyLinked, Nothing} # Er enten neste node eller nothing
    value::Int # Verdien til noden
end

function createLinkedListDoublyLinked(length)
    # Create the list from the last element in the chain
    # This is so the returned element will be the first in the chain
    current = nothing
    beforeCurrent = nothing

    for i in 1:length
        # only fill out the next field because prev will be filled out later
        current = NodeDoublyLinked(nothing, beforeCurrent, rand(-100:100))
        # link up the node before this node to this node
        if beforeCurrent != nothing
            beforeCurrent.prev = current
        end
        beforeCurrent = current
    end
    return current
end

# -------------------------------------------------- #

# Exercise 3

function maxofdoublelinkedlist(linkedlist)
	max = linkedlist.value
    Node = linkedlist

    while Node.next != nothing
        Node = Node.next
        if Node.value > max
            max = Node.value
        end
    end

    while Node.prev != nothing
        Node = Node.prev
        if Node.value > max
            max = Node.value
        end
    end
    return max
end


function main3()
    testList = createLinkedListDoublyLinked(5)
    println(testList)
    println()

    println("Value of first node checked was :" * string(testList.value))
    println("Maximum value in list was " * string(maxofdoublelinkedlist(testList)) * ".")
end
