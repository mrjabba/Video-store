require 'helper.rb'

class TestMovie < MiniTest::Unit::TestCase
  def test_movies_should_have_titles
    title = "Starship Troopers"
    @movie = Movie.new(title)
    assert_equal title, @movie.title
  end
end
