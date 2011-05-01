class Rental
  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end

  def title
    @movie.title
  end

  def determine_amount
    @movie.determine_amount(@days_rented)
  end

  def determine_frequent_renter_points
    bonus_is_earned = @movie.price_code == Movie::NEW_RELEASE && @days_rented > 1
    (bonus_is_earned) ? 2 : 1
  end
end
