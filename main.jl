#"Fifa 23 Players Data.csv"

function load_players(io)
    players = []
    readline(io)
    while !eof(io)
        player = split(readline(io), ',')
        push!(players, player[2])
    end
    players
end

function load_overalls(io)
    overalls = []
    readline(io)
    while !eof(io)
        player = split(readline(io), ',')
        push!(overalls, player[3])
    end
    overalls
end

function create_dict(players, overalls)
    dict = Dict(zip(players, overalls))
end

function get_player(dict)
    print("What is the players name? ")
    answer = readline(stdin)
    if(haskey(dict, answer))
        println("Overall is: ", dict[answer])
    else
        printstyled("Wrong name, please try again...", color = :red)
    end
end

function print_players(players, overalls, n)
    print(rpad("│", 16))
    printstyled("Name", color=:cyan)
    print(lpad("│", 15))
    printstyled(" Overall", color=:cyan)
    println(" |")
    for i in 1:n
        len = length(players[i])
        len -= len % 2
        print(rpad("│", round(Int, 17-(len/2))))
        print(rpad(players[i], round(Int, 17+(len/2))))
        print(rpad("|", 5))
        print(rpad(overalls[i], 5))
        println("|")
    end
end

