require_relative '../test_helper'


class ChoosingMenuOptionTest < Minitest::Test
  def test_exit
    shell_output = ""
    expected_output = ""
    IO.popen('./termovie manage', 'r+') do |pipe|
      expected_output = <<EOS
Hey, Movie Lover! What would you like to do?
1. Watch a movie
2. Add to your list
3. View your list
4. Edit your list
5. Review a movie
6. Exit
EOS
      pipe.puts "6"
      expected_output << "'I'll be back!'\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end


  def test_invalid_selector_menu_greater
    shell_output = ""
    expected_output = ""
    IO.popen('./termovie manage', 'r+') do |pipe|
      expected_output = <<EOS
Hey, Movie Lover! What would you like to do?
1. Watch a movie
2. Add to your list
3. View your list
4. Edit your list
5. Review a movie
6. Exit
EOS
      pipe.puts "7"
      expected_output << "You must choose one of [1, 2, 3, 4, 5, 6, Watch a movie, Add to your list, View your list, Edit your list, Review a movie, Exit].
?  "
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_invalid_selector_menu_lesser
    shell_output = ""
    expected_output = ""
    IO.popen('./termovie manage', 'r+') do |pipe|
      expected_output = <<EOS
Hey, Movie Lover! What would you like to do?
1. Watch a movie
2. Add to your list
3. View your list
4. Edit your list
5. Review a movie
6. Exit
EOS
      pipe.puts "0"
      expected_output << "You must choose one of [1, 2, 3, 4, 5, 6, Watch a movie, Add to your list, View your list, Edit your list, Review a movie, Exit].
?  "
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_invalid_selector_menu_nothing
    shell_output = ""
    expected_output = ""
    IO.popen('./termovie manage', 'r+') do |pipe|
      expected_output = <<EOS
Hey, Movie Lover! What would you like to do?
1. Watch a movie
2. Add to your list
3. View your list
4. Edit your list
5. Review a movie
6. Exit
EOS
      pipe.puts ""
      expected_output << "Ambiguous choice.  Please choose one of [1, 2, 3, 4, 5, 6, Watch a movie, Add to your list, View your list, Edit your list, Review a movie, Exit].
?  "
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end
end