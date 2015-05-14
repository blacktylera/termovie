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
    scenario = Movie.new(name_cleaned)
    if movie.save
      "\"#{name}\" has been added\n"
    else
      movies.errors
    end
  end
end