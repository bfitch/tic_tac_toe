class BoardView
  def initialize(board)
    @board = board
  end

  def render
    header + rows + footer
    PlayerView.render
  end

  private

  def header
    "               a             b             c     \n"
  end

  def rows
    rows = ""
    board.each_row_with_index { |row, i| rows += row(row,i) }
    rows
  end

  def row(r, i)
    <<-BOARD
        |-------------|-------------|-------------|
        |             |             |             |
        |             |             |             |
     #{i}  | #{r[0].owner} | #{r[1].owner} | #{r[2].owner} |
        |             |             |             |
        |             |             |             |
    BOARD
  end

  def footer
    "        |-------------|-------------|-------------|\n"
  end
  

  def board
    @board
  end
end

class PlayerView
  def self.render
    if TicTacToe.current_player == 'P1'
      'PLAYER 1: '
    else
      'PLAYER 2: '
    end
  end
end

class VictoryView
  def initialize(board)
    @board = board
  end

  def render
    "YA WON!"
  end
end
