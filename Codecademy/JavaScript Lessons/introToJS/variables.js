// Basic JavaScript Stuff:

var number = "2163759300";
var area = number.substring(0,3);
var middle = number.substring(3, 6);
var last = number.substring(6, 10);

// this breaks my phone number down to the three parts defined in the sbstring:
// i.e area = 216, middle = 375 and last = 9300.

document.write(area); // prints the area code;
document.write(middle); // prints the middle (375);
document.write(last); // prints the last 4 of my number: 9300

// you can also add strings together just like numbers:

var words = "this is";
var words2 = " a sentence";
var sentence = words + words2;
document.write(sentence);

// this can be used with strings OR numbers! with number, basic operators apply:
// +, -, *, /. AND % will return the remiander i.e 12 % 7 = 5.

// the sole operators: ++ or --:

var num1 = 5;
var total = 5++;

// writing total will still print 5, but num1 will now be 6!
document.write(total); // == 5
document.write(num1); // == 6

// IF you put the ++ BEFORE the number, (total = ++5), total will == 6!

// Arrays!
var a = ["dog", "cat", "mouse", 5];
// now you can write all or part of the array:
document.write (a[0]); //dog
// Very simple!

//Functions, code that you use multiple times!

function butt() {
  document.write("ur a butt hole ");
}

butt();
// you can also use a variable in the function:

function name(who) {
 document.write("I love you " + who);
}

name(); // this will return "I love you undefined"
document.write("<br>"); // this will write output on a new line
name(""); // this will return "I love you"
document.write("<br>");
name("Taylor"); // this will return I love you Taylor

/* Escape Sequences: Code	Output
\'	single quote
\"	double quote
\\	backslash
\n	newline
\r	carriage return
\t	tab
\b	backspace
\f	form feed
Note that the backslash itself must be escaped in order to display as a backslash.
*/
