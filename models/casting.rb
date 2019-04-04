require_relative('../db/sql_runner.rb')

class Casting
  attr_reader :id
  attr_accessor :movie_id, :star_id, :fee

  def initialize(options)
    @movie_id = options['movie_id']
    @star_id = options['star_id']
    @fee = options['fee']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = 'INSERT INTO castings (
    movie_id,
    star_id,
    fee
  )
  VALUES ($1, $2, $3)
  RETURNING ID'
  values = [@movie_id, @star_id, @fee]
  @id = SqlRunner.run(sql, values)[0]['id'].to_i()
  end

  def self.all()
    sql = 'SELECT * FROM castings'
    castings = SqlRunner.run(sql)
    return castings.map {|casting| Casting.new(casting)}
  end

  def self.delete_all()
    sql = 'DELETE FROM castings'
    SqlRunner.run(sql)
  end

end
