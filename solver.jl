load("rules.jl")
load("simulated_annealing.jl")

# Randomly flip two entries.
# Need to respect hardcoded locations.
function proposal(grid, constraint_grid)
  (i1, j1, i2, j2) = (randi(9), randi(9), randi(9), randi(9))
  while constraint_grid[i1, j1] != 0 || constraint_grid[i2, j2] != 0
    (i1, j1, i2, j2) = (randi(9), randi(9), randi(9), randi(9))
  end
  res = copy(grid)
  (res[i1, j1], res[i2, j2]) = (res[i2, j2], res[i1, j1])
  res
end

function cost(grid)
  27 - grid_quality(grid)
end

# Define an approximate answer quality metric.
# Solution must have all rows, all columns and all subgrids work.
# Approximate solutions can be ranked by computing number of matching rows, columns and subgrids.
# Run simulated annealing using this metric from an arbitrary starting point.
function solver(constraint_grid)
  grid = fill_in(constraint_grid)
  function propose(grid)
    proposal(grid, constraint_grid)
  end
  solution = simulated_annealing(cost, grid, propose)
  solution
end
