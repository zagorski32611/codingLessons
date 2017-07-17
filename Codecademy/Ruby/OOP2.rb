=begin
Let's build a class!

class ClassName
  def method_name(parameter)
    @class_Variable = parameter
  end
end
First we tell Ruby that we want to construct our class ClassName. Don't forget the end to end your class!
Inside our ClassName is where we define our methods. Here we have MethodName followed by (parameter), When we use this method it will look like this MethodName("hello!")
If our parameter above were "Hello!" it would be assigned to our variable @classVariable on the following line.
Again, don't forget to end your MethodName!


First, create a class named Dog

Create a method initialize within your class Dog.

Allow your initialize method to accept two parameters, name and breed.

Inside your initialize method assign those two parameters to the variables @name and @breed respectively
=end

class Dog
  def initialize(name, breed)
    @name = name
    @breed = breed
  end
end


=begin
Great work! Now we'll get into the details of public and private methods.

Methods are public by default in Ruby, so if you don't specify public or private, your methods will be public.
In this case, however, we want to make it clear to people reading our code which methods are public.
We do this by putting public before our method definitions, like so:

class ClassName
  # Some class stuff
  public
  def public_method
    # public_method stuff
  end
end
Note that everything after the public keyword through the end of the class definition will now be public unless we say otherwise.
(We'll say otherwise in the next exercise.)
.
For now, let's add a public method called bark to Dog. The bark method should puts "Woof!".
=end
class Dog
  public
  def initialize(name, breed)
    @name = name
    @breed = breed
  end
  public
  def bark()
    puts "Woof!"
  end
end




=begin
Perfect! But not all our Ruby methods should be public.

Just as we use public to announce our public methods, we use private to specify our private ones:

class ClassName
  # Some class stuff

  public
  # Public methods go here
  def public_method; end

  private
  # Private methods go here
  def private_method; end
end
private methods are just that: they're private to the object where they are defined. This means you can only
call these methods from other code inside the object. Another way to say this is that the method cannot be
called with an explicit receiver. You've been using receivers all along—these are the objects on which
methods are called! Whenever you call object.method, object is the receiver of the method.

In order to access private information, we have to create public methods that know how to get it.
This separates the private implementation from the public interface, and we'll go over this in more
detail in the next two exercises.

Add a private method called id to Dog. The id method should create an @id_number instance variable and set it equal to 12345.
=end

class Dog
  public
  def initialize(name, breed)
    @name = name
    @breed = breed
  end
  public
  def bark()
    puts "Woof!"
  end
  private
  def id()
    @id_number = 12345
  end
end


=begin
We saw in the lesson on classes that Ruby needs methods in order to access attributes. For instance, if we want to access a @name instance variable, we had to write something like

def name
  @name
end
Well, no longer! We can use attr_reader to access a variable and attr_writer to change it. If we write

class Person
  attr_reader :name
  attr_writer :name
  def initialize(name)
    @name = name
  end
end
Ruby does something like this for us automatically:

def name
  @name
end

def name=(value)
  @name = value
end
Like magic, we can read and write variables as we please! We just pass our instance variables (as symbols) to attr_reader or attr_writer.

(That name= might look funny, but you're allowed to put an = sign in a method name. That's just a Ruby convention saying, "hey, this method sets a value!")
Instructions
1.
We've brought back our Person class with a method for getting @name and a method for changing his or her @job.
Go ahead and remove the name and job= methods and add an attr_reader for :name and an attr_writer for :job.
=end
#This is how it was befor answering the question:
class Person
  def initialize(name, job)
    @name = name
    @job = job
  end

  def name
    @name
  end

  def job=(new_job)
    @job = new_job
  end
end

# This is the correct answer
class Person
  attr_reader :name
  attr_writer :job
  def initialize(name, job)
    @name = name
    @job = job
  end
end


# If we want to both read and write a particular variable, there's an even shorter shortcut than using attr_reader and attr_writer.
# We can use attr_accessor to make a variable readable and writeable in one fell swoop.

class Person
  attr_reader :name
  attr_writer :job
  attr_reader :job #change these two lines
  def initialize(name, job)
    @name = name
    @job = job
  end
end


class Person
  attr_reader :name
  attr_accessor :job
  def initialize(name, job)
    @name = name
    @job = job
  end
end


=begin
You can think of a module as a toolbox that contains a set methods and constants. There are lots and lots of Ruby tools you might want to use,
but it would clutter the interpreter to keep them around all the time. For that reason, we keep a bunch of them in modules and only pull in
those module toolboxes when we need the constants and methods inside!

You can think of modules as being very much like classes, only modules can't create instances and can't have subclasses. They're just used to store things!
Instructions
Check out our example module in the editor. See how it has an approximation of pi stored in PI and a series of methods for calculating
the circumference and area of a circle?

Click Next to continue.
=end

module Circle

  PI = 3.141592653589793

  def Circle.area(radius)
    PI * radius**2
  end

  def Circle.circumference(radius)
    2 * PI * radius
  end
end

=begin
You can pull in pre-existing modules (we'll show you how soon!), but you can also make your own. Modules are super easy to make! You just use the module keyword, like so:

module ModuleName
  # Bits 'n pieces
end
Like class names, module names are written in CapitalizedCamelCase, rather than lowercase_with_underscores.

It doesn't make sense to include variables in modules, since variables (by definition) change (or vary). Constants, however,
are supposed to always stay the same, so including helpful constants in modules is a great idea.

Ruby doesn't make you keep the same value for a constant once it's initialized, but it will warn you if you try to change it.
Ruby constants are written in ALL_CAPS and are separated with underscores if there's more than one word.

An example of a Ruby constant is PI, which lives in the Math module and is approximately equal to 3.141592653589793.
We created our own PI in the previous exercise, but don't worry: because they're in separate modules, Ruby knows to keep them separate.
Instructions
1.
Create your own module called MyLibrary in the editor to the right. Include a constant called FAVE_BOOK and set it equal to a string naming your favorite book!
=end

module MyLibrary
  FAVE_BOOK = "2001: A Space Odessy"
end


=begin
One of the main purposes of modules is to separate methods and constants into named spaces.
This is called (conveniently enough) namespacing, and it's how Ruby doesn't confuse Math::PI and Circle::PI.

See that double colon we just used? That's called the scope resolution operator, which is a fancy way of
saying it tells Ruby where you're looking for a specific bit of code. If we say Math::PI, Ruby knows to look inside the Math module to get that PI, not any other PI (such as the one we created in Circle).

Let's get some practice in with an existing Ruby module: Math.
=end

puts Math::PI

=begin
Perfect!

Some modules, like Math, are already present in the interpreter. Others need to be explicitly brought in,
however, and we can do this using require. We can do this simply by typing

require 'module'
We want to use the Ruby Date module to show today's date, but we haven't required it yet!
=end

require 'date'
puts Date.today


=begin
We can do more than just require a module, however. We can also include it!

Any class that includes a certain module can use those module's methods!

A nice effect of this is that you no longer have to prepend your constants and methods with the module name.
Since everything has been pulled in, you can simply write PI instead of Math::PI.
=end

class Angle
  include Math                      # this is where you use include
  attr_accessor :radians

  def initialize(radians)
    @radians = radians
  end

  def cosine
    cos(@radians)
  end
end

acute = Angle.new(1)
acute.cosine


=begin
What we did in the last exercise might not have seemed strange to you, but think about it: we mixed together the behaviors of a class and a module!

When a module is used to mix additional behavior and information into a class, it's called a mixin. Mixins allow us to customize a class without having to rewrite code!
Instructions
Check out the code in the editor. See how we define the jump method in the Action module, then mix it into the Rabbit and Cricket classes? Click Run to see the effect!
=end
module Action
  def jump
    @distance = rand(4) + 2
    puts "I jumped forward #{@distance} feet!"
  end
end

class Rabbit
  include Action
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Cricket
  include Action
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

peter = Rabbit.new("Peter")
jiminy = Cricket.new("Jiminy")

peter.jump
jiminy.jump


=begin
Now you understand why we said mixins could give us the ability to mimic inheriting from more than one class: by mixing in traits from
various modules as needed, we can add any combination of behaviors to our classes we like!
Instructions
1.
Create a module, MartialArts.

Inside, define a method called swordsman that just puts "I'm a swordsman."

On the first line inside Ninja and the first line inside Samurai, include MartialArts to mix this into both the
Ninja and Samurai classes, thereby giving them the swordsman method.
=end

# Create your module here!
module MartialArts
  def swordsman
    puts "I'm a swordsman"
  end
end

class Ninja
  include MartialArts
  def initialize(clan)
    @clan = clan
  end
end

class Samurai
  include MartialArts
  def initialize(shogun)
    @shogun = shogun
  end
end


=begin
Whereas include mixes a module's methods in at the instance level (allowing instances of a particular class to use the methods),
the extend keyword mixes a module's methods at the class level. This means that class itself can use the methods, as opposed to instances of the class.
Instructions
Check out the code in the editor. We've extended TheHereAnd with ThePresent, allowing it to use the now method. Click Run to see the effect!
=end

# ThePresent has a .now method that we'll extend to TheHereAnd

module ThePresent
  def now
    puts "It's #{Time.new.hour > 12 ? Time.new.hour - 12 : Time.new.hour}:#{Time.new.min} #{Time.new.hour > 12 ? 'PM' : 'AM'} (GMT)."
  end
end

class TheHereAnd
  extend ThePresent
end

TheHereAnd.now


=begin
All right! Let's do a little practice with public methods.
Instructions
1.
We've set up an Application class in the editor. Add a public method called print_status to
Application that puts "All systems go!". Don't forget to use the public keyword!
=end

class Application
  attr_accessor :status
  def initialize; end
  # Add your method here!
  public
  def print_status
    puts "All systems go!"
  end
end

#now add a private method that store the secret password of 12345


class Application
  attr_accessor :status
  def initialize; end
  # Add your method here!
  public
  def print_status
    puts "All systems go!"
  end
  private
  def password
    return 12345
  end
end

=begin
Super. Let's move on to modules!
Instructions
1.
Create your own module called Languages in the editor to the right.
Include a constant called FAVE and set it equal to a string naming your favorite programming language!
=end

module languages
  FAVE = "Ruby"
end

=begin
Almost there! Our review wouldn't be complete without a little mixin magic.
Instructions
1.
Finally, let's include our Languages module in the Master class (on line 6) so that our favorite language gets printed to the console.
=end

module Languages
  FAVE = "Ruby"  # This is what you typed before, right? :D
end

class Master

  def initialize; end
  include Languages
  def victory
    puts FAVE
  end
end

total = Master.new
total.victory


=begin
All right! Now that you know how to control the level of privacy in a Ruby class, we can use that to our advantage when creating objects.
In this case, we'll be making an Account object with public methods to display balances and transfer funds, but which rely on private methods to
make sure the user's PIN (personal identification number) is correct before approving transactions.

Note: We're just using banking as an example because it's a nice real-world analogy. This isn't for real banking, so don't use any real banking information!
=end

class Account
  attr_reader :name, :balance
  def initialize(name, balance=100)
    @name = name
    @balance = balance
  end

  def display_balance(pin_number)
    puts pin_number == pin ? "Balance: $#{@balance}." : pin_error
  end

  def withdraw(pin_number, amount)
    if pin_number == pin
      @balance -= amount
      puts "Withdrew #{amount}. New balance: $#{@balance}."
    else
      puts pin_error
    end
  end

  private

  def pin
    @pin = 1234
  end

  def pin_error
    "Access denied: incorrect PIN."
  end
end

my_account = Account.new("Eric", 1_000_000)
my_account.withdraw(11, 500_000)
my_account.display_balance(1234)
my_account.withdraw(1234, 500_000)
my_account.display_balance(1234)
