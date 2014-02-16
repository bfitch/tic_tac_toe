class Screen
  include Observable

  def initialize(observer)
    add_observer(observer)
  end
   
  def read
    loop do
      coordinate = gets.chomp
      changed 
      notify_observers(coordinate)
    end
    sleep 1
  end

  def draw(data)
    puts data
  end
end
