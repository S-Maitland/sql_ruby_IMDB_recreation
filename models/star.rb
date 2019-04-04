require_relative('../db/sql_runner.rb')

class Star
  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = 'INSERT INTO stars (
    first_name,
    last_name
  )
  VALUES ($1, $2)
  RETURNING ID'
  values = [@first_name, @last_name]
  @id = SqlRunner.run(sql, values)[0]['id'].to_i()
  end

  def self.all()
    sql = 'SELECT * FROM stars'
    stars = SqlRunner.run(sql)
    return stars.map {|star| Star.new(star)}
  end

  def self.delete_all()
    sql = 'DELETE FROM stars'
    SqlRunner.run(sql)
  end

end
