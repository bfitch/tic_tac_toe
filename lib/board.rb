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

  def rows
    Cells::ROWS.map do |number|
      cells.select { |cell| cell.row == number }
    end
  end

  def each_column
    Cells::COLUMNS.each do |char|
      yield cells.select { |cell| cell.column == char }
    end
  end

  def each_diagonal
    cells.diagonals.each { |diagonal| yield diagonal }
  end

  private

  def cells
    @cells
  end
end


