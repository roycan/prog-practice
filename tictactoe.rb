require "pry"
require "colorize"


=begin

I want to build the first true software engineering school in the Philippines.
Then I want to grow it. The other fields become aligned to lean toward the the software used in their fields.
They become masters of process. They think. They lay out their plans and make the world go round.

I'm going to make tick tack toe.
I need a board....

__|__|__
__|__\__
  |  |

  The board can have several states.

  _o|_x|_o
  __|__|__
    |  |


    __|__|__
    __|__\__
      |  |


      __|__|__
      __|__\__
        |  |

first task: create a board

i don't see how classes fit in yet.
I can have a method that creates the board given a certain configuration.
The board has to keep track of what it currently has on it.
So the board can be a class that can be accessed.

tictactoe is a 2 player game.
the players can be made into a class too.

the game will start with the empty board showing up
player 1 will be asked to pick a square from the lists of playable squares.
the playable squares are  1a, 1b, 1c, 2a, 2b, 2c, 3a, 3b and 3c
played squares disappear from the choices.
player1 will use x

then the board will update.
player 2 will be asked to place his choice
player 2 will use o
the game will continue until a winning board pattern is achieved

the following are winning patterns
- 1a 1b 1c
- 2a 2b 2c
- 3a 3b 3c
- 1a 2a 3a
- 1b 2b 3b
- 1c 2c 3c
- 1a 2b 3c
- 1c 2b 3a

how do we check for winning patterns?
we have to have a switch statement that evaluates the board after every turn.

a turn shall consist of the following
player1 entering a move
the move is checked if valid
if not valid, player1 is asked to choose another or forfiet
if valid, the board is updated
the board is checked if it's  a winning move (exit condition)
if not, player2 enters a move, with the same move sequence as player1
this goes on and on until a player forfiets or a player wins

the game starts.
class board gets initialized and shows an empty board to the screen.
class board has 9 locations initialized as a hash with "_"
these locations can later on become x or o
there is only 1 board, so I can just use class methods, but I'd rather initialize
there is a method #win? that returns x or o or _
the board has a method #allowed_moves which selects locations with "_"

class player gets initialized with playerx and playero
these are actually not necessary as the board keeps track of the state and
   winning is memoryless.
nonetheless, the players will have an array of moves pushed
the player class will have a method move, which gets the players move

after initializing the board and the two players,
the game will loop over
exit?
playerx move
board update
win?
exit?
playero move
board update
win?

i think it would be better to make it loop over:
exit?
player move
board update
win?
player = next

=end


class Board
  # print the blank board and set it as current board

  attr_reader :current_board, :available_moves

  def initialize
    @current_board = " __|__|__\n __|__|__\n   |  |  \n\n"
    @available_moves = %w(a1 a2 a3 b1 b2 b3 c1 c2 c3)
  end

  def move(p, m)

    case p
    when :a1 then @current_board[2] = m
    when :a2 then @current_board[12] = m
    when :a3 then @current_board[22] = m
    when :b1 then @current_board[5] = m
    when :b2 then @current_board[15] = m
    when :b3 then @current_board[25] = m
    when :c1 then @current_board[8] = m
    when :c2 then @current_board[18] = m
    when :c3 then @current_board[28] = m
    end

    @available_moves.delete(p.to_s)
  end



end


class Player
  attr_accessor :marker

  def initialize(marker)
    @moves = Array.new
    @marker = marker
  end

  def play(position, board)
    board.move(position, @marker)
    @moves << position
    puts "Player #{@marker} wins! " if self.win?
    @moves
  end

  def win?
    case
    when @moves.include?(:a1) && @moves.include?(:a2) && @moves.include?(:a3)
      true
    when @moves.include?(:b1) && @moves.include?(:b2) && @moves.include?(:b3)
      true
    when @moves.include?(:c1) && @moves.include?(:c2) && @moves.include?(:c3)
      true
    when @moves.include?(:a1) && @moves.include?(:b1) && @moves.include?(:c1)
      true
    when @moves.include?(:a2) && @moves.include?(:b2) && @moves.include?(:c2)
      true
    when @moves.include?(:a3) && @moves.include?(:b3) && @moves.include?(:c3)
      true
    when @moves.include?(:a1) && @moves.include?(:b2) && @moves.include?(:c3)
      true
    when @moves.include?(:a3) && @moves.include?(:b2) && @moves.include?(:c1)
      true
    else false
    end
  end

end


### begin game ###

p b = Board.new
px = Player.new("x")
po = Player.new("o")

# puts b.current_board
# p px.play(:a1, b)
# puts b.current_board
# p po.play(:b1, b)
# puts b.current_board
# # binding.pry
# p px.play(:a2, b)
# puts b.current_board
# p po.play(:b2, b)
# puts b.current_board
# p px.play(:a3, b)
# puts b.current_board
# p po.play(:b3, b)
# puts b.current_board
# p px.play(:c1, b)
# puts b.current_board
# p po.play(:c2, b)
# puts b.current_board
# p px.play(:c3, b)
# puts b.current_board
# p px.win?
# p po.win?
#
#
# b.reset_board()


def take_turn(player, board)
  move = ""
  until board.available_moves.include?(move.to_s) do
    puts board.current_board.red
    puts "that move is not available, please choose another"
    puts "available moves:  #{board.available_moves.join(", ")} "
    move = gets.strip.downcase.to_sym
    p move
    exit if move.downcase.to_sym == :x
  end


  player.play(move,board)
end


puts "This is blue".colorize(:blue)
puts "This is light blue".colorize(:light_blue)
puts "This is also blue".colorize(:color => :blue)
puts "This is light blue with red background".colorize(:color => :light_blue, :background => :red)
puts "This is light blue with red background".colorize(:light_blue ).colorize( :background => :red)
puts "This is blue text on red".blue.on_red
puts "This is red on blue".colorize(:red).on_blue
puts "This is red on blue and underline".colorize(:red).on_blue.underline
puts "This is blue text on red".blue.on_red.blink
puts "This is uncolorized".blue.on_red.uncolorize


String.colors                       # return array of all possible colors names
String.modes                        # return array of all possible modes
String.color_samples



loop do
  take_turn(px, b)
  # px.play(move, b)
  take_turn(po, b)

end
