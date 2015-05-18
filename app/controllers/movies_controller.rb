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

  def add(name)
    name_cleaned = name.strip
    movie = Movie.new(name_cleaned)
    if movie.save
      "\"#{name}\" has been added to your collection!\n"
    else
      movie.errors
    end
  end

  def remove(name)
    if Movie.delete(name)
      "#{name} was deleted successfully"
    else
      "Movie not found"
    end
  end


  def prompt
    name = ask("Great! What is the name of the movie?")
    rating = ask("What is this movie rated?")
    director = ask("Who is the director of this movie?")
    genre = ask("What is the genre?")
    url = ask("And the URL?")
    add_response = add(name)
    say(add_response) unless add_response.nil?
  end
end