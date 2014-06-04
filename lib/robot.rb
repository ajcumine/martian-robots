DIRECTION = ['N', 'E', 'S', 'W']

class Robot

  attr_accessor  :coords, :final_coords, :new_coords
  attr_reader :boundarys, :scents, :instructions

  def initialize(init_pos,instr,bounds,robot_scents)
    @coords = [ init_pos.split(' ')[0].to_i,
                init_pos.split(' ')[1].to_i,
                init_pos.split(' ')[2]
              ]
    @instructions = instr.split('')
    @boundarys = bounds
    @scents = robot_scents
    safe
  end

  def lost?
    @lost
  end

  def safe
    @lost = false
  end

  def lost
    @lost = true
  end

  def check_lost
    if @new_coords[0] > boundarys[0] || @new_coords[0] < 0 || @new_coords[1] > boundarys[1] || @new_coords[1] < 0
      self.lost
    end
  end

  def update_coords
    if !lost?
      @final_coords = [@coords[0],@coords[1],@coords[2]]
    else
      @coords = new_coords
    end
  end

  def check_movement
    all_match = @scents.map {|scent| scent == @coords}
    @any_match = all_match.include?(true)
  end

  def move
    @new_coords = coords
    @instructions.each do |change|
      check_movement
      next if change == 'F' && @any_match == true
      movement(change)
      check_lost
      update_coords
    end
  end

  def new_move
    @new_coords = coords
    @instructions.each do |change|
      check_movement
      next if change == 'F' && @any_match == true
      new_movement(change)
      check_lost
      update_coords
    end
  end

  def movement(change)
    if change == 'F'
      forward
    elsif change == 'R'
      right
    elsif change == 'L'
      left
    end
  end

  def new_movement(change)
    change == 'F' ? change_position : change_direction(change)
  end

  def change_position
    @new_coords[1] += 1 if @coords[2] == 'N'
    @new_coords[0] += 1 if @coords[2] == 'E'
    @new_coords[1] -= 1 if @coords[2] == 'S'
    @new_coords[0] -= 1 if @coords[2] == 'W'
  end

  def change_direction(change)
    current_direction = DIRECTION.index(@new_coords[2])
    new_direction = change == 'R' ? current_direction + 1 : current_direction - 1
    new_direction = 0 if new_direction > 3
    @new_coords[2] = DIRECTION[new_direction]
  end

  def forward
    if @coords[2] == 'N'
      @new_coords[1] += 1
    elsif @coords[2] == 'E'
      @new_coords[0] += 1
    elsif @coords[2] == 'S'
      @new_coords[1] -= 1
    elsif @coords[2] == 'W'
      @new_coords[0] -= 1
    end
  end

  def right
    if @coords[2] == 'N'
      @new_coords[2] = 'E'
    elsif @coords[2] == 'E'
      @new_coords[2] = 'S'
    elsif @coords[2] == 'S'
      @new_coords[2] = 'W'
    elsif @coords[2] == 'W'
      @new_coords[2] = 'N'
    end
  end

  def left
    if @coords[2] == 'N'
      @new_coords[2] = 'W'
    elsif @coords[2] == 'E'
      @new_coords[2] = 'N'
    elsif @coords[2] == 'S'
      @new_coords[2] = 'E'
    elsif @coords[2] == 'W'
      @new_coords[2] = 'S'
    end
  end

end