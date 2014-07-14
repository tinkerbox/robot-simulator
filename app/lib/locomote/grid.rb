class Grid

	attr_reader :width, :height

  def initialize(width, height)
  	@width = width
  	@height = height
  end

  def is_within?(point)
  	return false if point.x >= width || point.x < 0
  	return false if point.y >= height || point.y < 0

  	true
  end

end
