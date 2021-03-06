require_relative 'store'

class ChildrensMovie
  include Nameable
  include RentalCalculator

  def initialize(title)
    super(title)
  end

  def determine_amount(days_rented)
    rental_amount = 1.5
    rental_amount += (days_rented - 3) * 1.5 if days_rented > 3
    rental_amount
  end
end
