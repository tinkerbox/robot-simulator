require_relative 'spec_helper'

describe "simple failing test" do
  it "fails" do
    assert 1 < 0
  end
end