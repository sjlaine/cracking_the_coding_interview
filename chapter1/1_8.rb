#!/usr/bin/env ruby

def print(matrix)
  row = 0

  while(row < matrix.length)
    p matrix[row]
    row += 1
  end

  puts "\n\n"
end

def set_zeros(matrix)
  row = 0
  col = 0
  coord = {}

  print(matrix)

  # track the location of zeros
  while(row < matrix.length)
    while(col < matrix.length)
      if(matrix[row][col] == 0)
        coord[row.to_s.to_sym] = col
      end

      col += 1
    end

    col = 0
    row += 1
  end

  # set rows
  coord.keys.each do |row|
    current = matrix[row.to_s.to_i]
    idx = 0

    while(idx < current.length)
      current[idx] = 0

      idx += 1
    end
  end

  # set cols
  coord.values.each do |col|
    matrix.each { |row| row[col] = 0 }
  end

  print(matrix)
end

def set_zeros_optimized(matrix)
  row = 0
  col = 0
  coord = {}

  print(matrix)

  # track the location of zeros
  while(row < matrix.length)
    while(col < matrix.length)
      if(matrix[row][col] == 0)
        # set the first el of the row and the top el of the col to
        # be cleared to zero
        matrix[0][col] *= 0
        matrix[row][0] *= 0
      end

      col += 1
    end

    col = 0
    row += 1
  end

  # set rows
  matrix.each_with_index do |row, idx|
    next if idx == 0
    next if(row[0] != 0)

    i = 1
    while(i < row.length)
      row[i] = 0
      i += 1
    end
  end

  # set cols
  matrix[0].each_with_index do |col, idx|
    next if idx == 0
    if(col == 0)
      matrix.each { |row| row[idx] = 0 }
    end
  end

  # set row 0 if has zero
  if(row[0] == 0)
    i = 1
    while(i < matrix[0].length)
      matrix[0][i] = 0
      i += 1
    end
  end

  print(matrix)
end

m = [
  [1, 2, 0],
  [8, 9, 0],
  [1, 0, 3],
  [8, 9, 1],
  [1, 0, 3],
  [9, 9, 1]
]

# expected
# r = [
#   [1, 0, 0],
#   [0, 0, 0],
#   [0, 0, 0],
#   [8, 0, 0],
#   [0, 0, 0],
#   [9, 0, 0]
# ]

# set_zeros(m)
set_zeros_optimized(m)
