function lislength(s)
    mls = zeros(Int, size(s))
    mls[1] = 1


    for i = 2:length(s)
        n = 1

        for j = 1:i
            if ((s[i] > s[j]) && (mls[j] >= n))
                #println("yep")
                n += 1
            end
        end
        mls[i] = n
    end
    #return mls
    return maximum(mls) # Returnerer det største tallet i listen
end

a = [5, 3, 3, 6, 7]

println(
    lislength(a)
    )