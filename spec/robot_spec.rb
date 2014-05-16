require 'robot'

describe Robot do
  context 'on initialisation' do
    let(:robot) {Robot.new('12E','RFRF')}

    it 'has an initial x coordinate' do
      expect(robot.x_coord).to eq(1)
    end

    it 'has an initial y coordinate' do
      expect(robot.y_coord).to eq(2)
    end

    it 'has an initial orientation' do
      expect(robot.orientation).to eq('E')
    end

    it 'has a set of instructions' do
      expect(robot.instructions).to eq(['R','F','R','F'])
    end
  end
end