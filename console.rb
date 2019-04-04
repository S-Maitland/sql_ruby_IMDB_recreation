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

movie2 = Movie.new({
  'title' => 'Point Break',
  'genre' => 'Action'
  })
movie2.save()

star1 = Star.new({
  'first_name' => 'Keanu',
  'last_name' => 'Reeves'
  })
star1.save()

star2 = Star.new({
  'first_name' => 'Laurence',
  'last_name' => 'Fishburne'
  })
star2.save()

star3 = Star.new({
  'first_name' => 'Carrie-Anne',
  'last_name' => 'Moss'
  })
star3.save()

casting1 = Casting.new({
  'movie_id' => "#{movie1.id}",
  'star_id' => "#{star1.id}",
  'fee' => '100'
  })
casting1.save()

casting2 = Casting.new({
  'movie_id' => "#{movie1.id}",
  'star_id' => "#{star2.id}",
  'fee' => '100'
  })
casting2.save()

casting3 = Casting.new({
  'movie_id' => "#{movie1.id}",
  'star_id' => "#{star3.id}",
  'fee' => '100'
  })
casting3.save()

casting4 = Casting.new({
  'movie_id' => "#{movie2.id}",
  'star_id' => "#{star1.id}",
  'fee' => '100'
  })
casting4.save()

binding.pry
nil
