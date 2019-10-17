#=
5_dnasimilarity:
- Julia version: 
- Author: lundli
- Date: 2019-10-02
=#


# Exercise 1
function dnasimilarity(s1, s2)
    amount = 0
    for i = 1:length(s1)
        if (s1[i] == s2[i])
            amount += 1
        end
    end
    return amount
end

