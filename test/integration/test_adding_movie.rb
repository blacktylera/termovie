require_relative '../test_helper'

class AddingANewMovieTest < Minitest::Test
  def test_happy_path_adding_a_movie
    shell_output = ""
    expected_output = main_menu
    test_movie = "Rushmore"
    IO.popen('./termovie manage', 'r+') do |pipe|
      pipe.puts "2"
      expected_output << "Great! What is the name of the movie?\n"
      pipe.puts test_movie
      expected_output << "\"#{test_movie}\" has been added\n"
      expected_output << main_menu
      pipe.puts "3"
      expected_output << "1. #{test_movie}\n"
      shell_output = pipe.read
      pipe.close_write
      pipe.close_read
    end
    assert_equal expected_output, shell_output
  end

  def test_sad_path_adding_a_movie
    skip
    shell_output = ""
    happy_movie = "Ghostbusters"
    expected_output = main_menu
    IO.popen('./termovie manage', 'r+') do |pipe|
      pipe.puts "2"
      expected_output << "Great! What is the name of the movie?\n"
      pipe.puts ""
      expected_output << "\"\" is not a valid movie name.\n"
      expected_output << "Great! What is the name of the movie?\n"
      pipe.puts happy_movie
      expected_output << "\"#{happy_movie}\" has been added\n"
      expected_output << main_menu
      pipe.puts "3"
      expected_output << "1. #{movie}"
      shell_output = pipe.read
      pipe.close_write
      pipe.close_read
    end
    assert_equal expected_output, shell_output
  end
end