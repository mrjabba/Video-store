require_relative '../statement'
require_relative '../new_release_movie'
require_relative '../childrens_movie'
require_relative '../regular_movie'
require_relative '../rental'

module VideoFixture
  def make_statement
    @statement = Statement.new("Customer")
  end

  def make_movies
    @new_release_1 = NewReleaseMovie.new("New release 1")
    @new_release_2 = NewReleaseMovie.new("New release 2")
    @childrens_movie = ChildrensMovie.new("Childrens")
    @regular1 = RegularMovie.new("Regular 1")
    @regular2 = RegularMovie.new("Regular 2")
    @regular3 = RegularMovie.new("Regular 3")
  end
end