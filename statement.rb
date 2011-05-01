class Statement
  def initialize(name)
    @customer_name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def total
    @total_amount
  end

  def frequent_renter_points
    @frequent_renter_points
  end

  def generate
    clear_totals
    header + rental_lines + footer
  end

  private

  def clear_totals
    @total_amount, @frequent_renter_points = 0, 0
  end

  def header
    "Rental Record for #{@customer_name}\n"
  end

  def rental_lines
    lines = ""
    @rentals.each do |rental|
      lines += rental_line(rental)
    end
    lines
  end

  def rental_line(rental)
    rental_amount = rental.determine_amount
    @frequent_renter_points += rental.determine_frequent_renter_points
    @total_amount += rental_amount
    format_rental_line(rental, rental_amount)
  end

  def format_rental_line(rental, rental_amount)
    "\t#{rental.title}\t#{rental_amount}\n"
  end

  def footer
    "Amount owed is #{@total_amount}\nYou earned #{@frequent_renter_points} frequent renter points"
  end
end
