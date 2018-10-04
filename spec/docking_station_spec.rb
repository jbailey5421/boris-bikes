require 'docking_station'
describe DockingStation do
  let(:bike) { double(:bike) }
  it { is_expected.to respond_to :release_bike }
  describe 'release_bike' do
    it 'gives a working bike' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end
    it 'only returns working bikes' do
      allow(bike).to receive(:working?).and_return(false)
      allow(bike).to receive(:report_broken)
      bike.report_broken
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error('Sorry, no working bikes')
    end
    it 'raises an error when no bike is docked' do
      expect { subject.release_bike }.to raise_error('Sorry, no working bikes')
    end
  end

  describe 'dock' do
    it 'docks the bike' do
      expect(subject.dock(bike)).to be_truthy
    end
    it 'raises an error when full' do
      subject.capacity.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error 'Oops, full'
    end
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock(bike) }
      expect { docking_station.dock(bike) }.to raise_error 'Oops, full'
    end
    it 'sets capacity to 30 when capacity is set to 30' do
      station = DockingStation.new(30)
      expect(station.capacity).to eq 30
    end

    it 'sets default capacity to 20 when no capacity given' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end
end