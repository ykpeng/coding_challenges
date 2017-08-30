# Design an algorithm to figure out if someone has won a game of tic-tac-toe.

def won?(board)
  row_won = false
  col_won = false

  (0..2).each do |row|
    if row_won?(board, row)
      row_won = true
    end
  end

  (0..2).each do |col|
    if col_won?(board, col)
      col_won = true
    end
  end

  row_won || col_won || left_diag_won?(board) || right_diag_won?(board)
end

def row_won?(board, row)
  (1..2).each do |i|
    if board[row][i] != board[row][i - 1]
      return false
    end
  end
  true
end

def col_won?(board, col)
  (1..2).each do |i|
    if board[i][col] != board[i - 1][col]
      return false
    end
  end
  true
end

def left_diag_won?(board)
  (1..2).each do |i|
    if board[i][i] != board[i - 1][i - 1]
      return false
    end
  end
  true
end

def right_diag_won?(board)
  (1..2).each do |i|
    j = 2 - i
    if board[i][j] != board[i - 1][j + 1]
      return false
    end
  end
  true
end

# Object-oriented solution
class Check
  def initialize(row, col, row_i, col_i)
    @row = row
    @col = col
    @row_i = row_i
    @col_i = col_i
  end

  def increment
    row += @row_i
    col += @col_i
  end

  def inbounds(size)
    @row >= 0 && @col >= 0 && @row < size && @col < size
  end
end

def has_won?(board)
  if board.length != board[0].length
    return nil
  end
  size = board.length

  instructions = []
  (0...size).each do |i|
    instructions << Check.new(0, i, 1, 0)
    instructions << Check.new(i, 0, 0, 1)
  end
  instructions << Check.new(0, 0, 1, 1)
  instructions << Check.new(0, size - 1, 1, -1)

  instructions.each do |instr|
    winner = _has_won?(board, instr)
    if !winner.nil?
      return winner
    end
  end

  nil
end

def _has_won?(board, instr)
  first = board[instr.row][instr.col]
  while instr.inbounds(board.length)
    if board[instr.row][instr.col] != first
      return nil
    end
    instr.increment
  end
  first
end
