require_relative 'movie'

class NewReleaseMovie < Movie
  def initialize(title)
    super(title, Movie::NEW_RELEASE)
  end

  def determine_amount(days_rented)
    days_rented * 3
  end

  def determine_frequent_renter_points(days_rented)
    (days_rented > 1) ? 2 : 1
  end
end