require "observer"
require "set"

class TicTacToe
  def initialize
    screen = Screen.new self
    screen.draw "Tic Tac Toe"
    screen.read
  end

  def update(args)
    position, value = args.split(' ')
    puts "=> #{position}, #{value}"

    cell  = Cell.new(position, value)
    board = Board.new.set(cell)
    p board
    # screen.draw View.set board
  end
end

#|----|----|----|
#|    |    |    |
#|----|----|----|
#|    |    |    |
#|----|----|----|
#|    |    |    |
#|----|----|----|

class Cell
  attr_reader :position

  def initialize(position, value)
    @position = position
    @value    = to_boolean(value)
  end

  def to_boolean(value)
    if value == "x"
      return true
    else
      return false
    end
  end

  def ==(object)
    position == object.position
  end
end


class Board
  POSITIONS = [ '02', '12', '22',
                '01', '11', '21',
                '00', '10', '20' ]

  def set(cell)
    build
    @board << cell if @board.delete(cell)
  end

  def build
    @board = POSITIONS.inject([]) do |acc, position |
      acc << Cell.new(position, false)
      acc
    end
  end
end


class Screen
  include Observable

  def initialize(observer)
    add_observer(observer)
  end
   
  def read
    loop do
      changed 
      notify_observers(gets.chomp)
    end
    sleep 1
  end

  def draw(data)
    puts data
  end
end

TicTacToe.new
