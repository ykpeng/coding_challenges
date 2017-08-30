# Imagine you have a square matrix, where each cell (pixel) is either black or white. Design an algorithm to find the maximum subsquare such that all four borders are filled with black pixels.

def is_square?(board, row_start, col_start, size)
  (col_start...col_start + size).each do |j|
    return false if board[row_start][j] != "black"
  end

  (col_start...col_start + size).each do |j|
    return false if board[row_start + size - 1][j] != "black"
  end

  (row_start + 1...row_start + size - 1).each do |i|
    return false if board[i][col_start] != "black"
  end

  (row_start + 1...row_start + size - 1).each do |i|
    return false if board[i][col_start + size - 1] != "black"
  end

  true
end

def find_square_with_size(board, size)
  (0..board.size - size).each do |i|
    (0..board.size - size).each do |j|
      if is_square?(board, i, j, size)
        return i, j, size
      end
    end
  end
  nil
end

def find_square(board)
  (board.length..1).each do |size|
    res = find_square_with_size(board, size)
    if res
      return res
    end
  end
  nil
end

class Cell
  attr_accessor :num_right, :num_down

  def initialize(num_right = 0, num_down = 0)
    @num_right = num_right
    @num_right = num_down
  end
end

def process_board(board)
  (board.length - 2..0).each do |i|
    (board.length - 2..0).each do |j|
      if board[i][j + 1] == "black"
        board[i][j].num_right = 1 + board[i][j + 1].num_right
      end
      if board[i + 1][j] == "black"
        board[i][j].num_down = 1 + board[i + 1][j].num_down
      end
    end
  end
end
