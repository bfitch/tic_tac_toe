class Coordinate
  include Comparable

  attr_reader :x, :y

  def initialize(x,y)
    @x, @y = x,y
  end

  def <=>(object)
    if value < object.value
      -1
    elsif value == object.value
      0
    elsif value > object.value
      1
    end
  end

  def value
    (@y + @x).hex
  end
end
