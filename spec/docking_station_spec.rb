require 'docking_station'
require 'bike'

describe DockingStation do 
	#it 'responds to release_bike' do
    	#	expect(subject).to respond_to :release_bike
  	#end	
	let(:bike){ double :bike, broken?: false, working?: true }
	let(:broken_bike){ double :bike, broken?: true }
	it { is_expected.to respond_to :release_bike }

	it 'releases working bikes' do
		subject.dock(bike)
    		expect(subject.release_bike).to be_working
  	end

	it { is_expected.to respond_to(:dock).with(1).argument }
	
  it 'docks something' do
    # We want to return the bike we dock
    expect(subject.dock(bike)).to eq [bike]
  end
	
  describe '#release_bike' do
    it 'releases a bike' do
      subject.dock(bike) 
      # we want to release the bike we docked
      expect(subject.release_bike).to eq bike
      #expect(subject.dock(bike)).to eq bike
    end
    it "doesn\'t release broken bike" do
      subject.dock(broken_bike)
      expect{subject.release_bike}.to raise_error 'bike broken'             
    end


    it 'raises an error when there are no bikes available' do
     	#Let's not dock a bike first:
      #remember subject == DockingStation.new
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end
  
  describe '#dock' do
		it 'raises an error when full' do
      		  subject.capacity.times { subject.dock bike }
  		  expect { subject.dock bike }.to raise_error 'Docking station full'
		end
  end

  describe '#capacity' do 
    it 'allows custom capacity or default capacity' do 
    end

    it 'has a default capacity' do 
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end
#added from walkthrough
 describe 'initialization' do
   subject { DockingStation.new }
   let(:bike) { Bike.new }
   it 'defaults capacity' do
     described_class::DEFAULT_CAPACITY.times do
      subject.dock(bike)
     end
     expect{ subject.dock(bike) }.to raise_error 'Docking station full'
   end
end
end

=begin
require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    subject.dock Bike.new
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'does not release broken bikes' do
    bike = Bike.new
    bike.report_broken
    subject.dock bike
    expect {subject.release_bike}.to raise_error 'No bikes available'
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe 'release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe 'dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end
end
=end
