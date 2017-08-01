# Write an algorithm such that if an aelement in an MxN matrix is 0, its entire row and colum are set to 0.

# time: nm
# space: m+n
require 'set'
def set_to_zero1(matrix)
  rows = Set.new
  cols = Set.new

  matrix.each_with_index do |row, i|
    row.each_with_index do |el, j|
      if el == 0
        rows << i
        cols << j
      end
    end
  end

  matrix.each_with_index do |row, i|
    row.each_with_index do |el, j|
      if rows.include?(i) || cols.include?(j)
        matrix[i][j] = 0
      end
    end
  end

  matrix
end

# p set_to_zero1(matrix)

# time: nm
# space: n+m
def set_to_zero2(matrix)
  rows = Set.new
  cols = Set.new

  matrix.each_with_index do |row, i|
    row.each_with_index do |el, j|
      if el == 0
        rows << i
        cols << j
      end
    end
  end

  rows.each do |i|
    nullify_row(matrix, i)
  end

  cols.each do |j|
    nullify_col(matrix, j)
  end

  matrix
end

def nullify_row(matrix, i)
  matrix[i].each_with_index do |el, j|
    matrix[i][j] = 0
  end
end

def nullify_col(matrix, j)
  0.upto(matrix.length - 1) do |i|
    matrix[i][j] = 0
  end
end

# p set_to_zero2(matrix)

# time: mn
# space: 1
def set_to_zero3(matrix)
  row_has_zero = false
  col_has_zero = false

  matrix[0].each_with_index do |el, j|
    if el == 0
      row_has_zero = true
    end
  end

  0.upto(matrix.length - 1) do |i|
    if matrix[i][0] == 0
      col_has_zero = true
    end
  end

  1.upto(matrix.length - 1) do |i|
    1.upto(matrix[0].length - 1) do |j|
      if matrix[i][j] == 0
        matrix[0][j] = 0
        matrix[i][0] = 0
      end
    end
  end

  1.upto(matrix.length - 1) do |i|
    1.upto(matrix[0].length - 1) do |j|
      if matrix[0][j] == 0 || matrix[i][0] == 0
        matrix[i][j] = 0
      end
    end
  end

  if row_has_zero
    matrix[0].each_with_index do |el, j|
      matrix[0][j] = 0
    end
  end

  if col_has_zero
    0.upto(matrix.length - 1) do |i|
      matrix[i][0] = 0
    end
  end

  matrix
end

matrix = [
  [0,2,3],
  [4,5,6],
  [7,8,0]
]

p set_to_zero3(matrix)
