load("solver.jl")

load("sample_games.jl")

println("Starting Grid")
println(grid)
println()

println("Solution")
println(solution)
println()

tentative_solution = solver(grid)

if cost(tentative_solution[3]) == 0
  println("Solution Found by SA")
  println(tentative_solution[3])
  println()
  @assert all(tentative_solution[3] .== solution)
else
  println("Approximate Solution Found by SA")
  println(tentative_solution[3])
  println()
  println("No exact solution found.")
  println("You should probably the solver run for more than 500,000 iterations.")
  println("Cost at approximate solution: $(tentative_solution[4])")
  println()
end
