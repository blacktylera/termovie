require_relative '../test_helper'

class TestListingMovies < Minitest::Test

  def test_listing_no_movies
    shell_output = ""
    expected_output = ""
    IO.popen('./termovie manage', 'r+') do |pipe|
      expected_output << main_menu
      pipe.puts "3"
      expected_output << "No movies in your collection! Please add a movie.\n"
      expected_output << main_menu_no_greeting
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_listing_multiple_movies
    create_movie("Ghostbusters")
    create_movie("Rushmore")
    shell_output = ""
    expected_output = ""
    IO.popen('./termovie manage', 'r+') do |pipe|
      expected_output << main_menu
      pipe.puts "3"
      expected_output << "1. Ghostbusters\n"
      expected_output << "   Rating: \n"
      expected_output << "   Director: \n"
      expected_output << "   Genre: \n"
      expected_output << "   URL: \n"
      expected_output << "2. Rushmore\n"
      expected_output << "   Rating: \n"
      expected_output << "   Director: \n"
      expected_output << "   Genre: \n"
      expected_output << "   URL: \n"
      expected_output << main_menu_no_greeting
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end
end