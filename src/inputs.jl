"""
Loads the puzzle inputs as function calls.

    Call the associated day's example data and input data in the
    solution scripts. E.g., ex_d1() loads the example data for day 1, and input_d1() loads the input data.

    Lightwieight parsing is done in this script to convert to arrays
    of strings or integers where appropriate. More significant parsing 
    is considered puzzle logic and should be done in the solution scripts.

"""

module inputs

using Pipe

cd(dirname(@__DIR__))

################
#    Day 1
################
ex1_d1() = """1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet""" |> split .|> String
ex2_d1() = """two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen""" |> split .|> String
input_d1() = readlines("inputs/day_01.txt")
@assert typeof(ex1_d1()) == typeof(input_d1())

################
#    Day 2
################
ex_d2() = @pipe """Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green""" |> String.(split(_, "\n"))
input_d2() = readlines("inputs/day_02.txt")
@assert typeof(ex_d2()) == typeof(input_d2())




end # module inputs