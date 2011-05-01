class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end

  def title
    @movie.title
  end

  def determine_amount
    rental_amount = 0
    case movie.price_code
      when Movie::REGULAR
        rental_amount += 2
        rental_amount += (days_rented - 2) * 1.5 if days_rented > 2
      when Movie::NEW_RELEASE
        rental_amount += days_rented * 3
      when Movie::CHILDRENS
        rental_amount += 1.5
        rental_amount += (days_rented - 3) * 1.5 if days_rented > 3
    end
    rental_amount
  end
end
