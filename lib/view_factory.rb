class ViewFactory
  def initialize(rulebook)
    @rulebook = rulebook
  end

  def get_view
    # if rulebook.victory?
    #   VictoryView.new(rulebook.board)
    # else
    BoardView.new(rulebook.board)
    # end
  end

  private

  def rulebook
    @rulebook
  end
end
