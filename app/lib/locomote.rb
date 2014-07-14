require_relative "locomote/command"
require_relative "locomote/point"
require_relative "locomote/robot"

grid = {
  height: 5,
  width: 5
}

robot = Robot.new(grid)

while input = gets do

  Command.parse(input.chomp) do |command|
  	robot.execute(command)
  	robot.report
  end
  
end