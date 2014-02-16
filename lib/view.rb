class View
  def initialize(board)
    @b = board
  end

  def render
    template = <<-BOARD
             a         b         c
        |---------|---------|---------|
        |         |         |         |
      0 | <%= [0] %> | <%= [1] %> | <%= [2] %> |
        |        |         |         |
        |--------|---------|---------|
        |        |         |         |
      1 | <%= [3] %> | <%= [4] %> | <%= [2] %> |
        |        |         |         |
        |--------|---------|---------|
        |        |         |         |
      2 | <%= [6] %> | <%= [7] %> | <%= [8] %> |
        |         |         |         |
        |---------|---------|---------|
    BOARD

    renderer = ERB.new(template)
    renderer.result(b.get_binding)
  end

  private

  def b
    @b
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
