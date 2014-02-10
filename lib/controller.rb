class Controller #Controller for now
  def initialize
    @screen = Screen.new self
    @screen.draw "Tic Tac Toe"
    @screen.draw "Player 1:"
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
