# Function will sort list using the Insertion-sort algorithm.

function insertionsort!(A)
    for j in 2:length(A)
        key = A[j]
        i = j - 1
        while (i > 0) && (A[i] > key)
            A[i+1] = A[i]
            i = i - 1
        end
        A[i+1] = key
    end
end


A = [1, 5, 3, 4, 2, 9, 8]


println("----- Program start -----")
println(A)
insertionsort!(A)
println(A)