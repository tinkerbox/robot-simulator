require_relative "locomote/command"
require_relative "locomote/point"
require_relative "locomote/robot"

grid = {
  height: 5,
  width: 5
}

robot = Robot.new(grid)

while input = gets do
  command = Command.parse(input.chomp)
  robot.execute(command) if command
end