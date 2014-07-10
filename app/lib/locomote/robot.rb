class Robot

  MOVEDELTA = {
    north: { x:  0, y:  1 },
    south: { x:  0, y: -1 },
    east:  { x:  1, y:  0 },
    west:  { x: -1, y:  0 }
  }

  DIR = [:north, :east, :south, :west]

  def initialize(grid)
    @grid = grid
  end

  # Attempt to have the Robot execute a command
  def execute(command)
    if (isPlaced? or command.name == :place)
      send(command.name, *command.params) if respond_to?(command.name) # Could possiby use a command map to make this more flexible
    end
  end

  # Attempt to place the Robot on a Point on the provided grid, and face it in the provided direction
  def place(x = nil, y = nil, f = nil)
    if (x and y and f)
      point = Point.new(x.to_i, y.to_i) # De-couple?
      # Robot needs to be placed inside the provided grid
      if point.within?(@grid) then
        @position = point
        @orientation = f.downcase.to_sym
      end
    end
  end

  def left
    rotate(:left)
  end

  def right
    rotate(:right)
  end

  # Attempt to move the robot one grid unit in the direction it is facing
  def move
    d = MOVEDELTA
    dx = d[@orientation][:x]
    dy = d[@orientation][:y]
    moveBy(dx, dy)
  end

  # Report the current position and orientation of the Robot
  def report
    # Robot can't report it's position until it is placed on a grid
    puts "#{@position.x.to_s}, #{@position.y.to_s}, #{@orientation.to_s}"
  end
  
  # Check if the Robot has been placed on a grid
  def isPlaced?
    return !!@position # Is there a Ruby idiomatic way to do this?
  end

  private

  # Attempt to move the robot on the grid
  def moveBy(dx, dy)
    # Robot should never move more than one grid unit at a time
    unless dx.abs + dy.abs > 1 then
      destination = @position.clone.move(dx, dy)
      # Make sure the destination is inside the Grid our robot is placed on
      if destination.within?(@grid) then
        @position = destination
      end
    end
  end

  def rotate(direction)
    delta = (if direction == :right then 1 else (-1) end)
    currentIndex = DIR.index(@orientation)
    newIndex = currentIndex + delta
    if newIndex < 0 then
      @orientation = DIR[DIR.length - 1]
    elsif newIndex > DIR.length - 1 then
      @orientation = DIR[0]
    else
      @orientation = DIR[newIndex]
    end
  end
end