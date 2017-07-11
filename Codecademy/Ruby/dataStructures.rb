=begin
Ruby also has the very similar array functions to JS.
For example, they're indexed the same way:
the first entry is 0 THEN 1, etc.
=end

my_array = ["Range Rover", "Discovery", "Defender"]

print my_array[1]
#this prints "Discovery"


#you can also use multidimensional arrays too

multi_d_array = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]


=begin
Ruby also have objects, called hashes. A great way to describe them is
a set of key > value pairs. THis is just like an object in JS:

object = function() {
 key = value

}
=end
my_hash = { "name" => "Eric",
  "age" => 26,
  "hungry?" => true
}

puts my_hash["name"]
puts my_hash["age"]
puts my_hash["hungry?"]

#or in Hash.new form:

pets = Hash.new

pets["Gato"] = "cat"

#you can access them just like an array:

puts pets["Gato"] #this prints 'cat'



=begin
Iterating over arrays is easier than JavaScript!

numbers = [1, 2, 3, 4, 5]
numbers.each { |element| puts element }

In the example above, we create an array called numbers with 5 elements.
Then we say, "Take this array and for each element, print it to the console."
As usual, we can use any placeholder name for the bit between two | | characters.
=end

languages = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]

languages.each { |butthole| puts butthole}


#You can also iterate over each item in a multidimensional array:

s = [["ham", "swiss"], ["turkey", "cheddar"], ["roast beef", "gruyere"]]

s.each {|sub_array| puts sub_array}




#When iterating over hashes, we need two placeholder variables to represent
#each key/value pair.

secret_identities = {
  "The Batman" => "Bruce Wayne",
  "Superman" => "Clark Kent",
  "Wonder Woman" => "Diana Prince",
  "Freakazoid" => "Dexter Douglas"
}

secret_identities.each do |superhero, real|
puts "#{superhero}: #{real}"
end


#Also, if yopu just one to print one or the other, just remove one of the
#variables on the puts line. Like "#{superhero}"


puts "Please insert some text"
text = gets.chomp
words = text.split

frequencies = Hash.new(0)

words.each { |word| frequencies[word] += 1}
frequencies = frequencies.sort_by {|a, b| b}

frequencies.reverse!

frequencies.each do |word, number|
    puts word + " " + number.to_s
end


#this is a histogram! I made it myself lol
