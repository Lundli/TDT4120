# Exercise 1:

function lislength(s)
    mls = zeros(Int, size(s))
    mls[1] = 1
    for i = 2:length(s)

        mls[i] = 1

        for j = i:length(s)
            println("Hey")
            if

        end

    end
    return maximum(mls) # Returnerer det største tallet i listen
end


a = [5,3,3,6,7]

println(lislength(a))