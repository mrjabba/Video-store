require_relative 'movie'

class ChildrensMovie < Movie
  def initialize(title)
    super(title, Movie::CHILDRENS)
  end
end