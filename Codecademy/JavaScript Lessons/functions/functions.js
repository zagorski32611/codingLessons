// So we went over the basic stuff from the intro class.
// now we're doing this:

/* The return keyword simply gives the programmer back the value that comes out of the function.
So the function runs, and when the return keyword is used,
the function will immediately stop running and return the value. */

// Parameter is a number, and we do math with that parameter
var timesTwo = function(number) {
    return number * 2;
};

// Call timesTwo here!
var newNumber = timesTwo(3);
console.log(newNumber);

/*Look at the if statement. ^^^^
The if statement is checking whether the result of
calling the function named quarter is divisible by 3.*/

function quarter(number) {
    return (number / 4);
}

if (quarter(24) % 3 === 0 ) {
  console.log("The statement is true");
} else {
  console.log("The statement is false");
}
// ^^ here we use a function to return x / 4. the IF statement takes the
// output from the function, and performs the operation. The output can be treated like
// a variable


function perimeterBox(length, width) {
    return (length + length + width + width);
}

perimeterBox(1, 1);

// this is a function with multiple arguements

//Exercise 10:

var my_number = 7; //this has global scope

var timesTwo = function(number) {
    /*var*/ my_number = number * 2; //this has local scope
    console.log("Inside the function my_number is: ");
    console.log(my_number);
};

timesTwo(7);

console.log("Outside the function my_number is: ")
console.log(my_number);
/* variables with global scope are defined outside a function and can be called
anywhere (inside or outside a function). a var defined inside a function
 can only be called INSIDE that function and if you call it outside of one
 you'll get an error.
The var keyword creates a new variable in the current scope.
That means if var is used outside a function,
that variable has a global scope. If var is used inside a function,
that variable has a local scope.
on line 48, if the var key word is commented out, when i call it on line 56,
I'll get an error. If we use var my_number = it will work on line 56. */



/* here's a fun quiz:
1) Write a function named sleepCheck that takes the parameter numHours

2) Inside the function, write an if statement where if the number of hours of
sleep is greater than or equal to 8, the computer will return
"You're getting plenty of sleep! Maybe even too much!";.

3) Otherwise (else) if the number of hours of sleep is less than 8,
have the computer return "Get some more shut eye!";
Then call the function with different hours of sleep

4) Call the function with 10 hours of sleep, like this: sleepCheck(10);
5) Call the function with 5 hours of sleep.
6) Call the function with 8 hours of sleep.
*/

function sleepCheck(numHours) {
    if (numHours >= 8) {
    return ("You're getting plenty of sleep! Maybe even too much!")
} else {
    return ("Get some more shut eye!");
}}

sleepCheck(10);
sleepCheck(5);
sleepCheck(8);
