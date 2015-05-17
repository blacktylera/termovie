require 'rubygems'
require 'bundler/setup'
require "minitest/reporters"
Dir["./app/**/*.rb"].each { |f| require f }
Dir["./lib/*.rb"].each { |f| require f }
ENV["TEST"] = "true"

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

require 'minitest/autorun'
class Minitest::Test
  def setup
    Database.load_structure
    Database.execute("DELETE FROM movies;")
  end
end

def create_movie(name)
  Database.execute("INSERT INTO movies (name) VALUES (?)", name)
end

def main_menu
  "1. Watch a movie\n2. Add to your list\n3. View your list\n4. Edit your list\n5. Review a movie\n6. Exit"
end
