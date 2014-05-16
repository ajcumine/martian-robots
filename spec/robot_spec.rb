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

  context 'following instructions F' do
    it 'increases y coordinate when facing north' do
      robot = Robot.new('12N','F')
      expect(robot.final_y).to eq(3)
    end

    it 'decreases y coordinate when facing south' do
      robot = Robot.new('12S','F')
      expect(robot.final_y).to eq(1)
    end

    it 'increases x coordinate when facing east' do
      robot = Robot.new('12E','F')
      expect(robot.final_x).to eq(2)
    end

    it 'decreases x coordinate when facing west' do
      robot = Robot.new('12W','F')
      expect(robot.final_x).to eq(0)
    end
  end
end