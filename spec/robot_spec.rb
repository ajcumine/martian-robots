require 'robot'

describe Robot do
  context 'on initialisation' do
    let(:robot) {Robot.new('12E','RFRF',5,6)}

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

    it 'has a maximum x coordinate' do
      expect(robot.x_boundary).to eq(5)
    end

    it 'has a maximum y coordinate' do
      expect(robot.y_boundary).to eq(6)
    end

    it 'is not lost on creation' do
      expect(robot.lost?).to be(false)
    end
  end

  context 'following instructions F' do
    it 'increases y coordinate when facing north' do
      robot = Robot.new('12N','F',5,5)
      robot.move
      expect(robot.final_y).to eq(3)
    end

    it 'decreases y coordinate when facing south' do
      robot = Robot.new('12S','F',5,5)
      robot.move
      expect(robot.final_y).to eq(1)
    end

    it 'increases x coordinate when facing east' do
      robot = Robot.new('12E','F',5,5)
      robot.move
      expect(robot.final_x).to eq(2)
    end

    it 'decreases x coordinate when facing west' do
      robot = Robot.new('12W','F',5,5)
      robot.move
      expect(robot.final_x).to eq(0)
    end
  end

  context 'following instructions R' do
    it 'when facing north changes to east' do
      robot = Robot.new('12N','R',5,5)
      robot.move
      expect(robot.final_orientation).to eq('E')
    end

    it 'when facing east changes to south' do
      robot = Robot.new('12E','R',5,5)
      robot.move
      expect(robot.final_orientation).to eq('S')
    end

    it 'when facing south changes to west' do
      robot = Robot.new('12S','R',5,5)
      robot.move
      expect(robot.final_orientation).to eq('W')
    end

    it 'when facing west changes to north' do
      robot = Robot.new('12W','R',5,5)
      robot.move
      expect(robot.final_orientation).to eq('N')
    end
  end

  context 'following instructions L' do
    it 'when facing north changes to west' do
      robot = Robot.new('12N','L',5,5)
      robot.move
      expect(robot.final_orientation).to eq('W')
    end

    it 'when facing east changes to north' do
      robot = Robot.new('12E','L',5,5)
      robot.move
      expect(robot.final_orientation).to eq('N')
    end

    it 'when facing south changes to east' do
      robot = Robot.new('12S','L',5,5)
      robot.move
      expect(robot.final_orientation).to eq('E')
    end

    it 'when facing west changes to south' do
      robot = Robot.new('12W','L',5,5)
      robot.move
      expect(robot.final_orientation).to eq('S')
    end
  end

  context 'when moving off the map' do
    let(:robot) {Robot.new('11E','FF',2,2)}

    it 'records the location from where it moved' do
      robot.move
      expect(robot.final_x).to eq(2)
    end

    it 'knows the robot is lost' do
      robot.move
      expect(robot.lost?).to be(true)
    end
  end
end