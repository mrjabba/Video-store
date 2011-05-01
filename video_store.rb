require_relative 'rental'
require_relative 'statement'

star_wars = Movie.new('Star Wars', Movie::REGULAR)
toy_story = Movie.new('Toy Story', Movie::CHILDRENS)
iron_man = Movie.new('Iron Man 2', Movie::NEW_RELEASE)

regular_rental = Rental.new(star_wars, 5)
kids_rental = Rental.new(toy_story, 3)
new_rental = Rental.new(iron_man, 2)

john_doe = Statement.new('John Doe')

john_doe.add_rental(regular_rental)
john_doe.add_rental(kids_rental)
john_doe.add_rental(new_rental)

puts john_doe.generate