# Exercise 1:

# NOTE: this does solve the longest continuous increasing subsequence (though not the task to be solved. See lislength2)

function lislength(s)
    mls = zeros(Int, size(s))
    mls[1] = 1

    for i = 2:length(s)
        mls[i] = 1
        if (s[i] > s[i-1])
            mls[i] += mls[i-1]
        end
    end
    return mls
    #return maximum(mls) # Returnerer det største tallet i listen
end


a = rand(Int16, 10000)
#println(a)

println(lislength(a))