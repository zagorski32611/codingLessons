var start = prompt("STOP! He who would cross the Bridge of Death must answer me these \
questions 3... Proceed? yes or no").toLowerCase();
/* the .toLowerCase and .toUpperCase will change the answer to all upper or lower case
so we only have to code for one or the other. It the user types Yes, YES or yes, it won't mess up! */

switch (start) {
  case 'Yes'.toLowerCase():
    alert("Go ahead Bridge Kepper, I'm not afraid...")
    break;
  case 'No'.toLowerCase():
    alert("Very well, Sir Robin")
    break;
  default:
    prompt("I will assume that's a 'yes'!");
}

var question1 = prompt("What is your name?").toLowerCase()

if (question1 == "Sir Lancelot") {
  alert("Sir Lancelot, the Brave!");
} else {
  alert("Question 2...");
}

var question2 = prompt("What is your quest?").toLowerCase()

if (question2 == "to seek the grail!" && "to win the game!") {
  alert("Solid reference!");
} else {
  alert("Question 3");
}

var question3 = prompt("What is the air speed velocity of an unladen swallow?!").toLowerCase()
if (question3 == "an african or european swallow?" || "with \
cocconuts?") {
  alert("AHHHHHHHHHHHHHHHHHHH you win!");
} else {
  alert( "you loose!");
}
