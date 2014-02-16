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

    TicTacToe.next_turn unless game_state.victory?
    
    screen.draw view.render
  end

  private

  def view
    ViewFactory.new(game_state, board).get_view
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

  def game_state
    GameState.new(rulebook)
  end

  def current_player
    game_state.current_player
  end
end

class GameState
  extend Forwardable

  def_delegators :@rulebook, :winning_column?,
    :winning_row?, :winning_diagonal?

  def current_player
    TicTacToe.current_player
  end

  def initialize(rulebook)
    @rulebook = rulebook
  end

  def victory?
    winning_column? || winning_row? || winning_diagonal?
  end

  def cats_game? #how does this work?
  end
end

class Rulebook
  def initialize(board)
    @board = board
  end

  def winning_column?
    board.columns.select { |column| matching?(column) }.any?
  end

  def winning_row?
    board.rows.select { |row| matching?(row) }.any?
  end

  def winning_diagonal?
    board.diagonals { |diagonal| matching?(diagonal) }.any?
  end

  private

  def matching?(collection)
    collection.all?(&:player_one?) ||
      collection.all?(&:player_two?)
  end

  def board
    @board
  end
end
