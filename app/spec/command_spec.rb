require_relative 'spec_helper'

describe Command do

	before { @grid = Grid.new(5, 5) }

	it "should raise an exception when no input is provided" do
		proc { Command.parse("") }.must_raise RuntimeError
	end

	it "should raise an exception when invalid input is provided" do
		proc { Command.parse("no_such_command") }.must_raise RuntimeError
	end

	it "should return a command object with valid input" do
		command = Command.parse("place 1,1,north")
		command.name.must_equal :place
		command.params.must_equal ["1", "1", "north"]
	end

end
