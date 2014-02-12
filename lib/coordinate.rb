class Coordinate
  include Comparable

  attr_reader :column, :row

  def initialize(column,row)
    @column, @row = column,row
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
    (@row + @column).hex
  end

  def hash
    [@column, @row].hash
  end
end
