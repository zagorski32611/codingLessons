var harryPotterFan = false;
if (harryPotterFan) {
  console.log('Mischief managed')
} else {
  console.log("I lead a muggle\'s life")
}

// name a variable, in this case harryPotterFan,
// then assign it a boolean (true/false).
// the IF statement will print code if the variable equals
// one boolean or another.

var hungerLevel = 10;
if (hungerLevel > 7) {
  console.log("Time to eat!");
}  else {
  console.log("Let's eat later");
}

// it can also compare numbers and

// you can also use equals: ===
// or not equal to: !==

if (moonPhase === 'full') {
  console.log("Howwwwlll!!");
} else if (moonPhase === "mostly full") {
  console.log ("Arms and legs getting harier");
} else if (moonPhase == 'mostly new') {
  console.log ("Back on two feet");
} else {
  console.log("Invalid moon phase");
}

// The lesson above is that you can have an else if for several conditions
// and the final else is to catch any condition not specified

var moonPhase = 'full';
var foggyNight = false;


if (moonPhase === 'full' || foggyNight ===true) {
  console.log('Howwwlll!!');
} else if (moonPhase === 'mostly full') {
  console.log('Arms and legs are getting hairier.');
} else if (moonPhase === 'mostly new') {
  console.log('Back on two feet');
} else {
  console.log('Invalid moon phase');
}

// here were use && to say that BOTH conditions must be true to execute that
// code. also || says that either could be true., ! the opposite of each other.
// !== niether should be equal to each other.


// the last conidtional statement is the case:
var moonPhase = 'mostly new';

switch (moonPhase) {
 case 'full':
   console.log('Howwwlll!!');
  	break;
  case 'mostly full':
   console.log('Arms and legs are getting harier.');
    break;
  case 'mostly new':
    console.log('back on two feet');
    break;
  default:
    console.log('invalid moon phase');
break;

// each else if statement is now a case. The last is the default it's like the
// last else and the end of the code. this is very helpful if you have
// many conditions.
