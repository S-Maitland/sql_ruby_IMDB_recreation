require ('pg')

class SqlRunner

  def self.run(sql, values =[])
    #connect to database
    begin
      db = PG.connect({host: 'localhost', dbname: 'IMDB'})
    #prepare statement
    db.prepare('query', sql)
    #exec your prepared statement
    result = db.exec_prepared('query', values)
    #ensure database closes in case of connection drop
    ensure
      db.close() if db != nil
    end
    return result
  end

end
