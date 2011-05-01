class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title, @price_code = title, price_code
  end

  def determine_amount(days_rented)
    raise 'Called abstract method: determine_amount(days_rented)'
  end

  def determine_frequent_renter_points(days_rented)
    bonus_is_earned = (@price_code == NEW_RELEASE && days_rented > 1)
    (bonus_is_earned) ? 2 : 1
  end
end
