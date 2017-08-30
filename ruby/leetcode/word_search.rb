# @param {Character[][]} board
# @param {String} word
# @return {Boolean}

class Cell
  attr_accessor :val, :neighbors

  def initialize(val, neighbors = [], visited = false)
    @val = val
    @neighbors = neighbors
    @visited = visited
  end

  def visited?
    @visited == true
  end

  def visit
    @visited = true
  end

  def unvisit
    @visited = false
  end
end

def process_board(board)
  num_rows = board.length
  num_cols = board[0].length
  processed_board = Array.new(num_rows) { Array.new }

  (0...num_rows).each do |row|
    (0...num_cols).each do |col|
      val = board[row][col]
      cell = Cell.new(val)
      processed_board[row][col] = cell

      if in_bounds(row - 1, col, num_rows, num_cols)
        neighbor = processed_board[row - 1][col]
        cell.neighbors << neighbor
        neighbor.neighbors << cell
      end

      if in_bounds(row, col - 1, num_rows, num_cols)
        neighbor = processed_board[row][col - 1]
        cell.neighbors << neighbor
        neighbor.neighbors << cell
      end
    end
  end

  processed_board.flatten
end

def in_bounds(row, col, num_rows, num_cols)
  row.between?(0, num_rows - 1) && col.between?(0, num_cols - 1)
end

def contains_word(cells, word, i = 0)
  if i == word.length
    return true
  end

  cells.each do |cell|
    if !cell.visited? && cell.val == word[i]
      cell.visit
      if contains_word(cell.neighbors, word, i + 1)
        return true
      else
        cell.unvisit
      end
    end
  end

  false
end

def exist(board, word)
  contains_word(process_board(board), word)
end
