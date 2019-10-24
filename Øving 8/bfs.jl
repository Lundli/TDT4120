using DataStructures: Queue, enqueue!, dequeue!

mutable struct Node
    i::Int
    j::Int
    floor::Bool
    neighbors::Array{Node}
    color::Union{String,Nothing}
    distance::Union{Int,Nothing}
    predecessor::Union{Node,Nothing}
end
Node(i, j, floor=true) = Node(i, j, floor, [], nothing, nothing, nothing)


# Exercise 2
function bfs!(nodes, start)
    goalnode = nothing

    # Colour all nodes white (no nodes visited at start)
    #   White: not visisted
    #   Grey:  found, but not visited yet
    #   Black: visited

    # Initialise values for all nodes
    for i = 1:length(nodes)
        nodes[i].color = "White"        # Not visisted
        nodes[i].distance = nothing     # Don't know distance yet
        nodes[i].predecessor = nothing  # No predecessor yet
    end

    # Initialise starting node
    start.color = "Grey"
    start.distance = 0
    start.predecessor = nothing

    # Put start node first in queue
    q = Queue{Node}()
    enqueue!(q, start)

    # While there are nodes in the queue, keep going
    while !isempty(q)
        currentNode = dequeue!(q)
        currentNode.color = "Black"

        # Check if currentNode is the goal node
        if isgoalnode(currentNode)
            goalnode = currentNode
        end

        # loop through all neighbours of that node
        for n = 1:size(currentNode.neighbors, 1)

            # If node not already found, make it grey, and add predecessor & distance
            if currentNode.neighbors[n].color == "White"
                currentNode.neighbors[n].color = "Grey"
                currentNode.neighbors[n].predecessor = currentNode
                currentNode.neighbors[n].distance = currentNode.distance + 1

                # add node to queue
                enqueue!(q, currentNode.neighbors[n])
            end
        end
    end

    # return goalnode (will return nothing if goalnode was not found)
    return goalnode

end






### Tests ###

# (Helper functions for tests)
function isgoalnode(node)
    global goal
    node == goal
end

function setgoalnode(node)
    global goal
    goal = node
end

function nodeattrs(node)
    return string(node.color, " ", node.distance, " ",
                  node.predecessor === nothing ? "nothing" :
                  (node.predecessor.i, node.predecessor.j))
end

printstyled("\n\n\n---------------\nTests\n---------------\n"; color = :magenta)

using Test
@testset "LitenLabyrint" begin
    # maze = [0 0 0 0 0
    #         0 1 1 1 0
    #         0 1 0 0 0
    #         0 1 1 1 0
    #         0 0 0 0 0]

    nodelist = [Node(2, 2), Node(3, 2), Node(4, 2), Node(2, 3),
                Node(4, 3), Node(2, 4), Node(4, 4)]

    nodelist[1].neighbors = [nodelist[2], nodelist[4]]
    nodelist[2].neighbors = [nodelist[1], nodelist[3]]
    nodelist[3].neighbors = [nodelist[2], nodelist[5]]
    nodelist[4].neighbors = [nodelist[1], nodelist[6]]
    nodelist[5].neighbors = [nodelist[3], nodelist[7]]
    nodelist[6].neighbors = [nodelist[4]]
    nodelist[7].neighbors = [nodelist[5]]

    setgoalnode(nothing)
    result = bfs!(nodelist, nodelist[1])

    # Test at å kjøre bfs mot et utilgjengelig mål returnerer nothing
    @test result === nothing

    setgoalnode(nodelist[7])
    result = bfs!(nodelist, nodelist[1])

    # Test at riktig målnode returneres
    @test result == nodelist[7]

    # Test at attributtene til nodene i nodelist ble oppdatert korrekt
    # Attributtene tilsvarer color, distance og koordinatene til predecessor
    # (Merk at fargene kan variere noe ut ifra når man returnerer målnoden)
    @test nodeattrs(nodelist[1]) == "black 0 nothing"
    @test nodeattrs(nodelist[2]) == "black 1 (2, 2)"
    @test nodeattrs(nodelist[3]) == "black 2 (3, 2)"
    @test nodeattrs(nodelist[4]) == "black 1 (2, 2)"
    @test nodeattrs(nodelist[5]) in ["gray 3 (4, 2)", "black 3 (4, 2)"]
    @test nodeattrs(nodelist[6]) == "black 2 (2, 3)"
    @test nodeattrs(nodelist[7]) in ["white 4 (4, 3)", "gray 4 (4, 3)"]
end

@testset "MiddelsLabyrint" begin
    # maze = [0 0 0 0 0 0 0
    #         0 1 1 1 1 1 0
    #         0 1 0 0 0 1 0
    #         0 1 0 1 0 1 0
    #         0 1 0 1 0 1 0
    #         0 1 1 1 0 1 0
    #         0 0 0 0 0 0 0]

    nodelist = [Node(2, 2), Node(3, 2), Node(4, 2), Node(5, 2), Node(6, 2),
                Node(2, 3), Node(6, 3), Node(2, 4), Node(4, 4), Node(5, 4),
                Node(6, 4), Node(2, 5), Node(2, 6), Node(3, 6), Node(4, 6),
                Node(5, 6), Node(6, 6)]

    nodelist[1].neighbors = [nodelist[2], nodelist[6]]
    nodelist[2].neighbors = [nodelist[1], nodelist[3]]
    nodelist[3].neighbors = [nodelist[2], nodelist[4]]
    nodelist[4].neighbors = [nodelist[3], nodelist[5]]
    nodelist[5].neighbors = [nodelist[4], nodelist[7]]
    nodelist[6].neighbors = [nodelist[1], nodelist[8]]
    nodelist[7].neighbors = [nodelist[5], nodelist[11]]
    nodelist[8].neighbors = [nodelist[6], nodelist[12]]
    nodelist[9].neighbors = [nodelist[10]]
    nodelist[10].neighbors = [nodelist[9], nodelist[11]]
    nodelist[11].neighbors = [nodelist[7], nodelist[10]]
    nodelist[12].neighbors = [nodelist[8], nodelist[13]]
    nodelist[13].neighbors = [nodelist[12], nodelist[14]]
    nodelist[14].neighbors = [nodelist[13], nodelist[15]]
    nodelist[15].neighbors = [nodelist[14], nodelist[16]]
    nodelist[16].neighbors = [nodelist[15], nodelist[17]]
    nodelist[17].neighbors = [nodelist[16]]

    setgoalnode(nodelist[17])
    result = bfs!(nodelist, nodelist[1])

    @test result == nodelist[17]

    @test nodeattrs(nodelist[1]) == "black 0 nothing"
    @test nodeattrs(nodelist[2]) == "black 1 (2, 2)"
    @test nodeattrs(nodelist[3]) == "black 2 (3, 2)"
    @test nodeattrs(nodelist[4]) == "black 3 (4, 2)"
    @test nodeattrs(nodelist[5]) == "black 4 (5, 2)"
    @test nodeattrs(nodelist[6]) == "black 1 (2, 2)"
    @test nodeattrs(nodelist[7]) == "black 5 (6, 2)"
    @test nodeattrs(nodelist[8]) == "black 2 (2, 3)"
    @test nodeattrs(nodelist[9]) in ["gray 8 (5, 4)", "black 8 (5, 4)"]
    @test nodeattrs(nodelist[10]) == "black 7 (6, 4)"
    @test nodeattrs(nodelist[11]) == "black 6 (6, 3)"
    @test nodeattrs(nodelist[12]) == "black 3 (2, 4)"
    @test nodeattrs(nodelist[13]) == "black 4 (2, 5)"
    @test nodeattrs(nodelist[14]) == "black 5 (2, 6)"
    @test nodeattrs(nodelist[15]) == "black 6 (3, 6)"
    @test nodeattrs(nodelist[16]) in ["gray 7 (4, 6)", "black 7 (4, 6)"]
    @test nodeattrs(nodelist[17]) in ["white 8 (5, 6)", "gray 8 (5, 6)"]
end
println("---------------------------------------------------------\n\n")