/* We are learning how to program because
we don't want to do boring, repetitive work!
The computer should do that.

This first exercise is a good example of exactly
why you want to learn for loops. */

for (var i = 8 ; i < 120; i+= 12) {
	console.log(i);
}
/* so the easiest way to descibe it:
for (var "start"; end; increment)

// now we're gonna use an array and a for loop to find my name in some text:

/*jshint multistr:true */
var text = "blah blah blah Joe blah blah blah blah blah blah \
blah blah blah Joe blah blah blah blah blah blah blah blah blah";

var myName = "Joe";
var hits = [];



// Look for "E" in the text
for(var i = 0; i < text.length; i++) {
	if (text[i] === "E") {
		// If we find it, add characters up to
		// the length of my name to the array
		for(var j = i; j < (myName.length + i); j++) {
			hits.push(text[j]);
		}
	}
}

//_______________________________________________________________
// THis is what I cannot get to work!
text = "Blah blah blah blah blah blah Eric \
blah blah blah Eric blah blah Eric blah blah \
blah blah blah blah blah Eric";

var myName = "Eric";
var hits = [];

// Look for "E" in the text
for(var i = 0; i < text.length; i++) {
	if (text[i] === "E") {
		// If we find it, add characters up to
		// the length of my name to the array
		for(var j = i; j < (myName.length + i); j++) {
			hits.push(text[j]);
		}
	}
}

if (hits.length === 0) {
	console.log("Your name wasn't found!");
} else {
	console.log(hits);
}

for (i = 0; i < text.length; i++){
if (text[i] === "N"){
for (var j = i; j < myName.length+i; j++){
hits.push(text[j]);
}
}
}



// the final finished product!
/*jshint multistr:true */
var text = "blah blah blah Joe blah blah blah blah blah blah \
blah blah blah Joe blah blah blah blah blah blah blah blah blah";

var myName = "Joe";
var hits = [];

for (var i = 0 ; i < text.length ; i++) {
    if (text[i] === myName[0]) {
    for (var j = i; j < myName.length + i; j++){
    hits.push(text[j]);
    }
    }
    }

if (hits.length === 0) {
    console.log("Your name wasn't found!")
} else {
    console.log(hits)
}
//_______________________________________________________________

/* while loops: */
var count = 0;

var loop = function(){
	while (count++ <= 3){
    console.log("I'm looping!");
	}
};

loop();


var count = [1, 2, 3, 4];

for (i = 0; i <= count[3]; i++){
    console.log(i);
}

var loop = function(){
    while ( i <= count[3]);
    console.log("I'm looping");
}


// This is a review loop!

var number = (7, 8, 9, 10, 11, 12, 13, 14);
for (var i = 1; i <= 14; i++) {
    console.log(i);
}

while (i <= 10) {
    console.log("less than 10");
    isNaN === false;
}



// This is will print out each element of an array!
var languages = ["HTML", "CSS", "JavaScript", "Python", "Ruby"];

for (i = 0; i <languages.length; i ++) {
    console.log(languages[i]);

}











var loopy = 5;
for (i = 0 ; i <= loopy; i++); {
console.log(i++);
}

var loop1 = function() {
    while (loopy <= 5){
    console.log("I got this!");
    }
};

do
