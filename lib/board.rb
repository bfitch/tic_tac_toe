class Board
  include Enumerable
  extend Forwardable

  def_delegators :@cells, :rows, :columns, :diagonals

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


