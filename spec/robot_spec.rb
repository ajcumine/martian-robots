require 'robot'

describe Robot do
  context 'on initialisation' do
    let(:robot) {Robot.new('12E','RFRF',[5,6],[[2,6,'N'],[0,2,'W']])}

    it 'has initial coordinates' do
      expect(robot.coords).to eq([1,2,'E'])
    end

    it 'has a set of instructions' do
      expect(robot.instructions).to eq(['R','F','R','F'])
    end

    it 'has maximum coordinates' do
      expect(robot.boundarys).to eq([5,6])
    end

    it 'is not lost on creation' do
      expect(robot).not_to be_lost
    end

    it 'is able to be lost' do
      robot.lost
      expect(robot).to be_lost
    end

    it 'has scents of former robots' do
      expect(robot.scents).to eq([[2,6,'N'],[0,2,'W']])
    end
  end

  context 'following instructions F' do
    it 'increases y coordinate when facing north' do
      robot = Robot.new('12N','F',[5,5],[])
      robot.move
      expect(robot.final_coords[1]).to eq(3)
    end

    it 'decreases y coordinate when facing south' do
      robot = Robot.new('12S','F',[5,5],[])
      robot.move
      expect(robot.final_coords[1]).to eq(1)
    end

    it 'increases x coordinate when facing east' do
      robot = Robot.new('12E','F',[5,5],[])
      robot.move
      expect(robot.final_coords[0]).to eq(2)
    end

    it 'decreases x coordinate when facing west' do
      robot = Robot.new('12W','F',[5,5],[])
      robot.move
      expect(robot.final_coords[0]).to eq(0)
    end
  end

  context 'following instructions R' do
    it 'when facing north changes to east' do
      robot = Robot.new('12N','R',[5,5],[])
      robot.move
      expect(robot.final_coords[2]).to eq('E')
    end

    it 'when facing east changes to south' do
      robot = Robot.new('12E','R',[5,5],[])
      robot.move
      expect(robot.final_coords[2]).to eq('S')
    end

    it 'when facing south changes to west' do
      robot = Robot.new('12S','R',[5,5],[])
      robot.move
      expect(robot.final_coords[2]).to eq('W')
    end

    it 'when facing west changes to north' do
      robot = Robot.new('12W','R',[5,5],[])
      robot.move
      expect(robot.final_coords[2]).to eq('N')
    end
  end

  context 'following instructions L' do
    it 'when facing north changes to west' do
      robot = Robot.new('12N','L',[5,5],[])
      robot.move
      expect(robot.final_coords[2]).to eq('W')
    end

    it 'when facing east changes to north' do
      robot = Robot.new('12E','L',[5,5],[])
      robot.move
      expect(robot.final_coords[2]).to eq('N')
    end

    it 'when facing south changes to east' do
      robot = Robot.new('12S','L',[5,5],[])
      robot.move
      expect(robot.final_coords[2]).to eq('E')
    end

    it 'when facing west changes to south' do
      robot = Robot.new('12W','L',[5,5],[])
      robot.move
      expect(robot.final_coords[2]).to eq('S')
    end
  end

  context 'when moving off the map' do
    let(:robot) {Robot.new('11E','FFF',[2,2],[])}

    it 'records the location from where it moved' do
      robot.move
      expect(robot.final_coords).to eq([2,1,'E'])
    end

    it 'knows the robot is lost' do
      robot.move
      expect(robot).to be_lost
    end
  end

  context 'when given a command that follows a scent' do
    it 'will ignore the command' do
      robot = Robot.new('11E','FFLF',[2,2],[[2,1,'E']])
      robot.move
      expect(robot.final_coords).to eq([2,2,'N'])
    end
  end
end