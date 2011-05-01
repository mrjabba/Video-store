require_relative 'movie'

class RegularMovie < Movie
  def initialize(title)
    super(title)
  end

  def determine_amount(days_rented)
    rental_amount = 2
    rental_amount += (days_rented - 2) * 1.5 if days_rented > 2
    rental_amount
  end
end