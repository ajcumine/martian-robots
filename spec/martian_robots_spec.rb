require 'martian_robots'

describe 'martian_robots' do
  context 'when given an input' do
    before :each do
      input("53\n11E\nRFRFRFRF\n\n32N\nFRRFLLFFRRFLL\n\n03W\nLLFFFLFLFL")
    end

    it 'separates the map size' do
      expect(map_data).to eq([5,3])
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
      input("23\n11N\nFFF")
      move_robots
      expect(robot_scents).to eq([[1,3,'N']])
    end  
  end

  context 'after moving' do
    before :each do
      input("53\n11E\nRFRFRFRF\n\n32N\nFRRFLLFFRRFLL\n\n03W\nLLFFFLFLFL")
      move_robots
    end

    it 'have final positions' do
      expect(final_positions).to eq([[1,1,'E'],[3,3,'N'],[2,3,'S']])
    end

    it 'is knows if it is lost' do
      expect(lost_robots).to eq(['',' LOST',''])
    end

    it 'gives an output' do
      expect(output).to eq("11E\n33N LOST\n23S")
    end
  end
end
