class Movie
  attr_reader :title

  def initialize(title)
    @title = title
  end

  def determine_amount(days_rented)
    raise 'Called abstract method: determine_amount(days_rented)'
  end

  def determine_frequent_renter_points(days_rented)
    1
  end
end
