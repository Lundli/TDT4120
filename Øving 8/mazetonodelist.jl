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

    for i in 1:size(maze, 1)
        for j in 1:size(maze, 2)
            if (maze[i,j] == 1)
                nodearray[i, j] = Node(i, j)
            else
                nodearray[i, j] = Node(i, j, false)
            end
        end
    end

    for i in 1:size(maze, 1)
        for j in 1:size(maze, 2)
            # Check if node is floor
            if (nodearray[i,j].floor == true)

                # North (i-1)
                if (( (i-1) >= 1) && (nodearray[i-1,j].floor == true))

                # South (i+1)
                elseif (( (i+1) >= SOME_SIZE) && (nodearray[i+1,j].floor == true))


                # East (j+1)
                elseif (( (i-1) >= SOME_SIZE)   && (nodearray[i,j+1].floor == true))

                # West (j-1)
                elseif (( (i-1) >= SOME_SIZE) && (nodearray[i,j-1].floor == true))


                end
             #
            #push!(nodearray[i,j].neighbors, nodearray[i-1,j])
            end
        end
    end
    =#
    # TODO: create nodelist from nodearray
    return 100
end

println(mazetonodelist(maze))