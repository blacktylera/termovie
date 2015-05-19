require "highline/import"

class MoviesController
  def index
    if Movie.count > 0
      movies = Movie.all
      movies_string = ""
      movies.each_with_index do |movie, index|
        movies_string << "#{index + 1}. #{movie.name}\n"
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

  def prompt
    name = ask("Great! What is the name of the movie?")
    rating = ask("What is this movie rated?")
    director = ask("Who is the director of this movie?")
    genre = ask("What is the genre?")
    url = ask("And the URL?")
    add= add(name, rating, director, genre, url)
    say(add) unless add.nil?
  end
end