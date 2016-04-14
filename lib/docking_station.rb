require_relative 'bike'
class DockingStation

	DEFAULT_CAPACITY = 20
	
	attr_accessor :capacity

	def initialize(capacity=DEFAULT_CAPACITY)#this is how to make it work with init
	    @capacity = capacity
	    @bikes = []
	end 
=begin
	def initialize
	  @bikes = []
	  @capacity = DEFAULT_CAPACITY
	end
=end
	def release_bike
                bike = @bikes.pop
		raise 'No bikes available' if empty?
                raise 'bike broken' if bike.broken?
		@bikes.pop
	end

	def dock(bike)
		raise 'Docking station full' if full?
		@bikes << bike
	end

  private 

  attr_reader :bikes

  def full? 
  	@bikes.count >= capacity
  end

  def empty? 
  	@bikes.empty?
  end
end
