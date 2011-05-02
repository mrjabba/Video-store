require 'minitest/unit'
require 'minitest/autorun'
require_relative 'video_fixture'

class TestStatementWithOneChildrensRelease < MiniTest::Unit::TestCase
  include VideoFixture

  def setup
    make_movies
    make_statement
    @statement.add_rental Rental.new(@childrens_movie, 3)
    @statement.generate
  end

  def test_total
    assert_equal(1.5, @statement.total)
  end

  def test_frequent_renter_points
    assert_equal(1, @statement.frequent_renter_points)
  end
end