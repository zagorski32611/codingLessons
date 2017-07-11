isNaN() === true // if the arguement is NOT A NUMBER
isNaN() === false // if the argument is a NUMBER
// This is review from the prior class!

var number = (7, 8, 9, 10, 11, 12, 13, 14);
for (var i = 1; i <= 14; i++) {
    console.log(i);
}

while (i <= 10) {
    console.log("less than 10");
    isNaN === false;
}


/* Introduction: As you might imagine, if you have a
lot of choices you want to cover in a program,
it might be annoying to type else if () ten times.
That's why JavaScript has the switch statement!

switch allows you to preset a number of options (called cases),
then check an expression to see if it matches any of them. If there's
a match, the program will perform the action for the
matching case; if there's no match, it can execute a default option. */

//Sample code:
var lunch = prompt("What do you want for lunch?","Type your lunch choice here");

switch(lunch){
  case 'sandwich':
    console.log("Sure thing! One sandwich, coming up.");
    break;
  case 'soup':
    console.log("Got it! Tomato's my favorite.");
    break;
  case 'salad':
    console.log("Sounds good! How about a caesar salad?");
    break;
  case 'pie':
    console.log("Pie's not a meal!");
    break;
  default:
    console.log("Huh! I'm not sure what " + lunch + " is. How does a sandwich sound?");
}





// This is one I wrote myself!
var car = prompt("What's your favorite car?");

switch(car) {
    case 'Volvo':
    console.log("Safety conscious!");
    break;
    case 'Toyota':
    console.log("Ugh... Really?");
    break;
    case 'Land Rover':
    console.log("a proper vehicle!");
    break;
    default:
    console.log("Not a car person, I guess");
}



// Logical Operators

 // logical operators. JavaScript has three: and (&&), or (||), and not (!).

// the && operatior is TRUE when BOTH variables are true and if one is false, then && is false
var hungry = true;
var foodHere = true;

var eat = function(){
  if (hungry && foodHere) {
    return true;
  } else {
    return false;
  }
};

// the || (or) operator returns TRUE if one or the other OR BOTH are true.
// It only returns FALSE if BOTH are FALSE

var tired = true;
var bored = false;

var nap = function() {
  if (tired || bored) {
    return true;
  } else {
    return false;
  }
};

// the logical operatior ! (false) makes true statements fals and false ones true

var programming = false;

var happy = function() {
  if (!(programming)) {
    return true;
  } else {
    return false;
  }
};

// Note, you can just put (!(programming)) and it will evaluate the oposite of
// its assignment! Above, since it's declared false, the (!(programming)) will make it return true
