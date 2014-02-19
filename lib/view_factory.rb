class ViewBuilder
  def initialize(rulebook)
    @rulebook = rulebook
  end

  def render
    views.each_with_object("") { |view, views| views << view.render }
  end

  private

  def views
    [board_view, player_view, victory_view].compact
  end

  def board_view
    BoardView.new(rulebook.board)
  end

  def player_view
    PlayerView.new unless rulebook.victory?
  end

  def victory_view
    VictoryView.new(rulebook.board) if rulebook.victory?
  end

  def rulebook
    @rulebook
  end
end
