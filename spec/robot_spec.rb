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

  context 'following instructions R' do
    it 'when facing north changes to east' do
      robot = Robot.new('12N','R')
      expect(robot.final_orientation).to eq('E')
    end

    it 'when facing east changes to south' do
      robot = Robot.new('12E','R')
      expect(robot.final_orientation).to eq('S')
    end

    it 'when facing south changes to west' do
      robot = Robot.new('12S','R')
      expect(robot.final_orientation).to eq('W')
    end

    it 'when facing west changes to north' do
      robot = Robot.new('12W','R')
      expect(robot.final_orientation).to eq('N')
    end
  end

  context 'following instructions L' do
    it 'when facing north changes to west' do
      robot = Robot.new('12N','L')
      expect(robot.final_orientation).to eq('W')
    end

    it 'when facing east changes to north' do
      robot = Robot.new('12E','L')
      expect(robot.final_orientation).to eq('N')
    end

    it 'when facing south changes to east' do
      robot = Robot.new('12S','L')
      expect(robot.final_orientation).to eq('E')
    end

    it 'when facing west changes to south' do
      robot = Robot.new('12W','L')
      expect(robot.final_orientation).to eq('S')
    end
  end
end