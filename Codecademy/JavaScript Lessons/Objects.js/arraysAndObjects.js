//this is a sample of an object. It's like a function and an array together.

var phonebookEntry = {};

phonebookEntry.name = 'Oxnard Montalvo';
phonebookEntry.number = '(555) 555-5555';
phonebookEntry.phone = function() {
  console.log('Calling ' + this.name + ' at ' + this.number + '...');
};

phonebookEntry.phone();

var me = {
    name: "Joe",
    age: 31,
};


/*There are two ways to create an object: using object literal notation
(which is what you just did) and using the object constructor.

Literal notation is just creating an object with curly braces,
like the object above. */

var me = new Object();
me.name = "Joe";
me.age = 31;

/* Note that you will see a little yellow triangle warning that tells you to use
"object literal notation". Generally, object literal notation is considered
preferable,
but it is important that you learn both ways so that you recognize them
in other people's code. */


/* this is the review: */
var object1 = {
    car: "Disco",
    status: "Broken",
    mileage: 180000,
};

var object2 = {
    car: "Jetta",
    status: "working",
    milage: 80000,

};

var object3 = new Object();
object3.car = "BMW";
object3.status = "non-existant";
object3.mileage = "undefined";
// ^^ This is called constructor notation

/*_______________________________________________________________
These are review questions:
We're going to play a game of FizzBuzz.
The rules are simple. We want to count from 1 to 20.
But if the number is divisible by 3, we're going to print "Fizz".
And if the number is divisible by 5 we're going to print "Buzz".

What will we print if the number is divisible by 3 AND 5? That's right!
"FizzBuzz"!

There are many ways to do this, but we'd like you to use a nested conditional
in this exercise. */


for (i = 1; i <=20; i++) {
  if (i % 3 === 0 && i % 5 !== 0) {
  console.log("fizz")
} else if (i % 3 !== 0 && i % 5 === 0) {
  console.log("buzz")
} else if (i % 3 === 0 && i % 5 === 0) {
  console.log("fizzBuzz")
} else {
  console.log(i)
}};

// question 2








// objects and arrays: We created an object called friends and inside we put
// friends with names, addresses and phone numbers. We nested objects within
// the friends object.

var friends = {
bill: {  firstName: "Bill",
  lastName: "Smith",
  number: 222-222-2222,
  address: ['1228 Edwards', 'Lakewood', 'OH', '44107'],
  },
steve: {
  firstName: "Steve",
  lastName: "Johnson",
  number: 111-111-1111,
  address: ['16209 Madison Ave', 'Lakewood', 'OH', '44107'],
  },
};

function list(one) {
    for (var name in friends) {
    console.log(name);
    }
}

/* the function list will print out the first names of each object
with something called a for/in loop. real simple: for (var key in object) */

var search = function(name) {
    for (var key in friends) {
    if (friends[key].firstName === name) {
        console.log(friends[key]);
        return(friends[key]);
    }
    }
};
/* this is a function that will search out contact list and print out and
return the friends contact information IF the first name is present.
Important: Notice it calls friends[key] NOT firstName. */


var bob = new Object();
bob.age = 17;
// this time we have added a method, setAge
bob.setAge = function (newAge){
  bob.age = newAge;
};

bob.getYearOfBirth = function () {
  return 2014 - bob.age;
};
console.log(bob.getYearOfBirth());

// this is how you set methods in JS

var rectangle = new Object();
rectangle.height = 3;
rectangle.width = 4;
// here is our method to set the height
rectangle.setHeight = function (newHeight) {
  this.height = newHeight;
};
// help by finishing this method
rectangle.setWidth = function (newWidth) {
    this.width = newWidth;
};


// here change the width to 8 and height to 6 using our new methods
rectangle.setWidth(8);
rectangle.setHeight(6);



var square = new Object();
square.sideLength = 6;

square.calcPerimeter = function() {
  return this.sideLength * 4;
};
// help us define an area method here
square.calcArea = function() {
    return this.sideLength * this.sideLength;
};

var p = square.calcPerimeter();
var a = square.calcArea();



/*But this approach of adding in
properties one at a time for every object is tedious! Instead of always using
the boring Object constructor, we can make our own constructors.

This way we can set the properties for an object right when it is created. So
instead of using the Object constructor which is empty and has no properties,
we can make our own constructors which have properties.

To see how this works, look at our Person constructor in lines 1–4. This
constructor is used to make Person objects. Notice it uses the keyword this to
define the name and age properties and set them equal to the parameters given.

Now we can use this constructor to make our good friends bob and susan in only
one line each! Look at lines 7–8: once we have the constructor, it's way easier
to make people because we can include their name and age as arguments to their
respective constructors. */

function Person(name,age) {
  this.name = name;
  this.age = age;
}

// Let's make bob and susan again, using our constructor
var bob = new Person("Bob Smith", 30);
var susan = new Person("Susan Jordan", 25);
// help us make george, whose name is "George Washington" and age is 275


/* This is a custom constructor! */

function Rectangle(height, width) {
  this.height = height;
  this.width = width;
  this.calcArea = function() {
      return this.height * this.width;
  };
  this.height = height;
  this.width = width;
  this.calcPerimeter = function() {
      return 2 * (this.height +this.width);
  };

}

var rex = new Rectangle(7,3);
var area = rex.calcArea();
var perimeter = rex.calcPerimeter();


// This will make an array with the objects
// Our person constructor
function Person (name, age) {
    this.name = name;
    this.age = age;
}

// Now we can make an array of people
var family = new Array();
family[0] = new Person("alice", 40);
family[1] = new Person("bob", 42);
family[2] = new Person("michelle", 8);
// add the last family member, "timmy", who is 6 years old
family[3] = new Person("timmy", 6);

// Our Person constructor
function Person(name, age) {
    this.name = name;
    this.age = age;
}

// Now we can make an array of people
var family = new Array();
family[0] = new Person("alice", 40);
family[1] = new Person("bob", 42);
family[2] = new Person("michelle", 8);
family[3] = new Person("timmy", 6);

// loop through our new array
var search = function(name) {
    for (var name in family) {
        if (family[name] === name) {
            console.log(family[name]);
        }
    }
};

// Our Person constructor
function Person(name, age) {
    this.name = name;
    this.age = age;
}

// Now we can make an array of people
var family = new Array();
family[0] = new Person("alice", 40);
family[1] = new Person("bob", 42);
family[2] = new Person("michelle", 8);
family[3] = new Person("timmy", 6);

// loop through our new array
var search = function(name) {
    for (var name in family) {
        if (family[name] === name) {
            console.log(family[name]);
        }
    }
};

// this is the for loop that works!

for (var i = 0; i < family.length; i ++) {
    console.log(family[i].name);
}


/*In addition to making arrays of Objects, we can use objects as parameters
for functions as well. That way, these functions can take advantag
of the methods and properties that a certain object type provides.

To see an example, take a look at the console. In addition to our Person
constructor we have introduced a new function, ageDifference (line 9).
This function takes two Person objects as parameters, and returns the difference
 in age between the two people. */



// Our person constructor
function Person (name, age) {
    this.name = name;
    this.age = age;
}

// We can make a function which takes persons as arguments
// This one computes the difference in ages between two people
var ageDifference = function(person1, person2) {
    return person1.age - person2.age;
}
var alice = new Person("Alice", 30);
var billy = new Person("Billy", 25);

// get the difference in age between alice and billy using our function
 var diff = (ageDifference(alice,billy));

 // ^^^^ This is the code that works!

 // just like before, this will return the person with the older age// Our person constructor

 //_______________________________________________________________
function Person (name, age) {
    this.name = name;
    this.age = age;
}

// We can make a function which takes persons as arguments
// This one computes the difference in ages between two people
var ageDifference = function(person1, person2) {
    return person1.age - person2.age;
};

// Make a new function, olderAge, to return the age of
// the older of two people
var olderAge = function(person1, person2) {
    if (person1.age > person2.age) {
        return person1.age;
    } else {
        return person2.age;
    }
};


var bob = {
    firstName: "Bob",
    lastName: "Jones",
    phoneNumber: "(650) 777-7777",
    email: "bob.jones@example.com"
};

var mary = {
    firstName: "Mary",
    lastName: "Johnson",
    phoneNumber: "(650) 888-8888",
    email: "mary.johnson@example.com"
};

var contacts = [bob, mary];

function printPerson(person) {
    console.log(person.firstName + " " + person.lastName);
}
var contactsLength = contacts.length;

function list() {
    for (i = 0; i <= contacts.length; i ++) {
        printPerson(i);
    }
}
list();







var bob = {
    firstName: "Bob",
    lastName: "Jones",
    phoneNumber: "(650) 777-7777",
    email: "bob.jones@example.com"
};

var mary = {
    firstName: "Mary",
    lastName: "Johnson",
0    phoneNumber: "(650) 888-8888",
    email: "mary.johnson@example.com"
};

var contacts = [bob, mary];

function printPerson(person) {
    console.log(person.firstName + " " + person.lastName);
}

function list() {
	var contactsLength = contacts.length;
	for (var i = 0; i < contactsLength; i++) {
		printPerson(contacts[i]);
	}
}

/*Create a search function
then call it passing "Jones"*/

function search(lastName) {
    contactsLength = contacts.length;
    for (var i = 0; i < contactsLength; i++) {
        if (lastName === lastName) {
            printPerson(contacts[i]);
        }
    }
}
search("Jones");

function add(firstName, lastName, email, phoneNumber) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.email = email;
    this.phoneNumber = phoneNumber;
}


var joe = new add("Joe", "Zagorski", "joe@joe.com", "(123) 456 - 7891");





function Person(job, married, speak) {
    this.job = job;
    this.married = married;
    this.speak = function() {
        console.log("Hello!");
    };
}

var user = new Person("Codecademy Student",false, "Hello!");
user.speak();




var james = {
    job: "programmer",
    married: false,
    sayJob: function() {
    console.log("Hi, I work as a [job]");
    }
};

// james' first job
james.sayJob();

// change james' job to "super programmer" here

var james = {
    job: "super programmer",
    married: false,
    sayJob: function() {
    console.log("Hi, I work as a [job]");
    }
};

// james' second job
james.sayJob();



var james = {
    job: "programmer",
    married: false,
    speak: function(great, just) {
    if (function(great) {
        console.log("Hello, I am feeling great");
    } else {
        console.log("Hello, I am feeling just okay");
    }
  }
};



var james = {
    job: "programmer",
    married: false,
    sayJob: function() {
    console.log("Hi, I work as a [job]");
    }
};

// james' first job
james.sayJob();

// change james' job to "super programmer" here

var james = {
    job: "super programmer",
    married: false,
    sayJob: function() {
    console.log("Hi, I work as a" + ' ' + [job]);
    }
};

// james' second job
james.sayJob();


var suitcase = {
    shirt: "Hawaiian"
};

console.log(suitcase.shorts);

if (this.suitcase === 'shorts'); {
    console.log(suitcase[shorts])
} else (this.suitcase === 'shorts') {
    console.log(suitcase);
  }
};

//_______________________________________________________________

var nyc = {
    fullName: "New York City",
    mayor: "Bill de Blasio",
    population: 8000000,
    boroughs: 5
};


for(var property in nyc)  {
    console.log(property);
}
// write a for-in loop to print the value of nyc's properties
for (var x in nyc) {
    console.log(nyc[x]);
}
