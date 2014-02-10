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


