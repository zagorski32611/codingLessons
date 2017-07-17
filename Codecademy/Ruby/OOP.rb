=begin
A basic class consists only of the class keyword and the name of the class. Check it out:

    class NewClass
      # Class magic here
    end
Our NewClass has the ability to create new Ruby objects of class NewClass (just like "Hello!"
is a String and 4 is a Fixnum). By convention, class names start with a capital letter and use
CamelCase instead of relying_on_underscores.
=end

# my first class

class  Person

end

=begin
We'd like our classes to do more than... well, nothing, so we'll have to add some code between our class Person and end.

You may have noticed in our example back in the first exercise that we started our class definition off with a method
called initialize. You can think of initialize as the function that "boots up" each object the class creates.
=end

class  Person
  def initialize
  end
end


=begin
All right! Just one more step before we can create a person from our Person class: we have to make sure each person has a @name.

In Ruby, we use @ before a variable to signify that it's an instance variable. This means that the variable is attached to the instance of the class.

class Car
  def initialize(make, model)
    @make = make
    @model = model
  end
end

kitt = Car.new("Pontiac", "Trans Am")
The code in the example above creates an instance, kitt, of the class Car. kitt has his own @make ("Pontiac") and @model ("Trans Am").
Those variables belong to the kitt instance, which is why they're called instance variables.

We'll cover other kinds of variables (like those attached to entire classes!) in the next few exercises.
Instructions
1.
Give your initialize method a single parameter, name. In the body of your method, set @name = name.

This tells Ruby that whenever it creates a Person, it has to have a name, and each instance of Person will have its own @name.
=end

class  Person
  def initialize(name)
    @name = name
  end
end


=begin
Perfect! Now we're ready to start creating objects.

We can create an instance of a class just by calling .new on the class name, like so:

me = Person.new("Eric")
Instructions
1.
Create a variable, matz, and set it equal to calling .new on your Person class. Pass .new the name "Yukihiro" as its only argument.
=end

class Person
  def initialize(name)
    @name = name
  end
end

matz = new.Person("Yukihero")

=begin
Another important aspect of Ruby classes is scope. The scope of a variable is the context in which it's visible to the program.

It may surprise you to learn that not all variables are accessible to all parts of a Ruby program at all times. When dealing with classes,
you can have variables that are available everywhere (global variables), ones that are only available inside certain methods (local variables),
others that are members of a certain class (class variables), and variables that are only available to particular instances of a class (instance variables).

The same goes for methods: some are available everywhere, some are only available to members of a certain class, and some are only available to particular instance objects.
Instructions
Check out the code in the editor. See how some variables start with $, @, or @@? This helps mark them as global, instance,
and class variables (respectively). We'll explain these in the next section. Run the code to see how these different variables work!
=end

class Computer
  $manufacturer = "Mango Computer, Inc."
  @@files = {hello: "Hello, world!"}

  def initialize(username, password)
    @username = username
    @password = password
  end

  def current_user
    @username
  end

  def self.display_files
    @@files
  end
end

# Make a new Computer instance:
hal = Computer.new("Dave", 12345)

puts "Current user: #{hal.current_user}"
# @username belongs to the hal instance.

puts "Manufacturer: #{$manufacturer}"
# $manufacturer is global! We can get it directly.

puts "Files: #{Computer.display_files}"
# @@files belongs to the Computer class.



=begin
Recall that instance variables begin with an @. This isn't just a Ruby convention—it's part of the syntax! Always start your instance variables with @.

Class variables are like instance variables, but instead of belonging to an instance of a class, they belong to the class itself.
Class variables always start with two @s, like so: @@files.

Global variables can be declared in two ways. The first is one that's already familiar to you: you just define the variable outside
of any method or class, and voilà! It's global. If you want to make a variable global from inside a method or class, just start it with a $, like so: $matz.

We'll go through instance and class variables in more detail in a moment. First, let's do a quick review of local and global scope.
Instructions
1.
Take a look at the code to the right. The variable my_variable is inside a class, so it's not reachable by the puts method outside it.
But you can fix this! Use either of the two global variable tricks mentioned above.

Check the hint if you need more help.
=end

class MyClass
  $my_variable = "Hello!" #put the $ in front of the varable!
end

puts $my_variable


=begin
We can create class variables by starting a variable name with two @ symbols. Class variables are attached to entire classes, not just instances of classes, like so:

class MyClass
  @@class_variable
end
Because there's only one copy of a class variable shared by all instances of a class, we can use them to pull off some cool Ruby tricks.
For example, we can use a class variable to keep track of the number of instances of that class we've created. Let's do that now!
Instructions
1.
Let's do three things:

Create a class variable, @@people_count, on line 3, and set it equal to 0.
Increment @@people_count on line 8.
Return @@people_count on line 13 so that our puts on line 20 will print out the number of people created so far.

=end

class Person
  # Set your class variable to 0 on line 3
  @@people_count = 0

  def initialize(name)
    @name = name
    # Increment your class variable on line 8 All that means is += 1
    @@people_count += 1
  end

  def self.number_of_instances
    # Return your class variable on line 13
    return  @@people_count
  end
end

matz = Person.new("Yukihiro")
dhh = Person.new("David")

puts "Number of Person instances: #{Person.number_of_instances}"



=begin
Classes like Language and Person are great when you are starting to learn the concepts of classes and instances.

However, classes and objects are often used to model real-world objects. The code in the editor is a more realistic
demonstration of the kind of classes and objects you might find in commercial software. Here we have a snippet of the
Rails source code. See how they've created an instance of the RecordInvalid class?
Instructions
Most of the syntax should look familiar to you; the raise bit (which we'll cover in future lessons) generates a new
RecordInvalid error if the user tries to create or save an invalid record.

=end
def create_record(attributes, raise_error = false)
  record = build_record(attributes)
  yield(record) if block_given?
  saved = record.save
  set_new_record(record)
  raise RecordInvalid.new(record) if !saved && raise_error
  record
end


=begin
Inheritance is a tricky concept, so let's go through it step by step.

Inheritance is the process by which one class takes on the attributes and methods of another, and it's used to express an is-a relationship.
For example, a cartoon fox is a cartoon mammal, so a CartoonFox class could inherit from a CartoonMammal class.

However, a Wizard is not an Elf, so it shouldn't inherit from the Elf class (even if they have a lot of magical attributes and methods in common).
Instead, both Wizard and Elf could ultimately inherit from the same MagicalBeing class.
Instructions
Check out the code in the editor. We've defined a class, ApplicationError, as well as a SuperBadError class that inherits from ApplicationError.
Note that we don't define the display_error method in the body of SuperBadError, but it will still have access to that method via inheritance.
=end

class ApplicationError
  def display_error
    puts "Error! Error!"
  end
end

class SuperBadError < ApplicationError
end

err = SuperBadError.new
err.display_error

=begin
In Ruby, inheritance works like this:

class DerivedClass < BaseClass
  # Some stuff!
end
The derived class is the new class you're making and the base class is the class from which that new class inherits. You can read "<" as "inherits from."
Instructions
1.
We've created an Application class in the editor to the right. Create your own class, MyApp, that inherits from Application.
No need to put anything inside your class definition just yet!
=end

class Application
  def initialize(name)
    @name = name
  end
end

# Add your code below!
class MyApp < Application
end

=begin
Sometimes you'll want one class that inherits from another to not only take on the methods and attributes of its parent, but to override one or more of them.

For instance, you might have an Email class that inherits from Message. Both classes might have a send method that sends them, but the e-mail version may have to
 identify valid e-mail addresses and use a bunch of e-mail protocols that Message knows nothing about. Rather than add a send_email method to your derived class and
 inherit a send method you'll never use, you can instead just explicitly create a send method in the Email class and have it do all the email-sending work.

This new version of send will override (that is, replace) the inherited version for any object that is an instance of Email.
Instructions
1.
Let's try a more entertaining (if less realistic) example. Create a new class, Dragon, that inherits from Creature. Give your derived class a fight method that
overrides Creature's; instead of returning "Punch to the chops!", it should return "Breathes fire!".

=end
class Creature
  def initialize(name)
    @name = name
  end

  def fight
    return "Punch to the chops!"
  end
end

# Add your code below!
class Dragon < Creature
  def initialize(name)
    @name = name
  end

  def fight
    return "Breathes fire!"
  end
end


=begin
On the flip side, sometimes you'll be working with a derived class (or subclass) and realize that you've overwritten a method or
attribute defined in that class' base class (also called a parent or superclass) that you actually need. Have no fear!
You can directly access the attributes or methods of a superclass with Ruby's built-in super keyword.

The syntax looks like this:

class DerivedClass < Base
  def some_method
    super(optional args)
      # Some stuff
    end
  end
end
When you call super from inside a method, that tells Ruby to look in the superclass of the current class and find a method with
the same name as the one from which super is called. If it finds it, Ruby will use the superclass' version of the method.
Instructions
1.
We decided we want to do some chops-punching after all! Let's do two things:

Add puts "Instead of breathing fire..." as the first line in our Dragon's fight method.
Replace the return statement inside Dragon's definition of fight with the keyword super. (No need to pass any arguments to super,
since Creature's fight method doesn't take any.)
=end
class Creature
  def initialize(name)
    @name = name
  end

  def fight
    return "Punch to the chops!"
  end
end

# Add your code below!

class Dragon < Creature
  def initialize(name)
    @name = name
  end

  def fight
    return "Breathes fire!"
  end
end


=begin
On the flip side, sometimes you'll be working with a derived class (or subclass) and realize that you've overwritten a method or attribute
defined in that class' base class (also called a parent or superclass) that you actually need. Have no fear! You can directly access the
attributes or methods of a superclass with Ruby's built-in super keyword.

The syntax looks like this:

class DerivedClass < Base
  def some_method
    super(optional args)
      # Some stuff
    end
  end
end
When you call super from inside a method, that tells Ruby to look in the superclass of the current class and find a method with the same
name as the one from which super is called. If it finds it, Ruby will use the superclass' version of the method.
Instructions
1.
We decided we want to do some chops-punching after all! Let's do two things:

Add puts "Instead of breathing fire..." as the first line in our Dragon's fight method.
Replace the return statement inside Dragon's definition of fight with the keyword super. (No need to pass any arguments to super,
since Creature's fight method doesn't take any.)

=end
class Creature
  def initialize(name)
    @name = name
  end

  def fight
    return "Punch to the chops!"
  end
end

# Add your code below!


class Dragon < Creature
  def initialize(name)
    @name = name
  end

  def fight
    puts "Instead of breathing fire..."
    super()
  end
end

=begin
Any given Ruby class can have only one superclass. Some languages allow a class to have more than one parent, which is a model called multiple inheritance.
This can get really ugly really fast, which is why Ruby disallows it.

However, there are instances where you want to incorporate data or behavior from several classes into a single class, and Ruby allows this through the use of mixins.
We'll learn about mixins in a later lesson! For now, we'll demonstrate what happens if you try to do multiple inheritance in Ruby.

The demo code we're about to show you includes a fancy trick: if you want to end a Ruby statement without going to a new line, you can just type a semicolon.
This means you can write something like

class Monkey
end
on just one line: class Monkey; end. This is a time saver when you're writing something very short, like an empty class or method definition.
Instructions
Check out the code in the editor. See how we're trying to get Dragon to inherit from Creature and Person? We'll get a superclass mismatch
for class Dragon error if we try this. Run the code to see for yourself!
=end
class Creature
  def initialize(name)
    @name = name
  end
end

class Person
  def initialize(name)
    @name = name
  end
end

class Dragon < Creature; end
class Dragon < Person; end

=beginning

Create a class called Message and give it an initialize method. The initialize method should take two parameters,
from and to, and set them to the instance variables @from and @to (respectively). Don't worry about creating an instance of your class just yet.
Stuck? Get a hint
=end

class Message
  def initialize(from, to)
  @from = from
  @to = to
 end
end

=begin
Perfect! Now let's class things up a bit with a class variable.
Instructions
1.
Give your Message class a @@messages_sent class variable and set it equal to 0. In the body of your initialize method,
increment this value by 1 so that each time a new Message object is created, @@messages_sent will increase by
1. Don't create any instances of your class just yet!
=end

class Message
  @@messages_sent = 0
  def initialize(from, to)
  @from = from
  @to = to
  @@messages_sent += 1
 end
end

=begin
Perfect! Let's go ahead and create an instance of our Message class.
Instructions
1.
After your class, create a variable called my_message.

Create an instance of your Message class using Message.new with whatever from and to arguments you want! Store the result in my_message.
=end

class Message
  @@messages_sent = 0
  def initialize(from, to)
  @from = from
  @to = to
  @@messages_sent += 1
 end
end

my_message = Message.new("Joe", "Tay")

=begin
Perfect! Now let's get in a little practice with inheritance.
Instructions
1.
Create a second class, Email, that inherits from Message. Give it its own initialize method that takes just one
parameter, subject, and has one instance variable, @subject, set equal to subject.
=end

class Email < Message
  def initialize(subject)
    @subject = subject
  end
end

=begin
You're a champion! Our last topic: Ruby's super keyword. (We've decided we liked Message's initialize method after all.)
Instructions
1.
To finish this lesson, go ahead and remove the subject parameter and @subject instance variable from Email.

Pass Email's initialize method the same two parameters passed to Message's—from and to—and add the super
keyword as the only line of code in the body of Email's initialize method.
=end
class Message
  @@messages_sent = 0
  def initialize(from, to)
  @from = from
  @to = to
  @@messages_sent += 1
 end
end

my_message = Message.new("Joe", "Tay")

class Email < Message
  def initialize(from, to)
   super
  end
end

my_email = Email.new("Michael", "Jacky")


# Objeects project!!

class Computer
  @@users = {}
  def initialize(username, password)
    @username = username
    @password = password
    @files = {}
    @@users[username] = password #this makes it so the @@users hash keeps usernames as keys with passwords as the value
  end

  time = Time.now
  def create(filename)
    @files[filename] = time
    puts "#{filename}, #{@username}"
  end

  def Computer.get_users
     @@users
  end
end

my_computer = Computer.new("Hal", "123") #this is a username and password!

pnc = Computer.new("zagorski32611", "mk6Jetta")
fdkgdsjflkgjds;lfkgj sldf;fkjgl;sdkjg klfgj s
puts users
