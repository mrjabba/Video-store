require 'helper.rb'
require_relative 'video_fixture'

class TestStatementWithOneNewRelease < MiniTest::Unit::TestCase
  include VideoFixture

  def setup
    make_movies
    make_statement
    @statement.add_rental Rental.new(@new_release_1, 3)
    @statement.generate
  end

  def test_total
    assert_equal(9, @statement.total)
  end

  def test_frequent_renter_points
    assert_equal(2, @statement.frequent_renter_points)
  end
end