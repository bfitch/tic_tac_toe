class Cells
  extend Forwardable

  COLUMNS = %w{ a b c }
  ROWS    = %w{ 0 1 2 }
  PAIRS   = %w{ a0 b0 c0
                a1 b1 c1
                a2 b2 c2 }

  def_delegators :@models, :each, :<<, :delete, :select

  attr_reader :cell, :coordinate, :models

  def initialize(cell = Cell, coordinate = Coordinate)
    @cell       = cell
    @coordinate = coordinate
    build
  end

  def build
    @models = coordinates.each_with_object(SortedSet.new) do |coordinate, acc|
      acc << cell.new(coordinate, nil)
    end
  end

  def rows
    ROWS.map do |number|
      @models.select { |cell| cell.row == number }
    end
  end

  def columns
    COLUMNS.map do |char|
      @models.select { |cell| cell.column == char }
    end
  end

  def diagonals
    diagonal_1 = COLUMNS.zip('0'..'2')
    diagonal_2 = COLUMNS.reverse.zip('0'..'2')

    [diagonal_1, diagonal_2].map do |diagonal|
      (@models & diagonal.map { |pair| Cell.new(Coordinate.new(*pair),nil) }).to_a
    end
  end

  private

  def coordinates
    PAIRS.map { |pair| coordinate.new(*pair.scan(/\w/)) }
  end
end
