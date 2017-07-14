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
