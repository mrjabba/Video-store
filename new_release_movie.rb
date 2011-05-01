require_relative 'movie'

class NewReleaseMovie < Movie
  def initialize(title)
    super(title, Movie::NEW_RELEASE)
  end
end