require_relative 'spec_helper'

describe Robot do

	before do
		@grid = Grid.new(5, 5)
		@robot = Robot.new(@grid)
	end

  it "can be placed" do
  	@robot.execute(Command.parse("place 1,1,north"))

	  @robot.instance_variable_get(:@position).must_equal(Point.new(1, 1))
	  @robot.instance_variable_get(:@orientation).must_equal(:north)
  end

  it "cannot execute commands except for place" do
  	proc { @robot.execute(Command.parse("move")) }.must_raise RuntimeError
  	proc { @robot.execute(Command.parse("left")) }.must_raise RuntimeError
  	proc { @robot.execute(Command.parse("right")) }.must_raise RuntimeError
  	proc { @robot.execute(Command.parse("report")) }.must_raise RuntimeError
  end

  describe "that has been placed" do

  	before { @robot.execute(Command.parse("place 1,1,north")) }

  	it "can move to valid position on the grid" do
	  	@robot.execute(Command.parse("move"))
		  @robot.instance_variable_get(:@position).must_equal(Point.new(1, 2))
	  end

	  it "cannot move to invalid position on the grid" do
	  	@robot.execute(Command.parse("left"))
	  	@robot.execute(Command.parse("move"))
	  	@robot.execute(Command.parse("move"))
		  @robot.instance_variable_get(:@position).must_equal(Point.new(0, 1))
	  end

	  it "can report its location" do
	  	proc { @robot.execute(Command.parse("report")) }.must_output "1, 1, north\n"
	  end

  end

end
