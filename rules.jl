# Have a 9x9 grid.
# Some entries in 9x9 grid are hardcoded.
# All of the following pieces of the grid must contain
# a permutation of the numbers 1-9:
# * Each row
# * Each column
# * Each of the 9 subgrids

function check_row(row)
  all(sort(reshape(row, 9)) .== collect(1:9))
end

function check_column(column)
  all(sort(reshape(column, 9)) .== collect(1:9))
end

function check_rows(grid)
  rows = 0
  for i = 1:9
    rows += check_row(grid[i, :])
  end
  rows
end

function check_columns(grid)
  columns = 0
  for i = 1:9
    columns += check_column(grid[:, i])
  end
  columns
end

function generate_subgrids(grid)
  (
    grid[1:3, 1:3],
    grid[1:3, 4:6],
    grid[1:3, 7:9],
    grid[4:6, 1:3],
    grid[4:6, 4:6],
    grid[4:6, 7:9],
    grid[7:9, 1:3],
    grid[7:9, 4:6],
    grid[7:9, 7:9]
   )
end

function check_subgrid(subgrid)
  all(sort(reshape(subgrid, 9)) .== collect(1:9))
end

function check_subgrids(grid)
  subgrids = 0
  for subgrid = generate_subgrids(grid)
    subgrids += check_subgrid(subgrid)
  end
  subgrids
end

function grid_quality(grid)
  quality = 0
  quality += check_rows(grid)
  quality += check_columns(grid)
  quality += check_subgrids(grid)
  quality
end

function is_solution(grid)
  if check_rows(grid) == 9 && check_columns(grid) == 9 && check_subgrids(grid) == 9
    return true
  else
    return false
  end
end

# Given a set of constraints, create some rough answer that satifies those.
# To do this, we find the values missing from each row.
# Then insert them at random to make a full grid.
function fill_in(old_grid)
  grid = copy(old_grid)
  for i = 1:9
    row = grid[i, :]
    missing_entries = find(row .== 0)
    for n = 1:9
        if !(n in row)
        grid[i, pop!(missing_entries)] = n
      end
    end
  end
  grid
end
