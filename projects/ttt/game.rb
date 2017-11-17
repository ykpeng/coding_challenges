require_relative 'board'
require_relative 'player'
require_relative 'ttt_node'
require 'byebug'

class Game
  attr_reader :board

  def initialize(player1, player2)
    @board = Board.new
    @players = { x: player1, o: player2 }
    @turn = :x
  end

  def play
    while !@board.over?
      play_turn
    end

    if @board.won?
      announce_winner
    else
      announce_tie
    end
  end

  def show
    @board.grid.each do |row|
      p row
    end
  end

  private
  def place_mark(pos, mark)
    if @board.empty?(pos)
      @board[pos] = mark
      true
    else
      false
    end
  end

  def play_turn
    curr_player = @players[@turn]

    while true
      pos = curr_player.move(self, @turn)

      break if place_mark(pos, @turn)
    end

    switch_turns
  end

  def switch_turns
    if @turn == :x
      @turn = :o
    else
      @turn = :x
    end
  end

  def announce_winner
    winning_player = @players[@board.winner]
    puts "#{winning_player.name} won!"
  end

  def announce_tie
    puts "Game tied"
  end
end

if __FILE__ == $PROGRAM_NAME
  player1 = HumanPlayer.new("Yi-Ke")
  player2 = ComputerPlayer.new("Hal")
  game = Game.new(player1, player2)
  game.play
end
