require_relative "locomote/command"
require_relative "locomote/point"
require_relative "locomote/robot"
require_relative "locomote/grid"

grid = Grid.new(5, 5)
robot = Robot.new(grid)

while input = gets do

	break if input == "exit"

	begin
		Command.parse(input.chomp) do |command|
	  	robot.execute(command)
	  	# robot.send :report
	  end
	rescue => e
		puts e.message
	end
  
end
