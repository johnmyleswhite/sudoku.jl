load("rules.jl")
load("solver.jl")
load("sample_games.jl")

@assert grid_quality(solution) == 27
@assert is_solution(solution)

@assert grid_quality(grid) == 0
@assert !is_solution(grid)

@assert any(grid .== 0)
@assert all(fill_in(grid) .!= 0)
@assert grid_quality(fill_in(grid)) != 27

@assert cost(grid) == 27 - grid_quality(grid)
@assert cost(grid) == 27
@assert cost(solution) == 0
