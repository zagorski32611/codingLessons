=begin
Blocks can be combined with methods like .each and
.times to execute an instruction for each element in a collection
(like a hash or array).
=end

fibs = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

# Add your code below!

doubled_fibs = fibs.collect { |num| num * 2 }


=begin
The collect method takes a block and applies the expression in the block to
every element in an array. Check it out:

my_nums = [1, 2, 3]
my_nums.collect { |num| num ** 2 }
# ==> [1, 4, 9]
If we look at the value of my_nums, though, we'll see it hasn't changed:

my_nums
# ==> [1, 2, 3]
This is because .collect returns a copy of my_nums, but doesn't change
(or mutate) the original my_nums array. If we want to do that, we can use
.collect! with an exclamation point:

my_nums.collect! { |num| num ** 2 }
# ==> [1, 4, 9]
my_nums
# ==> [1, 4, 9]
Recall that the ! in Ruby means "this method could do something dangerous or
unexpected!" In this case, it mutates the original array instead of creating
a new one.
=end


def yield_name(name)
  puts "In the method! Let's yield."
  yield("Kim")
  puts "In between the yields!"
  yield(name)
  puts "Block complete! Back in the method."
end

yield_name("Eric") { |n| puts "My name is #{n}." }


def horsepwer(num)
  puts "How many does it make?"
  yield("320")
  puts "It makes 320"
  yield(num)
  puts num * 2
end
horsepower(320)


#This is one the works
def double(num)
  yield(num)
end

double(16) {|x| puts x * 2}

floats = [1.2, 3.45, 0.91, 7.727, 11.42, 482.911]
# Write your code below this line!
round_dowm = Proc.new do |n|
  n.round_down
end


# Write your code above this line!
ints = floats.collect(&round_down)
print ints

over_4_feet = Proc.new do |height|
  return height >= 4
end
