load("solver.jl")

load("sample_games.jl")

println(grid)
println(solution)

tentative_solution = solver(grid)

if cost(tentative_solution[3]) == 0
  println(tentative_solution[3])
  @assert all(tentative_solution[3] .== solution)
else
  println(tentative_solution[3])
  println("No exact solution found.")
  println("You should probably the solver run for more iterations.")
  println("Cost at approximate solution: $(tentative_solution[4])")
end
