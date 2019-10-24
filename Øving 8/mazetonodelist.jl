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

    for i in 1:size(maze, 1)
        for j in 1:size(maze, 2)

            # Check if node is floor (not a wall)
            if (nodearray[i,j].floor == true)
                println("Hey")

                # North, (i-1)
                if (( (i-1) >= 1) && (nodearray[i-1,j].floor == true))
                    push!(nodearray[i,j].neighbors, nodearray[i-1,j])

                # South, (i+1)
                elseif (( (i+1) <= size(maze,1)) && (nodearray[i+1,j].floor == true))
                    push!(nodearray[i,j].neighbors, nodearray[i+1,j])

                # East, (j+1)
                elseif (( (j+1) <= size(maze, 2))   && (nodearray[i,j+1].floor == true))
                    push!(nodearray[i,j].neighbors, nodearray[i,j+1])

                # West, (j-1)
                elseif (( (j-1) >= 1) && (nodearray[i,j-1].floor == true))
                    push!(nodearray[i,j].neighbors, nodearray[i,j-1])

                end
            end
        end
    end


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