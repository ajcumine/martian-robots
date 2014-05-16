require 'martian_robots'

describe 'martian_robots' do
  context 'when given an input' do
    before :each do
      input("53\n11E\nRFRFRFRF\n\n32N\nFRRFLLFFRRFLL\n\n03W\nLLFFFLFLFL")
    end

    it 'separates the input' do
      expect(input).to eq(["53\n11E\nRFRFRFRF", "32N\nFRRFLLFFRRFLL", "03W\nLLFFFLFLFL"])
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
end
