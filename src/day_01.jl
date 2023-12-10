module day01

include("inputs.jl")
input = inputs.input_d1()


# Part 1

# get first and last digit in a string as a two-digit number
function get_2_digit_num(line)
    digits = filter(isdigit, line)
    tens_digit = parse(Int, first(digits)) * 10
    ones_digit = parse(Int, last(digits))
    return tens_digit + ones_digit
end

# part1: calibration values is sum of 2-digit numbers
part1(input) = sum([get_2_digit_num(line) for line in input])

ex1 = inputs.ex1_d1()
@assert part1(ex1) == 142
@info "Day 1, Part 1:  $(part1(input))"


# Part 2
# map string representation to digits
str_to_digit = Dict(
    "1" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9
)


function get_2_digit_num_str(line)
    fwd = r"(\d{1}|one|two|three|four|five|six|seven|eight|nine)"
    rev = r"(\d{1}|enin|thgie|neves|xis|evif|ruof|eerht|owt|eno)"

    first = only(match(fwd, line).captures)
    last = reverse(only(match(rev, reverse(line)).captures))

    tens_digit = str_to_digit[first] * 10
    ones_digit = str_to_digit[last]

    return tens_digit + ones_digit
end


# part 2: calibration value is sum of 2-digit numbers including strings
part2(input) = sum([get_2_digit_num_str(line) for line in input])

ex2 = inputs.ex2_d1()
@assert part2(ex2) == 281

@info "Day 1, Part 2:  $(part2(input))"

end # module day01