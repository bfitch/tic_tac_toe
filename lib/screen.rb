class Screen
  include Observable

  def initialize(observer)
    add_observer(observer)
  end
   
  def read
    loop do
      coordinate, value = gets.split(' ')
      changed 
      notify_observers(coordinate, value.chomp)
    end
    sleep 1
  end

  def draw(data)
    puts data
  end
end
