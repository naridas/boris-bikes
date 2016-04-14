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
                
		raise 'No bikes available' if empty?
    		bike = @bikes.pop
                raise 'bike broken' if bike.broken?
		bike
=begin    
          raise 'No bikes available' if empty?
             bike = @bikes.pop
          if bike.broken?
            raise 'bike broken'
          else
            return bike
=end
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
