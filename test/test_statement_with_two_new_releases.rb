require 'minitest/unit'
require 'minitest/autorun'
require_relative 'video_fixture'

class TestStatementWithTwoNewReleases < MiniTest::Unit::TestCase
  include VideoFixture

  def setup
    make_movies
    make_statement
    @statement.add_rental Rental.new(@new_release_1, 3)
    @statement.add_rental Rental.new(@new_release_2, 3)
    @statement.generate
  end

  def test_total
    assert_equal(18, @statement.total)
  end

  def test_frequent_renter_points
    assert_equal(4, @statement.frequent_renter_points)
  end
end