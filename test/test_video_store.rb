require 'minitest/unit'
require 'minitest/autorun'
require_relative '../statement'
require_relative '../rental'

class TestVideoStore < MiniTest::Unit::TestCase
  def setup
    @statement = Statement.new("Customer")
    @new_release_1 = Movie.new("New release 1", Movie::NEW_RELEASE)
    @new_release_2 = Movie.new("New release 2", Movie::NEW_RELEASE)
    @childrens_movie = Movie.new("Childrens", Movie::CHILDRENS)
    @regular1 = Movie.new("Regular 1", Movie::REGULAR)
    @regular2 = Movie.new("Regular 2", Movie::REGULAR)
    @regular3 = Movie.new("Regular 3", Movie::REGULAR)
  end


  def test_single_new_release_statement_totals
    @statement.add_rental Rental.new(@new_release_1, 3)
    @statement.generate
    assert_equal(9, @statement.total)
    assert_equal(2, @statement.frequent_renter_points)
  end

  def test_dual_new_release_statement_totals
    @statement.add_rental Rental.new(@new_release_1, 3)
    @statement.add_rental Rental.new(@new_release_2, 3)
    @statement.generate
    assert_equal(18, @statement.total)
    assert_equal(4, @statement.frequent_renter_points)
  end

  def test_single_childrens_statement_totals
    @statement.add_rental Rental.new(@childrens_movie, 3)
    @statement.generate
    assert_equal(1.5, @statement.total)
    assert_equal(1, @statement.frequent_renter_points)
  end

  def test_multiple_regular_statement_totals
    @statement.add_rental Rental.new(@regular1, 1)
    @statement.add_rental Rental.new(@regular2, 2)
    @statement.add_rental Rental.new(@regular3, 3)
    @statement.generate
    assert_equal(7.5, @statement.total)
    assert_equal(3, @statement.frequent_renter_points)
  end

  def test_multiple_regular_statement_format
    @statement.add_rental Rental.new(@regular1, 1)
    @statement.add_rental Rental.new(@regular2, 2)
    @statement.add_rental Rental.new(@regular3, 3)

    assert_equal(
        "Rental Record for Customer\n" +
            "\tRegular 1\t2\n" +
            "\tRegular 2\t2\n" +
            "\tRegular 3\t3.5\n" +
            "Amount owed is 7.5\n" +
            "You earned 3 frequent renter points",
        @statement.generate)
  end
end
