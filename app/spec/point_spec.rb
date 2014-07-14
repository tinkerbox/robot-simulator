require_relative 'spec_helper'

describe Point do

	it "can be compared using ==" do
		Point.new(1, 1).must_equal Point.new(1, 1)
		Point.new(1, 1).wont_equal Point.new(1, 2)
	end

	it "can be translated" do
		Point.new(1, 1).translate(1, -1).must_equal Point.new(2, 0)
	end

end