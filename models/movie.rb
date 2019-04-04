require_relative('../db/sql_runner.rb')
require_relative('star.rb')

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

def stars()
  sql ='SELECT stars.* FROM stars INNER JOIN castings ON stars.id = castings.star_id WHERE castings.movie_id = $1'
  values = [@id]
  results = SqlRunner.run(sql, values)
  return results.map{|star| Star.new(star)}
end

end
