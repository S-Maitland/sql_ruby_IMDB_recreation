require('pry-byebug')
require_relative('models/movie.rb')
require_relative('models/star.rb')
require_relative('models/casting.rb')
require_relative('db/sql_runner.rb')

movie1 = Movie.new({
  'title' => 'Matrix',
  'genre' => 'Sci-fi'
  })
  movie1.save()

star1 = Star.new({
  'first_name' => 'Keanu',
  'last_name' => 'Reeves'
  })
star1.save()

casting1 = Casting.new({
  'movie_id' => "#{movie1.id}",
  'star_id' => "#{star1.id}",
  'fee' => '100'
  })

casting1.save()
binding.pry
nil
