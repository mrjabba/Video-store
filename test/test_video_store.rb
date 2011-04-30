require 'minitest/unit'
require 'minitest/autorun'
require_relative '../customer'
require_relative '../rental'

class TestVideoStore < MiniTest::Unit::TestCase
  def setup
    @customer = Customer.new("Fred")
    @new_release_1 = Movie.new("New release 1", Movie::NEW_RELEASE)
    @new_release_2 = Movie.new("New release 2", Movie::NEW_RELEASE)
    @childrens_movie = Movie.new("Childrens", Movie::CHILDRENS)
    @regular1 = Movie.new("Regular 1", Movie::REGULAR)
    @regular2 = Movie.new("Regular 2", Movie::REGULAR)
    @regular3 = Movie.new("Regular 3", Movie::REGULAR)
  end


  def test_single_new_release_statement
    @customer.add_rental Rental.new(@new_release_1, 3)
    assert_equal(
        "Rental Record for Fred\n" +
            "\tNew release 1\t9\n" +
            "Amount owed is 9\n" +
            "You earned 2 frequent renter points",
        @customer.statement)
  end

  def test_dual_new_release_statement
    @customer.add_rental Rental.new(@new_release_1, 3)
    @customer.add_rental Rental.new(@new_release_2, 3)
    assert_equal(
        "Rental Record for Fred\n" +
            "\tNew release 1\t9\n" +
            "\tNew release 2\t9\n" +
            "Amount owed is 18\n" +
            "You earned 4 frequent renter points",
        @customer.statement)
  end

  def test_single_childrens_statement
    @customer.add_rental Rental.new(@childrens_movie, 3)
    assert_equal(
        "Rental Record for Fred\n" +
            "\tChildrens\t1.5\n" +
            "Amount owed is 1.5\n" +
            "You earned 1 frequent renter points",
        @customer.statement)
  end

  def test_multiple_regular_statement
    @customer.add_rental Rental.new(@regular1, 1)
    @customer.add_rental Rental.new(@regular2, 2)
    @customer.add_rental Rental.new(@regular3, 3)
    assert_equal(
        "Rental Record for Fred\n" +
            "\tRegular 1\t2\n" +
            "\tRegular 2\t2\n" +
            "\tRegular 3\t3.5\n" +
            "Amount owed is 7.5\n" +
            "You earned 3 frequent renter points",
        @customer.statement)
  end
end
