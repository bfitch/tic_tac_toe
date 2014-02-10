class Cell
  attr_reader :coordinate

  def initialize(coordinate, value)
    @coordinate = coordinate
    @value      = to_boolean(value) #handle this better
  end

  def to_boolean(value)
    if value == "x"
      return true
    else
      return false
    end
  end

  def token
    
  end

  def <=>(object)
    coordinate <=> object.coordinate
  end

  def ==(object)
    coordinate == object.coordinate
  end
end
