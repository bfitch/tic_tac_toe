class Rulebook
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def victory?
    winning_column? || winning_row? || winning_diagonal?
  end

  def cats_game? #how does this work?
  end

  def winning_column?
    board.columns.select { |column| matching?(column) }.any?
  end

  def winning_row?
    board.rows.select { |row| matching?(row) }.any?
  end

  def winning_diagonal?
    board.diagonals.select { |diagonal| matching?(diagonal) }.any?
  end

  private

  def matching?(collection)
    collection.all?(&:player_one?) ||
      collection.all?(&:player_two?)
  end
end
