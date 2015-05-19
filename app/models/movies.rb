class Movie
  attr_reader :id, :errors
  attr_accessor :name, :rating, :director, :genre, :url, :id

  def initialize(name, rating, director, genre, url)
    @id = id
    @name = name
    @rating = rating
    @director = director
    @genre = genre
    @url = url
  end

  def ==(other)
    other.is_a?(Movie) && other.id == self.id
  end

  def self.all
    Database.execute("select * from movies order by name ASC").map do |row|
      movie = Movie.new(row["name"], row["rating"], row["director"], row["genre"], row["url"])
      movie.id = row["id"]
      movie.name = row["name"]
      movie.rating = row["rating"]
      movie.director = row["director"]
      movie.genre = row["genre"]
      movie.url = row["url"]
      movie
    end
  end

  def self.count
    Database.execute("select count(id) from movies")[0][0]
  end

  def self.find(id)
    row = Database.execute("select * from movies where id = ?", id).first
    if row.nil?
      nil
    else
      populate_from_database(row)
    end
  end

  def self.find_by_name(name)
    row = Database.execute("select * from movies where name LIKE ?", name).first
    if row.nil?
      nil
    else
      populate_from_database(row)
    end
  end

  def valid?
    if name.nil? or name.empty? or /^\d+$/.match(name)
      @errors = "\"#{name}\" is not a valid movie name."
      false
    else
      @errors = nil
      true
    end
  end

  def save
    return false unless valid?
    if @id.nil?
      Database.execute("INSERT INTO movies (name, rating, director, genre, url) VALUES (?, ?, ?, ?, ?)", name, rating, director, genre, url)
      @id = Database.execute("SELECT last_insert_rowid()")[0][0]
    else
      Database.execute("UPDATE movies SET name = ?, rating = ?, director = ?, genre = ?, url = ? WHERE id = ?", name, rating, director, genre, url, id)
    end
  end

  private

  def self.populate_from_database(row)
    movie = Movie.new
    movie.name = row['name']
    movie.instance_variable_set(:@id, row['id'])
    movie
  end
end