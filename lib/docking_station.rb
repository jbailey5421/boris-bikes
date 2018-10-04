require_relative 'bike'



# creates a docking station for use
class DockingStation
  attr_reader :capacity
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'Sorry, no working bikes' if empty? || find_working_bike.nil?
    @bikes.delete(find_working_bike)
  end


  def dock(bike)
    raise 'Oops, full' if full?
    @bikes.push(bike)
  end

  private
  attr_reader :bikes

  def full?
    @bikes.length >= capacity
  end
  def empty?
    @bikes.empty?
  end
  def find_working_bike
    @bikes.each do |bike|
      return bike if bike.working?
    end
    nil
  end
end