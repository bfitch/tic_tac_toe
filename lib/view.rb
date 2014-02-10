class View
  def initialize(board)
    @board = board
  end

  def render
    <<-BOARD
          a    b    c

        |----|----|----|
      0 |    |    |    |

        |----|----|----|
      1 |    |    |    |

        |----|----|----|
      2 |    |    |    |

        |----|----|----|
    BOARD
  end
end
