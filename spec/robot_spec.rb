require 'robot'

describe Robot do
  context 'on initialisation' do
    before :each do
      let(:robot) {Robot.new('12E','RFRF')}
    end

    it 'has an initial x coordinate' do
      expect(x_coord).to eq(1)
    end

    it 'has an initial y coordinate' do
      expect(y_coord).to eq(1)
    end
    
    it 'has a set of instructions' do
      expect(instructions).to eq(['R','F','R','F'])
    end
  end
end