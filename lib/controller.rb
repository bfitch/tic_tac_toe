class Controller
  def initialize
    screen.draw view.render
    screen.read
  end

  def update(coordinate)
    #add Adapter here to convert screen input to expected args

    coordinate = Coordinate.new *coordinate.scan(/\w/) # only vaildate Coordinate
    cell       = Cell.new(coordinate, current_player)

    # if input valid - Validation mixin or something?
    #

    board.set(cell)

    TicTacToe.next_turn #unless game_state.victory?
    
    screen.draw view.render
  end

  private

  def view
    ViewFactory.new(rulebook).get_view
  end

  def screen
    @screen ||= Screen.new(self)
  end

  def cells
    @cells ||= Cells.new
  end

  def board
    @board ||= Board.new(cells)
  end

  def rulebook
    Rulebook.new(board)
  end

  def current_player
    TicTacToe.current_player
  end
end
