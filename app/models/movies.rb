class Movie
  attr_reader :id, :errors
  attr_accessor :name

  def initialize(name = nil)
    self.name = name
  end

  def self.all
    Database.execute("select name from movies order by name ASC").map do |row|
      movie = Movie.new
      movie.name = row[0]
      movie
    end
  end

  def self.count
    Database.execute("select count(id) from movies")[0][0]
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
    Database.execute("INSERT INTO movies (name) VALUES (?)", name)
    @id = Database.execute("SELECT last_insert_rowid()")[0]['last_insert_rowid()']
  end
end