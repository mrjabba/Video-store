require 'minitest/unit'
require 'minitest/autorun'
require_relative 'video_fixture'

class TestStatementWithZeroReleases < MiniTest::Unit::TestCase
  include VideoFixture

  def setup
    make_movies
    make_statement
    @output = @statement.generate
  end

  def test_total
    assert_equal(0, @statement.total)
  end

  def test_frequent_renter_points
    assert_equal(0, @statement.frequent_renter_points)
  end

  def test_statement_text
     assert_equal(
        "Rental Record for Customer\n" +
            "Amount owed is 0\n" +
            "You earned 0 frequent renter points",
        @output)
  end
end