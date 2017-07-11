
# During your Ruby adventures, you've seen that you often have many options
# when it comes to accomplishing any one goal. The if statement is no exception!
# An even more concise version of if/else is the ternary conditional expression.
# It's called "ternary" because it takes three arguments: a boolean,
# an expression to evaluate if the boolean is true, and an expression to
# evaluate if the boolean is false

# Ternary expressions take three arguments for a boolean
# for example: boolean ? Do this if true: Do this if false
puts 3 < 4 ? '3 is less than 4!' : 'The world is a lie!'

# You can make case statems much more simple!

puts 'Hello there! Please select a language:'
greeting gets.chomp
case greeting
when 'English' then puts 'Hello!'
when 'French' then puts 'Bonjour!'
when 'Spanish' then puts 'Hola!'
else puts "I don't know that language"
end

# You can also conditionally assign variables using ||=, if the variable isn't
# already assigned it will assign it.
favorite_book = nil
puts favorite_book

favorite_book ||= "Cat's Cradle"
puts favorite_book

favorite_book ||= "Why's (Poignant) Guide to Ruby"
puts favorite_book

favorite_book = "Why's (Poignant) Guide to Ruby"
puts favorite_book
# _____________________________________________________________
favorite_language = nil
puts favorite_language

favorite_language ||= 'Ruby'
puts favorite_language

# Ruby uses implicit returns, it automatically returns stuff in functions!
# no need to type return all the time

my_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

my_array.each { | i | puts i if i.even? }

# This is much easiert to use!

'L'.upto('P') { |letter| puts letter, '' }

age = 31
# you can use .respond_to? to see if you can use a method on a variable,
# for example, we can use this:
age.respond_to? (:next)
# .next will print the next integer and this returns true because you can call
# .next on an integer. Don't forget, the you use the :


=begin
Instead of typing out the .push method name, you can simply use <<,
the concatenation operator (also known as "the shovel") to add an
element to the end of an array:
=end
alphabet = ["a", "b", "c"]
alphabet.push("d") # Update me!

caption = "A giraffe surrounded by "
caption += "weezards!" # Me, too!

# so with the new stuff it's:
alphabet = ["a", "b", "c"]
alphabet << 'd' # Update me!

caption = "A giraffe surrounded by "
caption << "weezards!" # Me, too!

# lastly, you can use #{} to put varibles in an string!
favorite_things = ["Ruby", "espresso", "candy"]

puts "A few of my favorite things:"

favorite_things.each do |thing|
  puts "I love #{thing}!"
end



# This is the review, I've done some problems already, this is a good one:
favorite_animal = nil
favorite_animal ||= "cats"
puts "My favorte animal is #{favorite_animal}"


# Don't forget the no return rule
def square(num)
    num * num
end
square(2)

# fuck loops lol

3.times do
    puts "I'm a refactoring master!"
end



# Final Boss! We'll be refactoring this code:
$VERBOSE = nil    # We'll explain this at the end of the lesson.
require 'prime'   # This is a module. We'll cover these soon!

def first_n_primes(n)

  unless n.is_a? Integer
    return "n must be an integer."
  end

  if n <= 0
    return "n must be greater than 0."
  end

  prime_array = [] if prime_array.nil?

  prime = Prime.new
  for num in (1..n)
    prime_array.push(prime.next)
  end
  return prime_array
end

first_n_primes(10)



# This is the refactored code:
$VERBOSE = nil    # We'll explain this at the end of the lesson.
require 'prime'   # This is a module. We'll cover these soon!

def first_n_primes(n)

"n must be an integer."  unless n.is_a? Integer

"n must be greater than 0."   if n <= 0
  end

  prime_array ||= []

  prime = Prime.new
  n.times do
    prime_array.push(prime.next)
  end
 prime_array
end

first_n_primes(10)

n.times do
  return prime_array.push(prime.next)
end
end
