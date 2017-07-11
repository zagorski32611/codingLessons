var slaying = true;
var youHit = Math.floor(Math.random() * 2);
var damageThisRound = Math.floor(Math.random() * 5 + 1);
var totalDamage = 0;
var totalDamage = totalDamage += damageThisRound;

while (slaying) {
if (youHit === 1) {
    console.log("You hit!");
    if (totalDamage  >= 4) {
    console.log("You slew the dragon!");
    slaying === false;
    } else (youHit === Math.floor(Math.random() * 2));
} else {
    console.log("The dragon hit you!");
}
slaying = false;
}
