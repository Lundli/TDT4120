# Exercise 1
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


maze = [0 0 0 0 0 0 0
                   1 1 0 1 1 1 0
                   0 1 0 1 0 0 0
                   0 1 0 1 1 1 0
                   0 1 1 1 0 1 0
                   0 1 0 1 0 1 1
                   0 0 0 0 0 0 0]

function mazetonodelist(maze)
    nodearray = Array{Node}(undef, size(maze, 1), size(maze, 2))

    # Add all nodes to nodearray.
    # with true if floor, with false if it's a wall
    for i in 1:size(maze, 1)
        for j in 1:size(maze, 2)
            if (maze[i,j] == 1)
                nodearray[i, j] = Node(i, j, true)
            else
                nodearray[i, j] = Node(i, j, false)
            end
        end
    end


    # Add neighbours of the nodes
    for i in 1:size(maze, 1)
        for j in 1:size(maze, 2)

            # Check if node is floor (not a wall)
            if (nodearray[i,j].floor == true)

                # North, (i-1)
                if (( (i-1) >= 1) && (nodearray[i-1,j].floor == true))
                    push!(nodearray[i,j].neighbors, nodearray[i-1,j])
                end

                # South, (i+1)
                if (( (i+1) <= size(maze,1)) && (nodearray[i+1,j].floor == true))
                    push!(nodearray[i,j].neighbors, nodearray[i+1,j])
                end

                # East, (j+1)
                if (( (j+1) <= size(maze, 2))   && (nodearray[i,j+1].floor == true))
                    push!(nodearray[i,j].neighbors, nodearray[i,j+1])
                end

                # West, (j-1)
                if (( (j-1) >= 1) && (nodearray[i,j-1].floor == true))
                    push!(nodearray[i,j].neighbors, nodearray[i,j-1])
                end
            end
        end
    end

    # create nodeList, which is to be returned
    nodeList = []
    for i = 1:size(maze,1)
        for j = 1:size(maze,2)

            # Only add if node has value 1 (floor)
            if nodearray[i,j].floor == true
                push!(nodeList, nodearray[i,j])
            end
        end
    end
    return nodeList
end

#println(mazetonodelist(maze))


using Test
@testset "LitenLabyrint" begin
    maze = [0 0 0 0 0
            0 1 1 1 0
            0 1 0 0 0
            0 1 1 1 0
            0 0 0 0 0]
    nodelist = mazetonodelist(maze)

    # Test at nodelist er en liste/array med Node-instanser
    # Merk at følgende tester vil feile dersom dette ikke er tilfelet
    @test nodelist isa Array{Node,1}

    # Test at grafen inneholder riktig antall noder
    @test length(nodelist) == 7

    # Vi sorterer nodelist ut ifra koordinatene, ettersom vi ikke pålegger
    # en spesifikk rekkefølge på nodene i nodelist
    sortnodelist(nodelist)

    # Test at koordinatene til hver node er korrekte
    @test getcoords(nodelist) ==
        [(2, 2), (3, 2), (4, 2), (2, 3), (4, 3), (2, 4), (4, 4)]

    # Test at koordinatene til hver nabonode er korrekte
    @test getneighborcoords(nodelist) ==
        [[(3, 2), (2, 3)], [(2, 2), (4, 2)],
         [(3, 2), (4, 3)], [(2, 2), (2, 4)],
         [(4, 2), (4, 4)], [(2, 3)], [(4, 3)]]


@testset "MiddelsLabyrint" begin
    maze = [0 0 0 0 0 0 0
            0 1 1 1 1 1 0
            0 1 0 0 0 1 0
            0 1 0 1 0 1 0
            0 1 0 1 0 1 0
            0 1 1 1 0 1 0
            0 0 0 0 0 0 0]
    nodelist = mazetonodelist(maze)

    @test nodelist isa Array{Node,1}

    @test length(nodelist) == 17

    sortnodelist(nodelist)

    @test getcoords(nodelist) ==
        [(2, 2), (3, 2), (4, 2), (5, 2), (6, 2),
         (2, 3), (6, 3), (2, 4), (4, 4), (5, 4),
         (6, 4), (2, 5), (2, 6), (3, 6), (4, 6),
         (5, 6), (6, 6)]

    @test getneighborcoords(nodelist) ==
        [[(3, 2), (2, 3)], [(2, 2), (4, 2)], [(3, 2), (5, 2)],
         [(4, 2), (6, 2)], [(5, 2), (6, 3)], [(2, 2), (2, 4)],
         [(6, 2), (6, 4)], [(2, 3), (2, 5)], [(5, 4)],
         [(4, 4), (6, 4)], [(6, 3), (5, 4)], [(2, 4), (2, 6)],
         [(2, 5), (3, 6)], [(2, 6), (4, 6)], [(3, 6), (5, 6)],
         [(4, 6), (6, 6)], [(5, 6)]]
end

println("---------------------------------------------------------\n\n")
end