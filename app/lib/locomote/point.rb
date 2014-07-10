class Point

  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  # Check if the Point falls inside the provided grid
  def within?(grid)
    return (@x.between?(0, grid[:width] - 1) and @y.between?(0, grid[:height] - 1))
  end

  # Check if the Point falls outside the provided grid
  def outside?(grid)
    return !within(grid)
  end

  # Move the point by x, y
  def move(x, y)
    @x += x
    @y += y
    return self # Allow chaining
  end

end