require_relative 'rental'
require_relative 'statement'
require_relative 'new_release_movie'
require_relative 'childrens_movie'
require_relative 'regular_movie'

star_wars = RegularMovie.new('Star Wars')
toy_story = ChildrensMovie.new('Toy Story')
iron_man = NewReleaseMovie.new('Iron Man 2')

regular_rental = Rental.new(star_wars, 5)
kids_rental = Rental.new(toy_story, 3)
new_rental = Rental.new(iron_man, 2)

john_doe = Statement.new('John Doe')

john_doe.add_rental(regular_rental)
john_doe.add_rental(kids_rental)
john_doe.add_rental(new_rental)

puts john_doe.generate