require 'minitest/unit'
require 'minitest/autorun'
require_relative 'video_fixture'

class TestStatementWithMultipleReleases < MiniTest::Unit::TestCase
  include VideoFixture

  def setup
    make_movies
    make_statement
    @statement.add_rental Rental.new(@regular1, 1)
    @statement.add_rental Rental.new(@regular2, 2)
    @statement.add_rental Rental.new(@regular3, 3)
    @output = @statement.generate
  end

  def test_total
    assert_equal(7.5, @statement.total)
  end

  def test_frequent_renter_points
    assert_equal(3, @statement.frequent_renter_points)
  end

  def test_statement_text
     assert_equal(
        "Rental Record for Customer\n" +
            "\tRegular 1\t2\n" +
            "\tRegular 2\t2\n" +
            "\tRegular 3\t3.5\n" +
            "Amount owed is 7.5\n" +
            "You earned 3 frequent renter points",
        @output)
  end
end