require_relative 'movie'

class NewReleaseMovie < Movie
  def initialize(title)
    super(title, Movie::NEW_RELEASE)
  end

  def determine_amount(days_rented)
    days_rented * 3
  end
end