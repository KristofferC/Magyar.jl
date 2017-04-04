module Magyar

using DataFrames

export start_quiz, categorize_word

include("Grammar/word_categories.jl")
include("Database/nouns.jl")
include("Quiz/quiz.jl")

end # module

