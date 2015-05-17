require 'sqlite3'

class Database

  def self.load_structure
    Database.execute <<-SQL
    CREATE TABLE IF NOT EXISTS movies (
      id integer PRIMARY KEY AUTOINCREMENT,
      name varchar(255) NOT NULL
      year varchar(4) NOT NULL
      rating varchar(4) NOT NULL
      director varchar(255) NOT NULL
      genre varchar(20) NOT NULL
      url varchar (500) NOT NULL
    );
    SQL
  end

  def self.execute(*args)
    initialize_database unless defined?(@@db)
    @@db.execute(*args)
  end

  def self.initialize_database
    environment = ENV["TEST"] ? "test" : "production"
    database = "db/termovie_#{environment}.sqlite"
    @@db = SQLite3::Database.new(database)
    @@db.results_as_hash = true
  end
end