import Magyar.WordCategories
import WordCategories: BACK, FRONT_SHORT, FRONT_LONG

const WORD_CLASSES = Dict(
    "repül" => FRONT_SHORT,
    "kettő" => FRONT_LONG,
    "ír"    => BACK,
    "segít" => FRONT_SHORT,
    "béka"  => BACK,
    "cica"  => BACK,
)

@testset "word categorizing" begin
    for (word, class) in WORD_CLASSES
        @test categorize_word(word) == class
    end

    @test_throws ArgumentError categorize_word("kk")
end