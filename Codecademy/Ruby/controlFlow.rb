

# Comparisons elsif (notice, it's not ELSEIF)
if 2 * 2 < 5
    print "I made a true lol"
elsif
    print "the world is burning"
else
    print "I can't maths"
end

# You can also test if something is false with unless

hungry = false

unless
 puts "I'm writing Ruby programs!"
else
 puts "Time to eat!"
end

#Also have comparitors:
is_true = 2 != 3

is_false = 2 == 3

test_1 = 17 > 16

test_2 = 21 < 30

test_3 = 9 <= 9

test_4 = -11 <= 4


=begin
Home stretch! Let's go over boolean operators.

( 1 == 1 ) && ( 2 == 2 )  // true
( 1 == 2 ) || ( 2 == 2 ) // true
!( false ) // true
With && both comparisons on the left and right must evaluate to true for the entire statement to return true. If the left side does not return true it will not bother trying the right side
with || either the right or left side must evaluate to true. If the left side evaluates to true, the right side will not be tried because it has met the condition of one side being true.
! does the opposite. If you're false you're now true. if you're true you're now false! Just think of it as opposite day!
=end


print 'Thtring, pleathe!: '
user_input = gets.chomp
user_input.downcase!

if user_input.include? 's'
  user_input.gsub!(/s/, 'th')
else
  puts 'Nothing to do here!'
end

puts "Your string is: #{user_input}"
