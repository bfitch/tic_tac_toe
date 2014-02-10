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
