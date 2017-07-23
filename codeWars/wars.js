//validatePIN should return true it's exactly 4 or 6 numbers AND numeric

function validatePIN (pin) {
if (isNaN(pin) === true) {
  return ("Letters");
} else return("Numbers");
};



validatePIN("123454");
validatePIN("abdfe");


var pinLetter = [];
var pinNum = [] ;

function validatePIN(pin) {
  if (isNaN(pin) === true);
 pinLetter.push(pin);
} else {
  pinNum.push();
}
};
validatePIN("abcde");
validatePIN("12345");

console.log(pinLetter);
console.log(pinNum);
_______________________________________________________________

// this one is almost working except for decimals and negative Numbers
var pinLetter = [];
var pinNum = [] ;
function validatePIN(pin) {
  for (var i = 0; i <= pin.length; i ++) {
  if (isNaN(pin[i]) === true) {
    pinLetter.push(pin[i]);
  } else pinNum.push(pin[i]);
} if (pinLetter.length > 0) {
  console.log();(false);
} else {
  console.log(true)
}if (pinNum.length === 4 || pinNum.length === 6){
  console.log(true);
} else { console.log (false);
}
}
validatePIN("1234A");

console.log(pinLetter);
console.log(pinNum);



/* this is the answer. It's called a Regex.test.

^       a string that starts with...
(       either
  \d    a digit (0-9)...
  {4}   that repeats four times...
|       or
  \d    a digit (0-9)...
  {6}   that repeats six times...
)
$       and then ends

*/

function validatePIN(pin) {
  return /^(\d{4}|\d{6})$/.test(pin)
}
validatePIN("1234")

//_______________________________________________________________
// this is the same problem I've been fighting with all year lol

var binary = [];
var numZero = [];
var count = [];

function zero(x, y) {
  for (i = 1; i <= y; i++) {
  binary.push(i.toString(2));
}
}


function countZero(binary) {
  return (/?<=^|\s)[0.]+(?=\s|$)/);
}


zero(1, 10);
countZero(binary);
console.log(binary);
console.log(count);

//_______________________________________________________________
// we have to find out if a number is a square (HAS A SQUARE ROOT THAT'S AN INTEGER):

var isSquare = function(n){
  return false; // fix me
}


var isSquare = function(n) {
  if (Math.sqrt(n) % 1 != 0) {
    return false;
  } else {
    return true;
  }
}
isSquare("rice");
isSquare(5);
isSquare(2);
isSquare(100);



// MY FIRST CORRECT ANSWER!

//THis was on codewars as the "best practice"

function isSquare(n) {
  return Math.sqrt(n) % 1 === 0;
}
// it already returns true or false for me

//_______________________________________________________________
// add the sum of the two smallest positive integers in an array

function sumTwoSmallestNumbers(numbers) {
  //Code here
};



var array = [19,5,42,2,77];

function sum(z) {
  array.order()
}




var array = [19,5,42,2,77];
console.log(array[0]);
console.log(array[0]+array[1]);


function twoSmallestNumber(number) {
  var array = [19,5,42,2,77];
  var array2 = array.sort(function(a, b){return a-b});
  return( array2[0] + array2[1]);
}

sum(array);


// AND I GOT ANOTHER RIGHT!!!!!!
// Here's the recommended answer:
