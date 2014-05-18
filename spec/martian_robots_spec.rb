require 'martian_robots'

describe 'martian_robots' do
  context 'when given an input' do
    before :each do
      input("5 3\n1 1 E\nRFRFRFRF\n\n3 2 N\nFRRFLLFFRRFLL\n\n0 3 W\nLLFFFLFLFL")
    end

    it 'separates the map size' do
      expect(map_data).to eq([5,3])
    end
  
    it 'separates the robot data' do
      expect(robot_data).to eq([["1 1 E","RFRFRFRF"],["3 2 N","FRRFLLFFRRFLL"],["0 3 W","LLFFFLFLFL"]])
    end
  
    it 'creates the right number of robots' do
      expect(robots.count).to eq(3)
    end
  end

  context 'when a robot is lost' do
    it 'saves the scent so it can be passed to the next robot' do
      input("2 3\n1 1 N\nFFF")
      move_robots
      expect(robot_scents).to eq([[1,3,'N']])
    end  
  end

  context 'after moving' do
    before :each do
      input("5 3\n1 1 E\nRFRFRFRF\n\n3 2 N\nFRRFLLFFRRFLL\n\n0 3 W\nLLFFFLFLFL")
      move_robots
    end

    it 'have final positions' do
      expect(final_positions).to eq([[1,1,'E'],[3,3,'N'],[2,3,'S']])
    end

    it 'is knows if it is lost' do
      expect(lost_robots).to eq(['',' LOST',''])
    end

    it 'gives an output' do
      expect(output).to eq("1 1 E\n3 3 N LOST\n2 3 S")
    end
  end
end
