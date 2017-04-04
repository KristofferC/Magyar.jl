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

function quiz_nouns()
    while true
        noun = get_random_noun()
        println(noun[:word][1])
        answer = _query()
        if answer == noun[:translation][1]
            print("Correct!\n\n")
        else
            print("Wrong!\n\n")
        end
    end
end