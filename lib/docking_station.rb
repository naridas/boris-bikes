
require_relative 'bike'
class DockingStation
	attr_reader :bikes
	def initialize
	  @bikes = []
	end

	def release_bike
		raise 'No bikes available' if empty?
		@bikes.delete_at(0)
	end

	def dock(bike)
		raise 'Docking station full' if full?
		@bikes << bike
	end

  private 

  def full? 
  	@bikes.count >= 20
  end

  def empty? 
  	@bikes == []
  end
end
