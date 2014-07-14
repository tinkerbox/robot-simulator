class Robot

  MOVE_DELTA = {
    north: { x:  0, y:  1 },
    south: { x:  0, y: -1 },
    east:  { x:  1, y:  0 },
    west:  { x: -1, y:  0 }
  }

  ORIENTATIONS = [:north, :east, :south, :west]

  attr_reader :position, :orientation, :grid

  def initialize(grid)
    @grid = grid
  end

  def execute(command)
    raise "Robot is not placed" if command.name != :place && !is_placed?
    self.send(command.name, *command.params)
  end

  protected

  def is_placed?
    @position && @orientation
  end

  def rotate(direction)
    new_index = ORIENTATIONS.index(@orientation) + (direction == :right ? 1 : -1)

    new_index = ORIENTATIONS.length - 1 if new_index < 0
    new_index = 0 if new_index > ORIENTATIONS.length - 1

    @orientation = ORIENTATIONS[new_index]
  end

  private

  def place(x = nil, y = nil, direction = nil)

    raise "Invalid parameters for #place: x, y or direction is empty" if direction.nil? || x.nil? || y.nil?

    direction = direction.downcase.to_sym

    raise "Invalid parameters for #place: direction is not north, south, east or west" unless ORIENTATIONS.include? direction

    point = Point.new(x, y)

    raise "Invalid parameters for #place: location is not within grid" unless self.grid.is_within?(point)

    @position = point
    @orientation = direction

  end

  def left
    rotate(:left)
  end

  def right
    rotate(:right)
  end

  def move
    dx = MOVE_DELTA[@orientation][:x]
    dy = MOVE_DELTA[@orientation][:y]

    @position.translate(dx, dy) do |destination|
      @position = destination if self.grid.is_within?(destination)
    end
  end

  def report
    puts "#{@position.x.to_s}, #{@position.y.to_s}, #{@orientation.to_s}"
  end

end
