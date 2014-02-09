require 'observer'
require 'forwardable'
require 'set'
require 'pp'

class TicTacToe #Controller for now
  def initialize
    @screen = Screen.new self
    @screen.draw "Tic Tac Toe"
    @screen.read
  end

  def update(coordinate, value)
    board      = Board.new(cells)

    coordinate = Coordinate.new *coordinate.scan(/\w/)
    cell       = Cell.new(coordinate, value)

    board.set(cell)
    @screen.draw View.new(board).render
  end

  private

  def cells
    Cells.new
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

class View
  def initialize(board)
    @board = board
  end

  def render
    <<-BOARD
          a    b    c
        |----|----|----|
      0 |    |    |    |
        |----|----|----|
      1 |    |    |    |
        |----|----|----|
      2 |    |    |    |
        |----|----|----|
    BOARD
  end
end

class Coordinate
  include Comparable

  attr_reader :x, :y

  def initialize(x,y)
    @x, @y = x,y
  end

  def <=>(object)
    if value < object.value
      -1
    elsif value == object.value
      0
    elsif value > object.value
      1
    end
  end

  def value
    (@y + @x).hex
  end
end

class Cell
  attr_reader :coordinate

  def initialize(coordinate, value)
    @coordinate = coordinate
    @value      = to_boolean(value) #handle this better
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

  def ==(object)
    coordinate == object.coordinate
  end
end

class Cells
  extend Forwardable

  PAIRS = %w{ a0 b0 c0
              a1 b1 c1
              a2 b2 c2 }

  def_delegators :@models, :each, :<<, :delete

  attr_reader :cell, :coordinate

  def initialize(cell = Cell, coordinate = Coordinate)
    @cell       = cell
    @coordinate = coordinate
    build
  end

  def build
    @models = coordinates.each_with_object([]) do |coordinate, acc|
      acc << cell.new(coordinate, false)
    end
  end

  private

  def coordinates
    PAIRS.map { |pair| coordinate.new(*pair.scan(/\w/)) }
  end
end

class Board
  include Enumerable

  def initialize(cells)
    @cells = cells
  end

  def set(cell)
    cells << cell if cells.delete(cell)
  end

  def each
    cells.each { |cell| yield cell }
  end

  private

  def cells
    @cells
  end
end


TicTacToe.new
