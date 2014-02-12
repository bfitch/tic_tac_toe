require 'observer'
require 'forwardable'
require 'set'
require 'pp'

require_relative 'board'
require_relative 'cell'
require_relative 'cells'
require_relative 'controller'
require_relative 'coordinate'
require_relative 'screen'
require_relative 'view'

class TicTacToe
  PLAYER_ONE = :P1
  PLAYER_TWO = :P2

  @turn = 0

  def self.current_player
    @turn.even? ? PLAYER_ONE : PLAYER_TWO
  end

  def self.next_turn
    @turn = @turn + 1
  end

  def initialize
    Controller.new
  end
end
