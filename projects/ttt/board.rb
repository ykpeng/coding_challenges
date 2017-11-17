class Board
  attr_reader :grid

  def self.blank_grid
    Array.new(3) { Array.new(3) }
  end

  def initialize(grid = self.class.blank_grid)
    @grid = grid
    debugger
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    if empty?(pos)
      @grid[row][col] = mark
    else
      raise "Already occupied!"
    end
  end

  def over?
    won? || tied?
  end

  def winner
    row_won? || col_won? || diag_won?
  end

  def won?
    !!winner
  end

  def tied?
    return false if won?

    @grid.all? do |row|
      row.none? { |el| el.nil? }
    end
  end

  def empty?(pos)
    row, col = pos
    @grid[row][col].nil?
  end

  def dup
    new_grid = @grid.map(&:dup)
    self.class.new(new_grid)
  end

  private

  def row_won?
    (0..2).any? do |row|
      if has_winner?(@grid[row][0], @grid[row][1], @grid[row][2])
        return @grid[row][0]
      end
    end

    false
  end

  def col_won?
    (0..2).any? do |col|
      if has_winner?(@grid[0][col], @grid[1][col], @grid[2][col])
        return @grid[0][col]
      end
    end

    false
  end

  def diag_won?
    if has_winner?(@grid[0][0], @grid[1][1], @grid[2][2])
      return @grid[1][1]
    end
    if has_winner?(@grid[0][2], @grid[1][1], @grid[2][0])
      return @grid[1][1]
    end

    false
  end

  def has_winner?(mark1, mark2, mark3)
    return false if mark1.nil?

    mark1 == mark2 && mark2 == mark3
  end
end
