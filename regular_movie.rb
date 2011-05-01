require_relative 'movie'

class RegularMovie < Movie
  def initialize(title)
    super(title, Movie::REGULAR)
  end
end