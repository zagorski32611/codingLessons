#A while loop in Ruby that prints out all numbers from 1 to 11

counter = 1
while counter < 11
  puts counter
  counter = counter + 1
end

#This is an until loop:
counter = 1
until counter == 11
  puts counter
 counter = counter += 1

end

#It's very similar to a while loop. Except is runs UNTIL counter == 11.

=begin
A shortcut is to use an assignment operator.
You already know one assignment operator: =, which sets a variable.
 You can update a variable with additional assignment operators,
 however, which include +=, -=, *=, and /=. For instance, when you type
 counter += 1
You're telling Ruby: "Add 1 to counter, then assign that new value back to counter."
=end
#Also! Ruby does not support increments: ++ or --. Only += or -=.
-

#Also, instead of count = counter += 1, you can just write: counter += 1



=begin
for num in 1...10. What this says to Ruby is: "For the variable num in the
range 1 to 10, do the following." The following was to print "#{num}", so as
num took on the values of 1 to 9, one at a time, those values were printed to
the console. The reason Ruby counted to 9 and not 10 was because we used three
dots in the range; this tells Ruby to exclude the final number in the count:
for num in 1...10 means "go up to but don't include 10." If we use two dots,
this tells Ruby to include the highest number in the range.
=end

# so, for the loop, 1..15 prints 1 - 15 and 1...15 prints 1 -14

for num in 1..15
  puts num
end #prints 1 through 15

for num in 1...15
  puts num
end #prints 1 through 14

=begin
We can also use an interator, that executes a block of code until a certain
condition is met. The simplest iterator in a loop.
n Ruby, curly braces ({}) are generally interchangeable with the keywords
do (to open the block) and end (to close it). Knowing this, we can write a
smarter loop than the one above:

i = 0
loop do
  i += 1
  print "#{i}"
  break if i > 5
end

The break keyword is our Get Out of Jail Free card:
it breaks a loop as soon as its condition is met.
=end

i = 20
loop do
  i -= 1
  print "#{i}"
  break if i <= 0
end

=begin
the next key word will skip certain steps of a loop:
=end

i = 20
loop do
  i -= 1
  next if i % 2 != 0
  print "#{i}"
  break if i <= 0
end
#for example, this code uses next if the number is odd. so it only prints EVEN numbers

=begin
A more useful iterator is the .each method, which can apply an expression to
each element of an object, one at a time. The syntax looks like this:

object.each { |item| # Do something }
You can also use the do keyword instead of {}:

object.each do |item| # Do something end
=end

array = [1, 2, 3, 4, 5]

array.each do |x|
  x += 10
  print "#{x}"
end



#this one prints the double of each number in the odds array
odds = [1,3,5,7,9]

odds.each do |x|
    x *= 2
    print "#{x}"
end




# so I wrot a while loop that prints 1 through 50. Now an until loop does the
# same thing

i = 1
while i <= 50
print i
i += 1
end

j = 1
until j == 51
  print j
  j += 1
  end


#This was a question: Print "Ruby!" 30 times to the console:

counter = 0
loop do
    counter += 1
    print "Ruby!"
   break if counter == 30
end

#This works a little better:

30.times do
print "Ruby!"
end

puts "Text to search through: "
text = gets.chomp
puts "Word to redact: "
redact = gets.chomp

words = text.split(" ")

words.each do |word|
  if word != redact
    print word + " "
  else
    print "REDACTED "
  end
end
