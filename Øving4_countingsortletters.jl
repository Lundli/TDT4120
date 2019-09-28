## Exercise 1


# Helper function #
function chartodigit(character)
    #Den konverterer 'a' til 1, 'b' til 2 osv.
    #Eksempel: chartodigit("hei"[2]) gir 5 siden 'e' er den femte bokstaven i alfabetet.

    return character - '`'
end
# Helper function end #



function countingsortletters(A,position)
    count = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    for i = 1:length(A)
        count[chartodigit(A[i][position])] += 1
    end

    for i = 2:length(count)
        count[i] = count[i-1] + count[i]
    end

    ## Initialise array with same length as A
    B = []
    for i = 1: length(A)
        push!(B, "x")
    end


    ## Reverse for loop, --> ensure stable sorting algorithm
    ##      (from):(step):(to)
    for i = length(A):-1:1
        println(A[i][position], "  ", chartodigit(A[i][position]), "  ", A[i])


        p = chartodigit(A[i][position])

        B[count[p]] = A[i]
        count[p] -= 1
    end
    return B
end

countingsortletters(["ccc", "cba", "ca", "ab", "abc"], 2)


## --------------- Tests --------------- ##
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Basic tests" begin
    @test countingsortletters(["aa", "bb", "cc"], 1) == ["aa", "bb", "cc"]
    @test countingsortletters(["cc", "bb", "aa"], 2) == ["aa", "bb", "cc"]
    @test countingsortletters(["ac", "bb", "ca"], 2) == ["ca", "bb", "ac"]
    @test countingsortletters(["ccc", "cba", "ca", "ab", "abc"], 2) == ["ca", "cba", "ab", "abc", "ccc"]
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")

