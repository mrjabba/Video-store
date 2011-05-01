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
    rental_amount = 0
    case @price_code
      when REGULAR
        rental_amount += 2
        rental_amount += (days_rented - 2) * 1.5 if days_rented > 2
      when NEW_RELEASE
        rental_amount += days_rented * 3
      when CHILDRENS
        rental_amount += 1.5
        rental_amount += (days_rented - 3) * 1.5 if days_rented > 3
    end
    rental_amount
  end
end
