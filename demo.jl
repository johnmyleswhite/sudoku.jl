include("solver.jl")
include("sample_games.jl")
include("viz.jl")

import StatsBase: randi


println("Starting Grid")
grid_print(grid)
println()

println("Correct Solution")
grid_print(solution)
println()

tentative_solution = solver(grid)

if cost(tentative_solution[3]) == 0
  println("Solution Found by SA")
  grid_print(tentative_solution[3])
  println()
  @assert all(tentative_solution[3] .== solution)
else
  println("Approximate Solution Found by SA")
  grid_print(tentative_solution[3])
  println()
  println("No exact solution found.")
  println("You should probably the solver run for more than 500,000 iterations.")
  println("Cost at approximate solution: $(tentative_solution[4])")
  println()
end
