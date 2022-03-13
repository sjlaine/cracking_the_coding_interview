#!/usr/bin/env ruby

# NxN matrix
# 4pixels x 4pixels
# matrix =
# [
#   [1, 1, 1, 1],
#   [0, 1, 0, 0],
#   [0, 0, 0, 0],
#   [0, 0, 0, 0],
# ]

# result =
# [
#   [0, 0, 0, 1],
#   [0, 0, 1, 1],
#   [0, 0, 0, 1],
#   [0, 0, 0, 1],
# ]

def print(matrix)
  row = 0

  while(row < matrix.length)
    p matrix[row]
    row += 1
  end
end

def level_slice(i, arr)
  arr.slice(i, arr.length - (1 + i))
end

def rotate(matrix)
  layer = 0
  len = matrix.length
  new_matrix = []

  print(matrix)

  while(layer < len / 2)
    first = layer
    last = len - layer - 1

    i = first
    while(i < last)
      puts "layer: #{layer}, first: #{first}, i: #{i}, last: #{last}"
      offset = i - first
      # save top
      top = matrix[first][i]

      # top becomes left
      matrix[first][i] = matrix[last - offset][first]
      # left becomes bottom
      matrix[last - offset][first] = matrix[last][last - offset]
      # bottom becomes right
      matrix[last][last - offset] = matrix[i][last]
      # right becomes top(saved)
      matrix[i][last] = top

      i += 1
    end

    layer += 1
  end

  puts "\n"
  print(matrix)
  puts "\n"
end

m1 = [
  [0, 1],
  [0, 0]
]

m2 = [
  [1, 1, 1],
  [0, 0, 1],
  [1, 0, 1]
]

m3 =
[
  [1, 1, 1, 1],
  [0, 1, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
]

# rotate(m1)
# rotate(m2)
rotate(m3)
