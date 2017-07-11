/*So we know that a class will have certain properties and methods,
but what keeps track of what a given class can or can't do? What a class
 has or doesn't have? That is the job of the prototype.

JavaScript automatically defines the prototype for class with a constructor.
 For example, our Dog constructor ensures that the
 Dog prototype has a breed property. Remember, the Dog prototype keeps
 track of what Dog has, doesn't have, can, or can't do.

We know we can add methods to objects, and in line 27 we add the bark
method to buddy. Hit run and you will see one "Woof" printed when buddy barks.
 Notice what happens when we try to get snoopy to bark in line 36 though.
  Even though snoopy is of the class Dog, he doesn't know how to bark because
  only buddy had bark added as a method.

*/

function Dog (breed) {
  this.breed = breed;
}

// here we make buddy and teach him how to bark
var buddy = new Dog("Golden Retriever");
buddy.bark = function() {
  console.log("Woof");
};
buddy.bark();

// here we make snoopy
var snoopy = new Dog("Beagle");
// we need you to teach snoopy how to bark here
snoopy.bark = function() {
    console.log("Woof");
};
// this causes an error, because snoopy doesn't know how to bark!
snoopy.bark();






/* Classes are very important in object-oriented programming. This is because
a class tells us helpful information about objects, and you can think of an
object as a particular instance of a class.

For example, look at our Person class again in the console. We know that any
Person will have a name and age, because they are in the constructor.
This allows us to create a function like printPersonName, which will take a
Person as an argument and print out their name. We know the function will work
on any Person, because name is a valid property for that class. */


function Person(name,age) {
  this.name = name;
  this.age = age;
}
// a function that prints the name of any given person
var printPersonName = function (p) {
  console.log(p.name);
};

var bob = new Person("Bob Smith", 30);
printPersonName(bob);

// make a person called me with your name and age
// then use printPersonName to print your name
var me = new Person("Joe Zagorski", 31);
printPersonName(me);

/* Here we have very similar code as last time, but there is an
important difference. Instead of using buddy.bark to add the bark
 method to just the buddy object, we use Dog.prototype.bark.

Click run this time, and both buddy and snoopy can bark just fine!
Snoopy can bark too even though we haven't added a bark method to that
 object. How is this so? Because we have now changed the prototype for
 the class Dog. This immediately teaches all Dogs the new method.

In general, if you want to add a method to a class such that all members
of the class can use it, we use the following syntax to extend the prototype: */
/* EXAMPLE CODE */
className.prototype.newMethod =

function() {
statements;
};
/* END */


function Dog (breed) {
  this.breed = breed;
};

// here we make buddy and teach him how to bark
var buddy = new Dog("golden Retriever");
Dog.prototype.bark = function() {
  console.log("Woof");
};
buddy.bark();

// here we make snoopy
var snoopy = new Dog("Beagle");
/// this time it works!
snoopy.bark();


/*Here we have created a new class,
Cat, and its constructor. We also have two cats that would like to meow,
but currently Cats have no meow method. */


function Cat(name, breed) {
    this.name = name;
    this.breed = breed;
}

// let's make some cats!
var cheshire = new Cat("Cheshire Cat", "British Shorthair");
var gary = new Cat("Gary", "Domestic Shorthair");

// add a method "meow" to the Cat class that will allow
// all cats to print "Meow!" to the console
//I wrote this
Cat.prototype.meow = function() {
    console.log("Meow!");
};

// add code here to make the cats meow!
cheshire.meow();
gary.meow();

/*In object-oriented programming,
inheritance allows one class to see and use the methods and properties of
another class. You can think of it as a child being able to use his or her
parent's money because the child inherits the money.

We will learn more about inheritance as we continue this lesson, but for now
let's just refresh our memories about how classes and objects work. */
// create your Animal class here
function Animal (name, numLegs) {
    this.name = name;
    this.numLegs = numLegs;
};


// create the sayName method for Animal
Animal.prototype.sayName = function() {
    console.log("Hi, my name is" + " " + this.name);
};

// now we're gonna create a pendguin class:

function Penguin(name, numLegs) {
    this.name = name;
    this.numLegs = numLegs;
  };
// say name function for the penguins
Penguin.prototype.sayName = function() {
    console.log("Hi my name is " + this.name);
};
// provided code to test above constructor and method
var penguin = new Animal("Wobbles", 2);
penguin.sayName();
// for the penguin class
var theCaptain = new Penguin("Captain Cook", 2);
theCaptain.sayName();



/* Creating a brand new Penguin was nice, but we did end up reusing a
lot of the same code as the Animal class. This goes against the "DRY"
principle of programming: Don't Repeat Yourself.

Inheritance can help us here! A Penguin is an Animal, so they should have
all the same properties and methods as Animal. Whenever this X is-a Y
relationship exists, there's a good chance that we should be using inheritance.

Remember, inheritance lets us see and use properties and methods from another
class. To say that Penguin inherits from Animal, we need to set Penguin's
prototype to be Animal. */

// the original Animal class and sayName method
function Animal(name, numLegs) {
    this.name = name;
    this.numLegs = numLegs;
}
Animal.prototype.sayName = function() {
    console.log("Hi my name is " + this.name);
};

// define a Penguin class
function Penguin(name) {
    this.name = name;
    this.numLegs = 2;
}
// set its prototype to be a new instance of Animal
Penguin.prototype = new Animal();

/*Black (and White) Penguin Magic
Now for some black magic and to see the power of inheritance!

We never defined a sayName method for Penguin,
but what happens when we try to call it?

BE AMAZED! */

var penguin = new Penguin("Captain Cook");
penguin.sayName();

/*
We saw in the last exercise how Penguin inherited the sayName method from Animal.
We now explore how classes can inherit properties as well.
For simplicity, we've defined a new Penguin class that doesn't
inherit anything from Animal.

Create an Emperor class that takes a single name parameter and sets its name
property to be this value. Don't set a numLegs property in the constructor.
Similar to what we did in the previous exercise, make Emperor inherit from
Penguin by setting the prototype of Emperor to be Penguin.
Create a new emperor object that is an instance of the Emperor class with
any name you'd like. Then use console.log to print the number of legs emperor
has—this should have been inherited from Penguin!
*/

function Penguin(name) {
    this.name = name;
    this.numLegs = 2;
}

// create your Emperor class here and make it inherit from Penguin
function Emperor(name) {
    this.name = name;
}


// create an "emperor" object and print the number of legs it has
Emperor.prototype = new Penguin();

var emperor = new Emperor();

console.log(emperor.numLegs);

/*
Up the Food-I-mean-Prototype Chain
A penguin is an animal and an emperor penguin is a penguin. Are emperor penguins animals too? Of course!
The "prototype chain" in JavaScript knows this as well. If JavaScript
encounters something it can't find in the current class's methods or properties,
it looks up the prototype chain to see if it's defined in a class that
it inherits from. This keeps going upwards until it stops all the way at
the top: the mighty Object.prototype (more on this later). By default,
all classes inherit directly from Object, unless we change the class's
prototype, like we've been doing for Penguin and Emperor.

Instructions
Let's see how going up the prototype chain works! We've defined some classes
and inheritance patterns: Emperor inherits from Penguin which inherits from
Animal. We've also created an instance of the Emperor class.
Without modifying anything other than lines 22-24, complete the console.log
statements to print the appropriate responses.
Remember how the prototype chain works: if a property is not defined for a
class, this class's prototype chain will be traversed upwards until one is
found (or not) in a parent (higher) class.
*/
function Animal(name, numLegs) {
    this.name = name;
    this.numLegs = numLegs;
    this.isAlive = true;
};
function Penguin(name) {
    this.name = name;
    this.numLegs = 2;
};
function Emperor(name) {
    this.name = name;
    this.saying = "Waddle waddle";
};

// set up the prototype chain
Penguin.prototype = new Animal();
Emperor.prototype = new Penguin();

var myEmperor = new Emperor("Jules");

console.log(myEmperor.saying); // should print "Waddle waddle"
console.log(myEmperor.numLegs  ); // should print 2
console.log(myEmperor.isAlive  ); // should print true

/*In JavaScript all properties of an object are automatically public.
Public means that they can be accessed outside the class. Think of these
properties as the information a class is willing to share.
Look at the Person class. It has 3 public properties: firstName,
lastName, and age. On lines 8 and 9, we access the firstName and
lastName properties of john and assign them to myFirst and myLast.
Notice that we are free to access the firstName and lastName properties,
which is what we mean when we say they are public. */

function Person(first,last,age) {
   this.firstName = first;
   this.lastName = last;
   this.age = age;
}

var john = new Person('John','Smith',30);
var myFirst = john.firstName;
var myLast = john.lastName;

//declare variable myAge set to the age of the john object.
var myAge = john.age;



/* Good! But what if an object wants to keep some information hidden?

Just as functions can have local variables which can only be accessed from
within that function, objects can have private variables. Private variables
are pieces of information you do not want to publicly share, and they can only
be directly accessed from within the class.

The Person class has been modified to have a private variable called
bankBalance. Notice that it looks just like a normal variable, but it is
defined inside the constructor for Person without using this, but instead
using var. This makes bankBalance a private variable. */

function Person(first,last,age) {
   this.firstname = first;
   this.lastname = last;
   this.age = age;
   var bankBalance = 7500;
}

// create your Person
var john = new Person("John", "Smith", 30);

// try to print his bankBalance
console.log(john.bankBalance);

/*Accessing Private Variables
Although we cannot directly access private variables from outside the class,
there is a way to get around this. We can define a public method that returns
the value of a private variable. */
function Person(first,last,age) {
   this.firstname = first;
   this.lastname = last;
   this.age = age;
   var bankBalance = 7500;

   this.getBalance = function() {
      // your code should return the bankBalance
      return bankBalance;
   };
}

var john = new Person('John','Smith',30);
console.log(john.bankBalance);

// create a new variable myBalance that calls getBalance()
var myBalance = john.getBalance();
console.log(myBalance);


/*Private Methods
Why did that code work? An object's private variables can only be accessed by
other methods that are part of that same object. So, we just used an object's
public method to access a private variable!
Methods can also be private within a class and inaccessible outside of
the class. Changing this.returnBalance from the last exercise to
var returnBalance makes this method private. If you run the program trying to
access the method you get an undefined error this time.
The way to access a private method is similar to accessing a private variable.
You must create a public method for the class that returns the private method.

Instructions
Create a method called askTeller within the Person class that returns
the returnBalance method. This means that it returns the method itself
and NOT the result of calling that method. So you should NOT have parentheses
after returnBalance. Because askTeller returns a method, we need to call it to
make it any use. This is what var myBalance = myBalanceMethod(); does. */
function Person(first,last,age) {
   this.firstname = first;
   this.lastname = last;
   this.age = age;
   var bankBalance = 7500;

   var returnBalance = function() {
      return bankBalance;
   };

   // create the new function here DO NOT FORGET THE this.askTeller!!!
   this.askTeller = function() {
       return returnBalance;
   };
}

var john = new Person('John','Smith',30);
console.log(john.returnBalance);
var myBalanceMethod = john.askTeller();
var myBalance = myBalanceMethod();
console.log(myBalance);


/*Passing Arguments
The askTeller function has been modified within the Person class to directly
give you your balance. However, it now needs the account password in order to
return the bankBalance.
Instructions
Create a new variable called myBalance that calls the askTeller function with
a password argument, 1234. */
function Person(first,last,age) {
   this.firstname = first;
   this.lastname = last;
   this.age = age;
   var bankBalance = 7500;

   this.askTeller = function(pass) {
     if (pass == 1234) return bankBalance;
     else return "Wrong password.";
   };
}

var john = new Person('John','Smith',30);0
/* the variable myBalance should access askTeller()
   with a password as an argument  */
var myBalance = john.askTeller(1234);


/*Looks For-In To Me
Objects aren't so foreign if you really think about it!
Remember you can figure out the type of a variable by using typeof myVariable;.
Types we are concerned with for now are "object", "string", and "number".
Recall the for-in loop:
for(var x in obj) {
executeSomething();
}
This will go through all the properties of obj one by one and assign
the property name to x on each run of the loop. Let's combine our knowledge
of these two concepts.
Instructions
Examine the languages object. Three properties are strings, whereas one is a number.
Use a for-in loop to print out the three ways to say hello. In the loop,
you should check to see if the property value is a string
so you don't accidentally print a number. */

var languages = {
    english: "Hello!",
    french: "Bonjour!",
    notALanguage: 4,
    spanish: "Hola!"
};

// print hello in the 3 different languages
for (var x in languages) {
    if (typeof(languages[x]) === "string") {
        console.log(languages[x]);
    }
}


/* Hello? Yes, This is Dog
We should all know by now what's so cool about using prototype: we can define a
method for a class, and any instance of the class (i.e., object created using
that class's constructor) can use that method.
Remember that classes and the prototype are important to OOP!
Add the sayHello method to the Dog class by extending its prototype.

sayHello should print to the console: "Hello this is a [breed] dog",
where [breed] is the dog's breed. */

function Dog (breed) {
    this.breed = breed;
};

// add the sayHello method to the Dog class
// so all dogs now can say hello
Dog.prototype.sayHello = function() {
    console.log("Hello this is a " + this.breed + " dog");
};

var yourDog = new Dog("golden retriever");
yourDog.sayHello();

var myDog = new Dog("dachshund");
myDog.sayHello();

// this looks like the review


function StudentReport() {
    grade1 = 4;
    grade2 = 2;
    grade3 = 1;
    prototype.getGPA = function() {
        return (this.grade1 + this.grade2 + this.grade3) / 3;
    };
}

var myStudentReport = new StudentReport();

for(var x in myStudentReport) {
    if(typeof myStudentReport[x] !== "function") {
        console.log("Muahaha! " + myStudentReport[x]);
    }
}

console.log("Your overall GPA is " + myStudentReport.getGPA());
