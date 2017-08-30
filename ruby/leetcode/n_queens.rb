# The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.
#
# Given an integer n, return all distinct solutions to the n-queens puzzle.
#
# Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space respectively.

# require 'set'
#
# def n_queens(board, n = board.length, res = [])
#   if n == 0
#     return res
#   end
#   # iterate through unattacked cells
#   # for each, try placing a queen
#   (0...board.length).each do |i|
#     (0...board.length).each do |j|
#       if !is_attacked?(board, [i, j])
#         board[i][j] = "Q"
#         next_queens = n_queens(board, n - 1)
#         if next_queens
#           res << board
#           return true
#         else
#           board[i][j] = "."
#         end
#       end
#     end
#   end
#   false
# end
#
# def is_attacked?(board, pos)
#   row, col = pos
#   # if any Q in col
#   (0...board.length).each do |i|
#     if board[i][col] == "Q"
#       return true
#     end
#   end
#
#   # if any Q in row
#   (0...board.length).each do |j|
#     if board[row][j] == "Q"
#       return true
#     end
#   end
#
#   # if any Q in diag
#   i, j = row, col
#   i -= 1
#   j -= 1
#   while i >= 0 && j >= 0
#     if board[i][j] == "Q"
#       return true
#     end
#     i -= 1
#     j -= 1
#   end
#
#   i, j = row, col
#   i += 1
#   j += 1
#   while i < board.length && j < board.length
#     if board[i][j] == "Q"
#       return true
#     end
#     i += 1
#     j += 1
#   end
#
#   i, j = row, col
#   i += 1
#   j -= 1
#   while i < board.length && j >= 0
#     if board[i][j] == "Q"
#       return true
#     end
#     i += 1
#     j -= 1
#   end
#
#   i, j = row, col
#   i -= 1
#   j += 1
#   while i >= 0 && j < board.length
#     if board[i][j] == "Q"
#       return true
#     end
#     i -= 1
#     j += 1
#   end
#
#   false
# end
#
# def set_up_board(n)
#   Array.new(n) { Array.new(n, ".") }
# end
#
# def solve_n_queens(n)
#   board = set_up_board(n)
#   boards = Set.new
#   (0...board.length).each do |i|
#     (0...board.length).each do |j|
#       board = set_up_board(n)
#       board[i][j] = "Q"
#       if n_queens(board, n - 1)
#         boards << board
#       end
#     end
#   end
#   format_boards(boards)
# end
#
# def format_boards(boards)
#   boards.map do |board|
#     board.map do |row|
#       row.join("")
#     end
#   end
# end

# board = set_up_board(4)
# p n_queens(board)
# p board
# p solve_n_queens(4)

def place_queens(row = 0, columns, results)
  n = columns.length
  if row == n
    results << columns.dup
  else
    (0...n).each do |col|
      if check_valid(columns, row, col)
        columns[row] = col
        place_queens(row + 1, columns, results)
      end
    end
  end
end

def check_valid(columns, row1, column1)
  (0...row1).each do |row2|
    column2 = columns[row2]

    if column1 == column2
      return false
    end

    column_distance = (column2 - column1).abs

    row_distance = row1 - row2
    if column_distance == row_distance
      return false
    end
  end
  true
end

# def solve_n_queens(n)
#   res = []
#   place_queens(0, Array.new(5), res)
#   res.map do |columns|
#     columns.map do |col|
#       row = "." * n
#       row[col] = "Q"
#     end
#   end
#   res
# end

# res = []
# place_queens(0, Array.new(5), res)
# p res
p solve_n_queens(4)
