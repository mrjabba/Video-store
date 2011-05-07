module Nameable
  attr_reader :title
end

module RentalCalculator
  def determine_amount(days_rented)
    rental_amount = 2
    rental_amount += (days_rented - 2) * 1.5 if days_rented > 2
    rental_amount
  end

  def determine_frequent_renter_points(days_rented)
    1
  end
end

class Movie
  include RentalCalculator
  include Nameable

  def initialize(title)
    @title = title
  end
end

