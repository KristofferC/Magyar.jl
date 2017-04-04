module Difficulty
    @enum _Difficulty EASY MEDIUM HARD
end

module Category
     @enum _Category FAMILY
end

const NOUNS = DataFrame(
    word        = @data(String[]),
    difficulty  = @data(Difficulty._Difficulty[]),
    translation = @data(String[])
)

push!(NOUNS, @data(["lány", Difficulty.EASY, "girl"]))

function get_random_noun()
    i = rand(1:size(NOUNS,1))
    return NOUNS[i, :]
end


