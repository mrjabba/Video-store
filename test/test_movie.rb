require 'helper.rb'
require_relative 'video_fixture'

class TestMovie < MiniTest::Unit::TestCase
  include VideoFixture

  def setup
    @movie = Movie.new("abstract movie")
  end

  def test_it_should_raise_error_when_abstract_determine_amount_is_called
    assert_raises RuntimeError do
      @movie.determine_amount(2)
    end
  end
end