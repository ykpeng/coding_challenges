# Write a program to solve a Sudoku puzzle by filling the empty cells.
#
# Empty cells are indicated by the character '.'.
#
# You may assume that there will be only one unique solution.

# time: num_empty_cells! * 9! ?
# space: 1

def solve_sudoku(board)
  (0...board.length).each do |i|
    (0...board.length).each do |j|
      if board[i][j].nil?
        (1..9).each do |num|
          if valid?(board, num, [i, j])
            board[i][j] = num
            if !solve_sudoku(board)
              board[i][j] = nil
            end
          end
        end
        return false if board[i][j].nil?
      end
    end
  end
  true
end

def valid?(board, num, pos)
  row, col = pos
  # check row
  (0...board.length).each do |j|
    if board[row][j] == num
      return false
    end
  end

  # check col
  (0...board.length).each do |i|
    if board[i][col] == num
      return false
    end
  end

  # check subsquare
  row_start = (row / 3) * 3
  col_start = (col / 3) * 3
  (row_start...row_start + 3).each do |i|
    (col_start...col_start + 3).each do |j|
      if board[i][j] == num
        return false
      end
    end
  end

  true
end

p solve_sudoku(board)
render(board)
