require 'martian_robots'

describe 'martian_robots' do
  context 'when given an input' do
    before :each do
      input("53\n11E\nRFRFRFRF\n\n32N\nFRRFLLFFRRFLL\n\n03W\nLLFFFLFLFL")
    end

    it 'separates the map size' do
      expect(map_data).to eq('53')
    end
  
    it 'has a maximum x value' do
      expect(maximum_x).to eq(5)
    end
  
    it 'has a maximum y value' do
      expect(maximum_y).to eq(3)
    end
  
    it 'separates the robot data' do
      expect(robot_data).to eq([["11E","RFRFRFRF"],["32N","FRRFLLFFRRFLL"],["03W","LLFFFLFLFL"]])
    end
  
    it 'creates the right number of robots' do
      expect(robots.count).to eq(3)
    end
  end

  context 'when a robot is lost' do
    it 'saves the scent so it can be passed to the next robot' do
      robot = Robot.new('12N','FF',2,3,[[0,0,'S']])
      robot.move
      expect(robot_scents).to eq([[0,0,'S'],[1,3,'N']])
    end  
  end
end
