require 'docking_station'

describe DockingStation do #class not string.
	#it 'responds to release_bike' do
    	#	expect(subject).to respond_to :release_bike
  	#end	

	it { is_expected.to respond_to :release_bike }

end
