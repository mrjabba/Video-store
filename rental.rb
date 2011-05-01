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
    @movie.determine_frequent_renter_points(@days_rented)
  end
end
