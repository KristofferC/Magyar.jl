# http://www.hungarianreference.com/Vowel-Harmony.aspx

module WordCategories
    @enum _WordCategories BACK FRONT_SHORT FRONT_LONG
end

const ALL_VOWELS = Set{Char}(
    [ 'a', 'e', 'i', 'o', 'ö', 'u', 'ü',
      'á', 'é', 'í', 'ó', 'ő', 'ú', 'ű']
)
const BACK_VOWELS        = Set{Char}(['a', 'á', 'o', 'ó', 'u', 'ú'])
const SHORT_FRONT_VOWELS = Set{Char}(['e', 'ö', 'ü'])
const LONG_FRONT_VOWELS  = Set{Char}(['é', 'ő', 'ű'])
const I_VOWELS           = Set{Char}(['i', 'í'])

@assert BACK_VOWELS ∪ SHORT_FRONT_VOWELS ∪ LONG_FRONT_VOWELS ∪ I_VOWELS == ALL_VOWELS

is_vowel(c::Char)           = c in ALL_VOWELS
is_backvowel(c::Char)       = c in BACK_VOWELS
is_shortfrontvowel(c::Char) = c in SHORT_FRONT_VOWELS
is_longfrontvowel(c::Char)  = c in LONG_FRONT_VOWELS
is_ivowel(c::Char)          = c in I_VOWELS
is_frontvowel(c::Char)      = is_shortfrontvowel(c) || is_longfrontvowel(c)

function categorize_word(word::String)
    # Ordered list of vowels
    vowels = Char[]
    for char in word
        if is_vowel(char)
            push!(vowels, char)
        end
    end

    length(vowels) == 0 && throw(ArgumentError("word: \"$word\" does not contain any vowels"))

    all(is_ivowel, vowels) && return WordCategories.BACK

    # Remove í and i because they do not determine the category of the word
    # in mixed cases
    vowels = setdiff(vowels, I_VOWELS)

    last_vowel = vowels[end]

    is_backvowel(last_vowel)       && return WordCategories.BACK
    is_longfrontvowel(last_vowel)  && return WordCategories.FRONT_LONG
    is_shortfrontvowel(last_vowel) && return WordCategories.FRONT_SHORT

    error("internal error, could not classify word: \"$word\"")
end
