require_relative 'spec_helper'

describe Grid do

	before { @grid = Grid.new(5, 5) }

	it "should return true when point is within" do
		@grid.is_within?(Point.new(1, 1)).must_equal true
	end

	it "should return false when point is not within" do
		@grid.is_within?(Point.new(1, -1)).must_equal false
	end

end