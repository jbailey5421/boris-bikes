require 'docking_station'
describe DockingStation do
    it 'responds to release_bike' do
        expect(subject).to respond_to :release_bike
    end
  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      # we want to release the bike we docked
      expect(subject.release_bike).to eq bike
    end
  end
  it { is_expected.to respond_to(:dock).with(1).argument }
  
  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      # Let's not dock a bike first:
      # remember subject == DockingStation.new
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end
    describe '#dock' do
    it 'raises an error when full' do
    DockingStation::DEFAULT_CAPACITY.times do
    subject.dock Bike.new
    end
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end
  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
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