@enum _Difficulty EASY MEDIUM HARD
@enum _Category FAMILY HOME

const NOUNS = DataFrame(
    word        = @data(Vector{String}[]),
    translation = @data(Vector{String}[]),
    difficulty  = @data(_Difficulty[]),
    category    = @data(_Category[]),
)



vecify(x::Vector{String}) = x
vecify(x::String) = String[x]

function add_noun!(word,
                   translation;
                   difficulty=NA,
                   category=NA)
    push!(NOUNS, @data([vecify(word), vecify(translation), difficulty, category]))
end

add_noun!("lány", "girl", difficulty = EASY, category = FAMILY)
add_noun!("macika", "cat", difficulty = EASY, category = FAMILY)
add_noun!("anya", ["mother", "mum", "mom"], difficulty = EASY, category = FAMILY)
add_noun!("apa", ["father", "dad"], difficulty = EASY, category = FAMILY) 
add_noun!("testvér", "sibling", difficulty = EASY, category = FAMILY)
add_noun!("hug", "little sister", difficulty = MEDIUM, category = FAMILY)
add_noun!("nővér", "big sister", difficulty = MEDIUM, category = FAMILY)
add_noun!("öcs", "little brother", difficulty = MEDIUM, category = FAMILY)
add_noun!("báty", "big brother", difficulty = MEDIUM, category = FAMILY)
add_noun!("gyerek", "child", difficulty = EASY, category = FAMILY)
add_noun!("lány", "girl", difficulty = EASY, category = FAMILY)
add_noun!("fiú", "boy", difficulty = EASY, category = FAMILY)
add_noun!("lány", "girl", difficulty = EASY, category = FAMILY)
add_noun!("nagyapa", "grandfather", difficulty = EASY, category = FAMILY)
add_noun!("nagymama", "grandmother", difficulty = EASY, category = FAMILY)
add_noun!("unoka", "grandchild", difficulty = EASY, category = FAMILY)
add_noun!("unokatestvér", "cousin", difficulty = EASY, category = FAMILY)
add_noun!("unokahug", "niece", difficulty = MEDIUM, category = FAMILY)
add_noun!("unokaöcs", "nephew", difficulty = MEDIUM, category = FAMILY)
add_noun!("nagynéni", "aunt", difficulty = MEDIUM, category = FAMILY)
add_noun!("nagybácsi", "uncle", difficulty = MEDIUM, category = FAMILY)
add_noun!("vej", "son-in-law", difficulty = HARD, category = FAMILY)
add_noun!("meny", "daughter-in-law", difficulty = HARD, category = FAMILY)
add_noun!("esküvő", "wedding", difficulty = EASY, category = FAMILY)
add_noun!("mennyasszony", "bride", difficulty = HARD, category = FAMILY)
add_noun!("völegény", "groom", difficulty = HARD, category = FAMILY)
add_noun!("keresztelő", "christening", difficulty = HARD, category = FAMILY)
add_noun!("temetés", "funeral", difficulty = MEDIUM, category = FAMILY)
add_noun!("születésnap", "birthday", difficulty = EASY, category = FAMILY)
add_noun!("szülő", "parent", difficulty = EASY, category = FAMILY)
add_noun!("születés", "birth", difficulty = EASY, category = FAMILY)
add_noun!("bácsi", "elderly man", difficulty = EASY, category = FAMILY)
add_noun!("néni", "elderly woman", difficulty = EASY, category = FAMILY)

add_noun!("ház", "house", difficulty = EASY, category = HOME)
add_noun!("lakás", "apartment", difficulty = EASY, category = HOME)
add_noun!("szoba", "room", difficulty = EASY, category = HOME)
add_noun!("ajtó", "door", difficulty = EASY, category = HOME)
add_noun!("fal", "wall", difficulty = EASY, category = HOME)
add_noun!("föld", "ground", difficulty = EASY, category = HOME)
add_noun!("ablak", "window", difficulty = EASY, category = HOME)
add_noun!("asztal", "table", difficulty = EASY, category = HOME)
add_noun!("ágy", "bed", difficulty = EASY, category = HOME)
add_noun!("szekrény", "shelf", difficulty = EASY, category = HOME)
add_noun!("ceruza", "pencil", difficulty = EASY, category = HOME)
add_noun!("toll", "pent", difficulty = EASY, category = HOME)
add_noun!("papír", "paper", difficulty = EASY, category = HOME)
add_noun!("számítógép", "computer", difficulty = EASY, category = HOME)