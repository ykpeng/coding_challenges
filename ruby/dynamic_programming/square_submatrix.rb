def square_submatrix(matrix)
  max = 0

  (0...matrix.length).each do |i|
    (0...matrix[0].length).each do |j|
      if matrix[i][j]
        curr_max = _square_submatrix(matrix, i, j)
        if curr_max > max
          max = curr_max
        end
      end
    end
  end

  max
end

def _square_submatrix(matrix, i, j)
  if i == matrix.length || j == matrix[0].length
    return 0
  end

  if !matrix[i][j]
    return 0
  end

  prev_size = [
    _square_submatrix(matrix, i + 1, j),
    _square_submatrix(matrix, i, j + 1),
    _square_submatrix(matrix, i + 1, j + 1)
  ].min

  prev_size + 1
end

def square_submatrix2(matrix)
  max = 0

  (0...matrix.length).each do |i|
    (0...matrix[0].length).each do |j|
      if matrix[i][j]
        curr_max = _square_submatrix(matrix, i, j)
        if curr_max > max
          max = curr_max
        end
      end
    end
  end

  max
end

def _square_submatrix2(matrix, i, j, memo = Array.new(matrix.length) { Array.new(matrix[0].length)} )
  if i == matrix.length || j == matrix[0].length
    return 0
  end

  if !matrix[i][j]
    return 0
  end

  if !memo[i][j]
    prev_size = [
      _square_submatrix2(matrix, i + 1, j),
      _square_submatrix2(matrix, i, j + 1),
      _square_submatrix2(matrix, i + 1, j + 1)
    ].min

    memo[i][j] = prev_size + 1
  end

  memo[i][j]
end

def square_submatrix3(matrix)
  max = 0

  memo = Array.new(matrix.length) { Array.new(matrix[0].length) }
  (0...matrix.length).each do |i|
    (0...matrix[0].length).each do |j|
      if !matrix[i][j]
        memo[i][j] = 0
      else
        if i == 0 || j == 0
          prev_size = 0
        else
          prev_size = [
            memo[i - 1][j],
            memo[i][j - 1],
            memo[i - 1][j - 1]
          ].min
        end

        memo[i][j] = prev_size + 1
        if memo[i][j] > max
          max = memo[i][j]
        end
      end
    end
  end

  max
end

matrix = [
  [true, true, false, false],
  [true, true, true, true],
  [false, true, false, false]
]

p square_submatrix3(matrix)
