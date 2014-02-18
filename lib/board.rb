class Board
  include Enumerable
  extend Forwardable

  def_delegators :@cells, :rows, :columns, :diagonals, :[]

  def initialize(cells)
    @cells = cells
  end

  def set(cell)
    cells << cell if cells.delete(cell)
  end

  def each
    cells.each { |cell| yield cell }
  end

  def each_row_with_index
    cells.rows.each_with_index { |row,i| yield(row, i) }
  end

  private

  def cells
    @cells
  end
end


