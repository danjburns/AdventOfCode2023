module day02

import Base.@kwdef

include("inputs.jl")
ex = inputs.ex_d2()
input = inputs.input_d2()


@kwdef struct Game{I<:Int}
    num::I = 0
    red_max::I = 0
    green_max::I = 0
    blue_max::I = 0
end


# part 1

function parse_line(line)
    # extract the game number
    game_part, cubes_part = split(line, ": ")
    game_num = parse(Int, game_part[6:end])

    # extract the color's numbers
    sets = split(cubes_part, "; ")
    pattern = r"(\d+)\s+(\w+)"

    red_max, blue_max, green_max = 0, 0, 0
    for s in sets
        matches = collect(eachmatch(pattern, s))
        for m in matches
            color = m.captures[2]
            number = parse(Int, m.captures[1])
            if color == "blue" && number > blue_max
                blue_max = number
            elseif color == "red" && number > red_max
                red_max = number
            elseif color == "green" && number > green_max
                green_max = number
            end
        end
    end
    return Game(
        num=game_num, red_max=red_max, green_max=green_max, blue_max=blue_max
    )
end


function valid_game(game::Game)
    # color limits
    red_limit = 12
    green_limit = 13
    blue_limit = 14

    # test if game could have been played withing limits
    if (
        (game.red_max <= red_limit) &&
        (game.green_max <= green_limit) &&
        (game.blue_max <= blue_limit)
    )
        return true
    else
        return false
    end
end


function sum_valid_game_nums(input)
    
    # parse input into games
    games = [parse_line(line) for line in input]

    # running total of game number for valid games
    total = 0
    for game in games
        total += valid_game(game) ? game.num : 0
    end
    return total

end

part1(input) = sum_valid_game_nums(input)
@assert part1(ex) == 8

@info "Day 2, Part 1:  $(part1(input))"

# part 2

game_pwr(game) = game.red_max * game.green_max * game.blue_max
part2(input) = [parse_line(line) for line in input] .|> game_pwr |> sum 

@info "Day 2, Part 2:  $(part2(input))"


end  # module day02