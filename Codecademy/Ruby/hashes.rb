my_hash = {
'audi' => 'S4',
'Land Rover' => 'Discovery' }




# print out the value not the keys!
matz = {
  'First name' => 'Yukihiro',
  'Last name' => 'Matsumoto',
  'Age' => 47,
  'Nationality' => 'Japanese',
  'Nickname' => 'Matz'
}

matz.each do |key, value|
  puts value, matz[value]
end

=begin
Every hash has a default value : "Nil". There's True, False and Nil. False and Nil
are NOT the same thing...
So when you try to access a key in a hash that doesn't exist, in other languages
it would throw in an error. In Ruby, you get Nil instead
=end
no_nil_hash = Hash.new("Nope!")

#Symbols, yo!

menagerie = { :foxes => 2,
  :giraffe => 1,
  :weezards => 17,
  :elves => 1,
  :canaries => 4,
  :ham => 1
}

=begin
We can certainly use strings as Ruby hash keys; as we've seen, there's always
more than one way to do something in Ruby. However, the Rubyist's
approach would be to use symbols.
=end

=begin
What's a Symbol?
You can think of a Ruby symbol as a sort of name.
It's important to remember that symbols aren't strings:
"string" == :string # false
Above and beyond the different syntax, there's a key behavior of symbols that
makes them different from strings: while there can be multiple different
strings that all have the same value, there's only one copy of any particular
symbol at a given time. For Example:
=end

puts 'string'.object_id
puts 'string'.object_id

puts :symbol.object_id
puts :symbol.object_id

=begin
The .object_id method gets the ID of an object—it's how Ruby knows
whether two objects are the exact same object. Run the code in the editor
to see that the two "strings" are actually different objects,
whereas the :symbol is the same object listed twice.
=end

#making symbols is easy. it's a lot like objects in JS:

multiPass = { :myPass => "Password@",
  :customerPass => "Password12",
  :goodPass => "passWordlol"
}

# Don't forget the fuckin' commas
=begin
multiPass do |key, value|
  puts :key, multiPass[:key]
end
I couldn't get this to work
=end

#you can convert string to symbols using .to_sym and symbols to strings with .to_s

strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]

# Add your code below!

symbols = []

strings.each do |s|
 symbols = symbols.push(s.to_sym)
end

puts symbols

# You can also convert to symbols using .intern


#They taught the "hash rocket" first:


movies = {
:ASpaceOdessy => "Sci-Fi",
:Apocalypse_Now => "War",
}

#You can also use normal syntax, which is like JS:

movies = {
ASpaceOdessy: "Sci-Fi",
Apocalypse_Now: "War",
}


#We can also filter a hash for values that meet a certain criteria by
#using .select. Here's an example:
#We want to select movies with a rating higher that 3
movie_ratings = {
  memento: 3,
  primer: 3.5,
  the_matrix: 5,
  truman_show: 4,
  red_dawn: 1.5,
  skyfall: 4,
  alex_cross: 2,
  uhf: 1,
  lion_king: 3.5
}
good_movies = movie_ratings.select {|movie, score| score > 3}

puts good_movies

#Also, you can just select only keys or only values (this IS Ruby, after all)

movie_ratings.each_key { |movie| puts movie, ''}

movie_ratings.each_value {|score| puts score, ''}


#A Night at the Movies! We're gonna make code that adds updates & Stuff

movies = {
  Memento: 3,
  Primer: 4,
  Ishtar: 1
}

puts "What would you like to do?"
puts "-- Type 'add' to add a movie."
puts "-- Type 'update' to update a movie."
puts "-- Type 'display' to display all movies."
puts "-- Type 'delete' to delete a movie."

choice = gets.chomp.downcase
case choice
when 'add'
  puts "What movie do you want to add?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "What's the rating? (Type a number 0 to 4.)"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "#{title} has been added with a rating of #{rating}."
  else
    puts "That movie already exists! Its rating is #{movies[title.to_sym]}."
  end
when 'update'
  puts "What movie do you want to update?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Movie not found!"
  else
    puts "What's the new rating? (Type a number 0 to 4.)"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "#{title} has been updated with new rating of #{rating}."
  end
when 'display'
  movies.each do |movie, rating|
    puts "#{movie}: #{rating}"
  end
when 'delete'
  puts "What movie do you want to delete?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Movie not found!"
  else
    movies.delete(title.to_sym)
    puts "#{title} has been removed."
  end
else
  puts "Sorry, I didn't understand you."
end





movie_ratings = {
  memento: 3,
  primer: 3.5,
  the_matrix: 5,
  truman_show: 4,
  red_dawn: 1.5,
  skyfall: 4,
  alex_cross: 2,
  uhf: 1,
  lion_king: 3.5
}
good_movies = movie_ratings.select {|movie, score| score > 3}

puts good_movies

#Also, you can just select only keys or only values (this IS Ruby, after all)

movie_ratings.each_key { |movie| puts movie, ''}

movie_ratings.each_value {|score| puts score, ''}

# You can use if statements on one line:
# It's a lot easier!

puts 'it is true' if true
