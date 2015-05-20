require "highline/import"

class MoviesController
  def index
    if Movie.count > 0
      movies = Movie.all
      movies_string = ""
      movies.each_with_index do |movie, index|
        movies_string << "#{index + 1}. #{movie.name}\n   Rating: #{movie.rating}\n   Director: #{movie.director}\n   Genre: #{movie.genre}\n   URL: #{movie.url}\n"
      end
      movies_string
    else
      "No movies in your collection! Please add a movie.\n"
    end
  end

  def add(name, rating, director, genre, url)
    name_cleaned = name.strip
    rating_cleaned = rating.strip
    director_cleaned = director.strip
    genre_cleaned = genre.strip
    url_cleaned = url.strip
    movie = Movie.new(name_cleaned, rating_cleaned, director_cleaned, genre_cleaned, url_cleaned)
    if movie.save
      "\"#{name}\" has been added to your collection!\n"
    else
      movie.errors
    end
  end

  def edit_menu
    say("Would you like to?")
    choose do |menu|
      menu.prompt = ""
      menu.choice("Edit") do
        edit_movie
      end
      menu.choice("Delete") do
        destroy_movie
      end
      menu.choice("Exit") do
        exit
      end
    end
  end

  def edit_movie
    movie = Movie.all
    movies_controller = MoviesController.new
    say("Which movie would you like to edit?")
    say(movies_controller.index)
    movie_index = ask('')
    while movie_index.empty? or movie_index.nil?
      puts "'#{movie_index}' isn't a movie!"
      say("Which movie would you like to edit?")
      say(movies_controller.index)
      movie_index = ask('')
    end
    movie_index = movie_index.to_i - 1
    movie = movie[movie_index]
    choice = ask("What would you like to edit: Name, Rating, Director, Genre, or URL ?")
    if choice == "name"
      movie.name = ask("What is the REAL name?")
      while movie.name.empty? or choice != "name"
        movie.name = ask("What is the REAL name?")
      end
    elsif choice == "rating"
      movie.rating = ask("What is the REAL rating?")
      while movie.rating.empty?
        movie.rating = ask("What is the REAL rating?")
      end
    elsif choice == "director"
      movie.director = ask("Who is the REAL director?")
      while movie.director.empty?
        movie.director = ask("Who is the REAL director?")
      end
    elsif choice == "genre"
      movie.genre = ask("What is the REAL genre?")
      while movie.genre.empty?
        movie.genre = ask("What is the REAL genre?")
      end
    elsif choice == "url"
      movie.url = ask("What is the REAL url?")
      while movie.url.empty?
        movie.url = ask("What is the REAL url?")
      end
    end
    if movie.save
      say("Your movie has been updated!")
      say(movies_controller.index)
      return
    else
      say(movie.errors)
    end
  end

  def destroy_movie
    movie = Movie.all
    movies_controller = MoviesController.new
    say("Which movie would you like to delete?")
    say(movies_controller.index)
    movie_index = ask('')
    movie_index = movie_index.to_i - 1
    movie[movie_index]
    Movie.destroy(movie[movie_index].id)
  end

  def prompt
    name = ask("Great! What is the name of the movie?")
    rating = ask("What is this movie rated?")
    director = ask("Who is the director of this movie?")
    genre = ask("What is the genre?")
    url = ask("And the URL?")
    add= add(name, rating, director, genre, url)
    say(add) unless add.nil?
  end

  def watch_prompt
    user_input = ask("How are you feeling?")
    say("'Frankly, my user, I don't give a damn.' How about you watch this...")
    response_url = Movie.get_movie_url
    say("#{response_url["url"]}")
  end
end