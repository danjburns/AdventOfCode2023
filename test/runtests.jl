using Test

using AdventOfCode2023:day01
@testset "Day 1" begin
    @test day01.part1(day01.input) == 55090 
    @test day01.part2(day01.input) == 54845
end

using AdventOfCode2023:day02
@testset "Day 2" begin
    @test day02.part1(day02.input) == 2551
    @test day02.part2(day02.input) == 62811
end