require_relative 'store'

class NewReleaseMovie
  include Nameable
#  include RentalCalculator

  def initialize(title)
    super(title)
  end

  def determine_amount(days_rented)
    days_rented * 3
  end

  def determine_frequent_renter_points(days_rented)
    (days_rented > 1) ? 2 : 1
  end
end
