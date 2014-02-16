class ViewFactory
  def initialize(game_state, board)
    @game_state = game_state
    @board      = board
  end

  def get_view
    # if game_state.victory?
    #   VictoryView.new(board)
    # else
    View.new(board)
    # end
  end

  private

  def game_state
    @game_state
  end

  def board
    @board
    # Adapter.new(@board)
  end
end
