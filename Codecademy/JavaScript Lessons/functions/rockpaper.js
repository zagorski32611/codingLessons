// This is my code to build a rock paper scissors game!
var userChoice = prompt("Do you choose rock, paper or scissors?");
var computerChoice = Math.random();
if (computerChoice < 0.34) {
	computerChoice = "rock";
} else if(computerChoice <= 0.67) {
	computerChoice = "paper";
} else {
	computerChoice = "scissors";
} console.log("Computer: " + computerChoice);

function compare(choice1, choice2) {
 if (choice1 === choice2) {
    return ("The result is a tie!");
}
else if (choice1 === "rock") {
    if (choice2 === "scissors") {
        return "rock wins";
    }
    else {
        return "paper wins";
}
if (choice1 === "paper") {
  if (choice2 === "rock") {
    return "paper wins";
  }
  else {
    return "scissors wins";
  }
if (choice1 === "scissors") {
  if (choice2 === "paper") {
    return "scissors wins";
}
  else {
    return "rock wins";
  }}}}}





























var userChoice = prompt("Do you choose rock, paper or scissors?");
var computerChoice = Math.random();
console.log(computerChoice);

if (0 <= userChoice <= 0.33) {
console.log("rock");
} else if (0.34 <= userChoice <= 0.67) {
console.log("paper");
} else (0.67 <= userChoice <= 1); {
console.log("scissors");
}

/* now we need to compare inputs to see who wins: we nest if statements
inside other if statements
it's really confusing at first but it makes sense as you go along!*/

function compare(choice1, choice2) {
 if (choice1 === choice2) {
    return ("The result is a tie!");
}
else if (choice1 === "rock") {
    if (choice2 === "scissors") {
        return "rock wins";
    }
    else {
        return "paper wins";
}
if (choice1 === "paper") {
  if (choice2 === "rock") {
    return "paper wins";
  }
  else {
    return "scissors wins";
  }
if (choice1 === "scissors") {
  if (choice2 === "paper") {
    return "scissors wins";
}
  else {
    return "rock wins";
  }}}}}
