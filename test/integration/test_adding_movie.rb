require_relative '../test_helper'

class AddingANewMovieTest < Minitest::Test
  def test_happy_path_adding_a_movie
    shell_output = ""
    test_movie = "Rushmore"
    test_rating = "R"
    test_director = "Wes Anderson"
    test_genre = "Comedy"
    expected_output = ""
    test_url = "http://www.netflix.com/WiPlayer?movieid=70000782&trkid=13463723&tctx=0,35,33841568-df9e-46a3-b2b9-5b349788edf8-29125479"
    IO.popen('./termovie manage', 'r+') do |pipe|
      expected_output << main_menu
      pipe.puts "2"
      expected_output << "Great! What is the name of the movie?\n"
      pipe.puts test_movie
      expected_output << "What is this movie rated?\n"
      pipe.puts test_rating
      expected_output << "Who is the director of this movie?\n"
      pipe.puts test_director
      expected_output << "What is the genre?\n"
      pipe.puts test_genre
      expected_output << "And the URL?\n"
      pipe.puts test_url
      shell_output = pipe.read
      pipe.close_write
      pipe.close_read
    end
    assert_equal expected_output, shell_output
  end

  def test_happy_path_adding_a_movie_dif
    shell_output = ""
    test_movie = "Pulp Fiction"
    test_rating = "R"
    test_director = "Quentin Tarantino"
    test_genre = "Action"
    expected_output = ""
    test_url = "http://www.netflix.com/WiPlayer?movieid=70000782&trkid=13463723&tctx=0,35,33841568-df9e-46a3-b2b9-5b349788edf8-29125479"
    IO.popen('./termovie manage', 'r+') do |pipe|
      expected_output << main_menu
      pipe.puts "2"
      expected_output << "Great! What is the name of the movie?\n"
      pipe.puts test_movie
      expected_output << "What is this movie rated?\n"
      pipe.puts test_rating
      expected_output << "Who is the director of this movie?\n"
      pipe.puts test_director
      expected_output << "What is the genre?\n"
      pipe.puts test_genre
      expected_output << "And the URL?\n"
      pipe.puts test_url
      shell_output = pipe.read
      pipe.close_write
      pipe.close_read
    end
    assert_equal expected_output, shell_output
  end


  def test_sad_path_adding_a_movie_name
    shell_output = ""
    test_movie = "Pulp Fiction"
    test_rating = "R"
    test_director = "Quentin Tarantino"
    test_genre = "Action"
    expected_output = ""
    test_url = "http://www.netflix.com/WiPlayer?movieid=70000782&trkid=13463723&tctx=0,35,33841568-df9e-46a3-b2b9-5b349788edf8-29125479"
    IO.popen('./termovie manage', 'r+') do |pipe|
      expected_output << main_menu
      pipe.puts "2"
      expected_output << "Great! What is the name of the movie?\n"
      pipe.puts ""
      expected_output << "'What we have here is a failure to communicate.'\n"
      expected_output << "Great! What is the name of the movie?\n"
      pipe.puts test_movie
      expected_output << "What is this movie rated?\n"
      pipe.puts test_rating
      expected_output << "Who is the director of this movie?\n"
      pipe.puts test_director
      expected_output << "What is the genre?\n"
      pipe.puts test_genre
      expected_output << "And the URL?\n"
      pipe.puts test_url
      shell_output = pipe.read
      pipe.close_write
      pipe.close_read
    end
    assert_equal expected_output, shell_output
  end
  def test_sad_path_adding_a_movie_rating
    shell_output = ""
    test_movie = "Pulp Fiction"
    test_rating = "R"
    test_director = "Quentin Tarantino"
    test_genre = "Action"
    expected_output = ""
    test_url = "http://www.netflix.com/WiPlayer?movieid=70000782&trkid=13463723&tctx=0,35,33841568-df9e-46a3-b2b9-5b349788edf8-29125479"
    IO.popen('./termovie manage', 'r+') do |pipe|
      expected_output << main_menu
      pipe.puts "2"
      expected_output << "Great! What is the name of the movie?\n"
      pipe.puts test_movie
      expected_output << "What is this movie rated?\n"
      pipe.puts ""
      expected_output << "'What we have here is a failure to communicate.'\n"
      expected_output << "What is this movie rated?\n"
      pipe.puts test_rating
      expected_output << "Who is the director of this movie?\n"
      pipe.puts test_director
      expected_output << "What is the genre?\n"
      pipe.puts test_genre
      expected_output << "And the URL?\n"
      pipe.puts test_url
      shell_output = pipe.read
      pipe.close_write
      pipe.close_read
    end
    assert_equal expected_output, shell_output
  end

  def test_sad_path_adding_a_movie_director
    shell_output = ""
    test_movie = "Pulp Fiction"
    test_rating = "R"
    test_director = "Quentin Tarantino"
    test_genre = "Action"
    expected_output = ""
    test_url = "http://www.netflix.com/WiPlayer?movieid=70000782&trkid=13463723&tctx=0,35,33841568-df9e-46a3-b2b9-5b349788edf8-29125479"
    IO.popen('./termovie manage', 'r+') do |pipe|
      expected_output << main_menu
      pipe.puts "2"
      expected_output << "Great! What is the name of the movie?\n"
      pipe.puts test_movie
      expected_output << "What is this movie rated?\n"
      pipe.puts test_rating
      expected_output << "Who is the director of this movie?\n"
      pipe.puts ""
      expected_output << "'What we have here is a failure to communicate.'\n"
      expected_output << "Who is the director of this movie?\n"
      pipe.puts test_director
      expected_output << "What is the genre?\n"
      pipe.puts test_genre
      expected_output << "And the URL?\n"
      pipe.puts test_url
      shell_output = pipe.read
      pipe.close_write
      pipe.close_read
    end
    assert_equal expected_output, shell_output
  end

  def test_sad_path_adding_a_movie_genre
    shell_output = ""
    test_movie = "Pulp Fiction"
    test_rating = "R"
    test_director = "Quentin Tarantino"
    test_genre = "Action"
    expected_output = ""
    test_url = "http://www.netflix.com/WiPlayer?movieid=70000782&trkid=13463723&tctx=0,35,33841568-df9e-46a3-b2b9-5b349788edf8-29125479"
    IO.popen('./termovie manage', 'r+') do |pipe|
      expected_output << main_menu
      pipe.puts "2"
      expected_output << "Great! What is the name of the movie?\n"
      pipe.puts test_movie
      expected_output << "What is this movie rated?\n"
      pipe.puts test_rating
      expected_output << "Who is the director of this movie?\n"
      pipe.puts test_director
      expected_output << "What is the genre?\n"
      pipe.puts ""
      expected_output << "'What we have here is a failure to communicate.'\n"
      expected_output << "What is the genre?\n"
      pipe.puts test_genre
      expected_output << "And the URL?\n"
      pipe.puts test_url
      shell_output = pipe.read
      pipe.close_write
      pipe.close_read
    end
    assert_equal expected_output, shell_output
  end
    def test_sad_path_adding_a_movie_url
    shell_output = ""
    test_movie = "Pulp Fiction"
    test_rating = "R"
    test_director = "Quentin Tarantino"
    test_genre = "Action"
    expected_output = ""
    test_url = "http://www.netflix.com/WiPlayer?movieid=70000782&trkid=13463723&tctx=0,35,33841568-df9e-46a3-b2b9-5b349788edf8-29125479"
    IO.popen('./termovie manage', 'r+') do |pipe|
      expected_output << main_menu
      pipe.puts "2"
      expected_output << "Great! What is the name of the movie?\n"
      pipe.puts test_movie
      expected_output << "What is this movie rated?\n"
      pipe.puts test_rating
      expected_output << "Who is the director of this movie?\n"
      pipe.puts test_director
      expected_output << "What is the genre?\n"
      pipe.puts test_genre
      expected_output << "And the URL?\n"
      pipe.puts ""
      expected_output << "'What we have here is a failure to communicate.'\n"
      expected_output << "And the URL?\n"
      pipe.puts test_url
      shell_output = pipe.read
      pipe.close_write
      pipe.close_read
    end
    assert_equal expected_output, shell_output
  end
end