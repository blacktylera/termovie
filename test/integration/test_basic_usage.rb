require_relative '../test_helper'


# class ChoosingMenuOptionTest < Minitest::Test
#   def test_exit
#     shell_output = ""
#     expected_output = ""
#     IO.popen('./termovie', 'r+') do |pipe|
#       expected_output = <<EOS
# Hey, Movie Lover! What would you like to do?

# 1. Watch a movie
# 2. Add to your list
# 3. View Your list
# 4. Edit your list
# 5. Review a movie
# 6. Exit
# EOS
#       pipe.puts "6"
#       expected_output << "I'll be back!\n"
#       pipe.close_write
#       shell_output = pipe.read
#     end
#     assert_equal expected_output, shell_output
#   end


#   def test_invalid_selector_menu_greater
#     shell_output = ""
#     expected_output = ""
#     IO.popen('./termovie', 'r+') do |pipe|
#       expected_output = <<EOS
# Hey, Movie Lover! What would you like to do?

# 1. Watch a movie
# 2. Add to your list
# 3. View Your list
# 4. Edit your list
# 5. Review a movie
# 6. Exit
# EOS
#       pipe.puts "7"
#       expected_output << "What we've got here is ... a failure to communicate. Please Try again with a valid selection.\n"
#       pipe.close_write
#       shell_output = pipe.read
#     end
#     assert_equal expected_output, shell_output
#   end

#   def test_invalid_selector_menu_lesser
#     shell_output = ""
#     expected_output = ""
#     IO.popen('./termovie', 'r+') do |pipe|
#       expected_output = <<EOS
# Hey, Movie Lover! What would you like to do?

# 1. Watch a movie
# 2. Add to your list
# 3. View Your list
# 4. Edit your list
# 5. Review a movie
# 6. Exit
# EOS
#       pipe.puts "0"
#       expected_output << "What we've got here is ... a failure to communicate. Please Try again with a valid selection.\n"
#       pipe.close_write
#       shell_output = pipe.read
#     end
#     assert_equal expected_output, shell_output
#   end

#   def test_invalid_selector_menu_nothing
#     shell_output = ""
#     expected_output = ""
#     IO.popen('./termovie', 'r+') do |pipe|
#       expected_output = <<EOS
# Hey, Movie Lover! What would you like to do?

# 1. Watch a movie
# 2. Add to your list
# 3. View Your list
# 4. Edit your list
# 5. Review a movie
# 6. Exit
# EOS
#       pipe.puts ""
#       expected_output << "What we've got here is ... a failure to communicate. Please Try again with a valid selection.\n"
#       pipe.close_write
#       shell_output = pipe.read
#     end
#     assert_equal expected_output, shell_output
#   end
# end