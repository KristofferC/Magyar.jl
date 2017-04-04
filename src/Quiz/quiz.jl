const ENG_TO_HU_PROBABILITY = 0.25

function _query()
    print(STDOUT, ">> ")
    return strip(readline(STDIN))
end

function query_user_enumeration(choices::Vector{String})
    for (i, choice) in enumerate(choices)
        println(STDOUT, i, ": ", choice)
    end
    typed = tryparse(Int, _query())
    if isnull(typed) || get(typed) <= 0 || get(typed) > length(choices)
        throw(ErrorException(string("please input an integer between 1 and ", 
                                    length(choices))))
     end
     return get(typed)
end

function start_quiz()
    quizzes = [("Nouns", quiz_nouns),
              ]
    choice = query_user_enumeration([v[1] for v in quizzes])
    println()
    quizzes[choice][2]()
end

function get_random_sample(df)
    i = rand(1:size(df,1))
    return df[i, :]
end

function quiz_nouns()
    filtered = @where(NOUNS, :difficulty .== Magyar.EASY)
    while true
        noun = get_random_sample(filtered)
        questions, keys = noun[:word][1], noun[:translation][1]
        lang = "hu"
        if rand() < ENG_TO_HU_PROBABILITY
            questions, keys = keys, questions
            lang = "en"
        end
        question = questions[rand(1:end)]
        @async run(`espeak -v $lang "$question"`)
        println(question)
        answer = _query()
        if answer in keys
            print("Correct!\n\n")
            run(`espeak -v en "Correct"`)
        else
            print("Wrong! Correct answer was: ", join(keys, ','), "\n\n")
            run(`espeak -v en "Wrong"`)
        end
        sleep(0.1)
    end
end