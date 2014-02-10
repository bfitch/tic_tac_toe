require 'observer'
require 'forwardable'
require 'set'
require 'pp'

require_relative 'board'
require_relative 'cell'
require_relative 'cells'
require_relative 'coordinate'
require_relative 'screen'
require_relative 'view'

class TicTacToe
  def initialize
    Controller.new
  end
end
