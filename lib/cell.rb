class Cell
  extend Forwardable

  def_delegators :@coordinate, :column, :row, :hash

  attr_reader :coordinate

  def initialize(coordinate, owner)
    @coordinate = coordinate
    @owner      = owner
  end

  def player_one?
    @owner == TicTacToe::PLAYER_ONE
  end

  def player_two?
    @owner == TicTacToe::PLAYER_TWO
  end

  def <=>(object)
    coordinate <=> object.coordinate
  end

  def ==(object)
    coordinate == object.coordinate
  end
  alias_method :eql?, :==
end
