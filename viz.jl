function safe_print(val)
  if val == 0
    print("*")
  else
    print(val)
  end
end

function grid_print(grid)
  println()
  for i = 1:9
    for j = 1:9
      if j < 9
        safe_print(grid[i, j])
        print(" ")
      else
        safe_print(grid[i, j])
        print("\n")
      end
      if j == 3 || j == 6
        print(" | ")
      end
    end
    if i == 3 || i == 6
      print("-"^(9 + 8 + 6))
      print("\n")
    end
  end
  println()
end

# safe_print(0)
# safe_print(1)
# grid_print(grid)
# grid_print(solution)
