=begin
A method is a reusable section of code written to perform a specific task in a
 program. You might be wondering why you need to separate your code into
 methods, rather than just writing everything out in one big chunk.
 It turns out there are a few good reasons to divide your programs into methods:

If something goes wrong in your code, it's much easier to find and
fix bugs if you've organized your program well. Assigning specific
tasks to separate methods helps with this organization.

By assigning specific tasks to separate methods (an idea computer
scientists call separation of concerns), you make your program less redundant
and your code more reusable—not only can you repeatedly use the same method in
a single program without rewriting it each time, but you can even use that
method in another program.
=end


def prime(n)
  puts "That's not an integer." unless n.is_a? Integer
  is_prime = true
  for i in 2..n-1
    if n % i == 0
      is_prime = false
    end
  end
  if is_prime
    puts "#{n} is prime!"
  else
    puts "#{n} is not prime."
  end
end

prime(2)
prime(9)
prime(11)
prime(51)
prime(97)
prime(43)

#You call methods just by typing them

=begin
The solution: splat arguments. Splat arguments are arguments preceded
by a *, which signals to Ruby: "Hey Ruby, I don't know how many arguments
there are about to be, but it could be more than one."
=end

string = "This is what a string looks like"

=begin
Most methods that you've worked with have defined names that either you or
someone else gave them (i.e. [array].sort(), "string".downcase(), and so on).
You can think of blocks as a way of creating methods that don't have a name.
(These are similar to anonymous functions in JavaScript or lambdas in Python.)

Blocks can be defined with either the keywords do and end or with curly braces
({}).
=end


# method that capitalizes a word
def capitalize(string)
  puts "#{string[0].upcase}#{string[1..-1]}" #string[1..-1] refers to string[0 through the last]
end

capitalize("ryan") # prints "Ryan"
capitalize("jane") # prints "Jane"

# block that capitalizes each string in the array
["ryan", "jane"].each {|string| puts "#{string[0].upcase}#{string[1..-1]}"}
# prints "Ryan", then "Jane"

=begin
There are some differences between blocks and methods, however.
Check out the code in the editor. The capitalize method capitalizes a
word (see the Hint for how this is done), and we can continually invoke the
capitalize method by name. We can capitalize("matz"), capitalize("eduardo"),
or any string we like to our hearts' content.
However, the block that we define (following .each) will only be called once,
and in the context of the array that we are iterating over. It appears just
long enough to do some work for each, then vanishes into the night.
=end

[1, 2, 3, 4, 5].each { |i| puts i }

[1, 2, 3, 4, 5].each { |i| puts i * 5 }

=begin
We can also use a new operator called the combined comparison operator to
compare two Ruby objects. The combined comparison operator looks like this:
<=>. It returns 0 if the first operand (item to be compared)
equals the second, 1 if first operand is greater than the second, and -1 if
the first operand is less than the second.
=end

book_1 = "A Wrinkle in Time"

book_2 = "A Brief History of Time"


book_2 <=> book_1

#We can also use this to sort books from Z to A and A to Z

books = ["Charlie and the Chocolate Factory", "War and Peace", "Utopia",
  "A Brief History of Time", "A Wrinkle in Time"]

puts books.sort! { |firstBook, secondBook| firstBook <=> secondBook }

puts books.sort! { |firstBook, secondBook| secondBook <=> firstBook}


#Make a method that multiplies each element by itself:

my_array = [1, 2, 3, 4, 5]

my_array.each do |n|
  n *= n
  puts "#{n}"
end

#Order the array in decending order i.e Z to A

fruits = ["orange", "apple", "banana", "pear", "grapes"]

puts fruits.sort! { |firstFrut, secondFruit| secondFruit <=> firstFrut}


#Ruby Project: We're going to make a method to sort large amounts of data:

def alphabetize(arr, rev= true)
if rev == true
    puts arr.sort! { |first, second| first <=> second }
else
    puts arr.sort! { |first, second| second <=> first }
end
end

numbers = [1, 13, 25, 23, 12, 4]

alphabetize(numbers, 1)

#look up a linter, it checks how your program in formatted.
