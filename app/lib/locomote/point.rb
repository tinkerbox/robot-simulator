class Point

  attr_reader :x, :y

  def initialize(x, y)
    @x = x.to_i
    @y = y.to_i
  end

  def translate(dx, dy, &block)
    result = Point.new(@x + dx, @y + dy)
    block.call(result) if block_given?
    result
  end

  def ==(point)
    self.x == point.x && self.y == point.y
  end

end
