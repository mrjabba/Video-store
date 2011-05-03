require 'simplecov'
SimpleCov.start do
  add_filter 'video_fixture.rb'
  coverage_dir "test/coverage"
end

require 'minitest/unit'
require 'minitest/autorun'
