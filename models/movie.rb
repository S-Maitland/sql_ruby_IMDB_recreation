require_relative('../db/sql_runner.rb')

class Movie
  attr_reader :id
  attr_accessor :title, :genre

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = 'INSERT INTO movies (
    title,
    genre
  )
  VALUES ($1, $2)
  RETURNING ID'
  values = [@title, @genre]
  @id = SqlRunner.run(sql, values)[0]['id'].to_i()
  end

def self.all()
  sql = 'SELECT * FROM movies'
  movies = SqlRunner.run(sql)
  return movies.map {|movie| Movie.new(movie)}
end

def self.delete_all()
  sql = 'DELETE FROM movies'
  SqlRunner.run(sql)
end


end
