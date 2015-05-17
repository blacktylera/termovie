require_relative '../test_helper'

class TestListingMovies < Minitest::Test

  def test_listing_no_movies
    shell_output = ""
    expected_output = ""
    IO.popen('./termovie manage', 'r+') do |pipe|
      expected_output << main_menu
      pipe.puts "3"
      expected_output << "No movies in your collection! Please add a movie.\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_listing_multiple_movies
    create_movie("Rushmore")
    create_movie("Ghostbusters")
    shell_output = ""
    expected_output = ""
    IO.popen('./termovie manage', 'r+') do |pipe|
      expected_output << main_menu
      pipe.puts "3"
      expected_output << "1. Rushmore\n"
      expected_output << "2. Ghostbusters\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end
end