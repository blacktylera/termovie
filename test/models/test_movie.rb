require_relative '../test_helper'

describe Movie do
  describe "#all" do
    describe "if there are no movies in the database" do
      it "should return an empty array" do
        assert_equal [], Movie.all
      end
    end
    describe "if there are movies" do
      before do
        create_movie("Rushmore")
        create_movie("Ghostbusters")
        create_movie("Foot Fist Way")
      end
      it "should return an array" do
        assert_equal Array, Movie.all.class
      end
      it "should return the movies in alphabetical order" do
        expected = ["Foot Fist Way", "Ghostbusters", "Rushmore"]
        actual = Movie.all.map{ |movie| movie.name }
        assert_equal expected, actual
      end
    end
  end

  describe "#count" do
    describe "if there are no movies in the database" do
      it "should return 0" do
        assert_equal 0, Movie.count
      end
    end
    describe "if there are movies" do
      before do
        create_movie("Rushmore")
        create_movie("Ghostbusters")
        create_movie("Foot Fist Way")
      end
      it "should return the correct count" do
        assert_equal 3, Movie.count
      end
    end
  end

  describe ".initialize" do
    it "sets the name attribute" do
      movie = Movie.new("Rushmore")
      assert_equal "Rushmore", movie.name
    end
  end

  describe ".save" do
    describe "if the model is valid" do
      let(:movie){ Movie.new("Heavyweights") }
      it "should return true" do
        assert movie.save
      end
      it "should save the model to the database" do
        movie.save
        assert_equal 1, Movie.count
        last_row = Database.execute("SELECT * FROM movies")[0]
        database_name = last_row['name']
        assert_equal "Heavyweights", database_name
      end
      it "should populate the model with id from the database" do
        movie.save
        last_row = Database.execute("SELECT * FROM movies")[0]
        database_id = last_row['id']
        assert_equal database_id, movie.id
      end
    end

    describe "if the model is invalid" do
      let(:movie){ Movie.new("") }
      it "should return false" do
        refute movie.save
      end
      it "should not save the model to the database" do
        movie.save
        assert_equal 0, Movie.count
      end
      it "should populate the error messages" do
        movie.save
        assert_equal "\"\" is not a valid movie name.", movie.errors
      end
    end
  end

  describe ".valid?" do
    describe "with valid data" do
      let(:movie){ Movie.new("Rushmore") }
      it "returns true" do
        assert movie.valid?
      end
      it "should set errors to nil" do
        movie.valid?
        assert movie.errors.nil?
      end
    end
    describe "with no name" do
      let(:movie){ Movie.new(nil) }
      it "returns false" do
        refute movie.valid?
      end
      it "sets the error message" do
        movie.valid?
        assert_equal "\"\" is not a valid movie name.", movie.errors
      end
    end
    describe "with empty name" do
      let(:movie){ Movie.new("") }
      it "returns false" do
        refute movie.valid?
      end
      it "sets the error message" do
        movie.valid?
        assert_equal "\"\" is not a valid movie name.", movie.errors
      end
    end
    describe "with a name with no letter characters" do
      let(:movie){ Movie.new("777") }
      it "returns false" do
        refute movie.valid?
      end
      it "sets the error message" do
        movie.valid?
        assert_equal "\"777\" is not a valid movie name.", movie.errors
      end
    end
    describe "with a previously invalid name" do
      let(:movie){ Movie.new("666") }
      before do
        refute movie.valid?
        movie.name = "Rushmore"
        assert_equal "Rushmore", movie.name
      end
      it "should return true" do
        assert movie.valid?
      end
      it "should not have an error message" do
        movie.valid?
        assert_nil movie.errors
      end
    end
  end
end