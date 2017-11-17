class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class HumanPlayer < Player
  def move(game, mark)
    game.show

    while true
      puts "#{@name}, enter your next move:"
      coords = gets.chomp.split(",").map(&:to_i)

      if self.class.valid_coords?(coords)
        return coords
      else
        puts "Invalid coordinate!"
      end
    end
  end

  private
  def self.valid_coords?(coords)
    coords.all? { |coord| (0..2).include?(coord) }
  end
end

class ComputerPlayer < Player
  def move(game, mark)
    node = TTTNode.new(game.board, mark)

    node.children.each do |child|
      if child.winning_node?(mark)
        return child.prev_move_pos
      end
    end

    node.children.each do |child|
      if !child.losing_node?(mark)
        return child.prev_move_pos
      end
    end

    raise "Game cannot be won"
  end
end
