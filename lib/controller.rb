class Controller
  def initialize
    screen.draw "Tic Tac Toe"
    screen.draw "Player 1:"
    screen.read
  end

  def update(coordinate, value)
    #add Adapter here to convert screen input to expected args

    coordinate = Coordinate.new *coordinate.scan(/\w/) # only vaildate Coordinate
    cell       = Cell.new(coordinate, current_player)

    # if input valid - Validation mixin or something?
    #

    board.set(cell)

    # TicTacToe.next_turn
    
    screen.draw #View.new(board).render
    #replace with ViewBuilder(game_state)
    # builder decides which view to render based on the game state
  end

  private

  def screen
    @screen ||= Screen.new(self)
  end

  def cells
    @cells ||= Cells.new
  end

  def board
    @board ||= Board.new(cells)
  end

  def current_player
    TicTacToe.current_player
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
    board.each_column { |column| matching?(column) }
  end

  def winning_row?
    !board.rows.select { |row| matching?(row) }.empty?
  end

  def winning_diagonal?
    board.each_diagonal { |diagonal| matching?(diagonal) }
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
