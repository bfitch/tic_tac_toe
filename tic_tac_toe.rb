require 'observer'
require 'pp'

class TicTacToe
  def initialize
    screen = Screen.new self
    screen.draw "Tic Tac Toe"
    screen.read
  end

  def update(coordinate, value)
    coordinate = Coordinate.new *coordinate.scan(/\w/)
    cell       = Cell.new(coordinate, value)
    board      = Board.new.set(cell)
    pp board
    # screen.draw View.set board
  end
end

class Screen
  include Observable

  def initialize(observer)
    add_observer(observer)
  end
   
  def read
    loop do
      coordinate, value = gets.split(' ')
      changed 
      notify_observers(coordinate, value.chomp)
    end
    sleep 1
  end

  def draw(data)
    puts data
  end
end

#|----|----|----|
#|    |    |    |
#|----|----|----|
#|    |    |    |
#|----|----|----|
#|    |    |    |
#|----|----|----|

class Board
  include Enumerable

  PAIRS = [ '0c', '1c', '2c',
            '0b', '1b', '2b',
            '0a', '1a', '2a' ]

  def set(cell)
    build
    @board << cell if @board.delete(cell)
  end

  def build
    @board = coordinates.each_with_object([]) do |coordinate, acc|
      acc << Cell.new(coordinate, false)
    end
  end

  def each
    build.each { |cell| yield cell }
  end

  private

  def coordinates
    PAIRS.map { |coordinate| Coordinate.new(*coordinate.scan(/\w/)) }
  end
end


class Cell
  attr_reader :coordinate

  def initialize(coordinate, value)
    @coordinate = coordinate
    @value      = to_boolean(value)
  end

  def to_boolean(value)
    if value == "x"
      return true
    else
      return false
    end
  end

  def <=>(object)
    coordinate <=> object.coordinate
  end
end

class Coordinate
  include Comparable

  attr_reader :x, :y

  def initialize(x,y)
    @x, @y = x,y
  end

  def <=>(object)
    if (x == object.x) && (y == object.y)
      0
    elsif (x >= object.x) && (y >= object.y)
      1
    else
      -1
    end
  end

    # if (x > object.x) && (y > object.y)
    #   1
    # elsif (x > object.x) && (y >= object.y)
    #   1
    # elsif (x >= object.x) && (y > object.y)
    #   1
    # elsif (x == object.x) && (y == object.y)
    #   0
    # else
    #   -1
    # end
end

TicTacToe.new
