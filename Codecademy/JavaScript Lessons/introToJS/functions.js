// a function is code that we reuse for various inputs
function takeOrder(){
  console.log('Order: Pizza topped with');
}

// when we "call" the function we write it like so:

takeOrder("Cheese");
// functions can also take argument(s)
// if we write the function aboe, it'll put out "Order: Pizza
// topped with"

function takeOrder(topping) {
  console.log("Order: Pizza topped with " + topping);
}
// the topping is the arguement. So, we can type in anything we
// want!

takeOrder('Pepperoni');

// with console.log this will print "Order: Pizza topped with Pepperoni"
// if you docuemnt.write it will show up on the broswer!
// also don't forget to put the argument in "" because it's a string

// this is the same function with multiple arguements!
// You name them both in the function and when you call them!
function takeOrder(crustType, topping){
  document.write("Order: " + crustType + " pizza with "
  + topping);
}
takeOrder('bacon', 'thin');
takeOrder('pepperoni', 'regular');
takeOrder('pesto', 'thin');

/* now, in this exercise, we're goin to use return. And call
the results in another function, the print the results of the first results
and the second. So, we want the subtotal of EACH ORDER.
in the last example we had 3 orders. What's the subtotal, if each
pizza is $7.50? */

var orderCount = 0;

function takeOrder(topping, crustType) {
  orderCount = (orderCount + 1);
  document.write('Order: ' + crustType + 'crust topped with '
  + topping);
}
// everytime we call this fuction, we add one to var orderCount ^^


function getSubTotal(itemCount) {
 return (itemCount * 7.5);
}
/* itemCount is a variable which we will define later
*/

takeOrder('bacon', 'thin');
takeOrder('pepperoni', 'regular');
takeOrder('pesto', 'thin');

takeOrder('bacon', 'thin');
takeOrder('pepperoni', 'regular');
takeOrder('pesto', 'thin');

console.log(getSubTotal(orderCount));
/* see, it doesn't really matter what we call "itemCount",
we just immediatly plug in orderCount from the first function.
It goes up each time. */

/* Now, we're going to add a getTax function to the program. this
will allow you to take the subtotal times the tax then we will
add that to the subtotal in a function called getTotal(). We'll print that
and be done! */
var orderCount = 0;

function takeOrder(topping, crustType) {
  orderCount = (orderCount + 1);
  console.log('Order: ' + crustType + 'crust topped with '
  + topping);
}
function getSubTotal(itemCount) {
 return (itemCount * 7.5);
}
function getTax() {
  return getSubTotal(orderCount) * 0.06;
} /* this is the tax ^ */
function getTotal() {
  return getSubTotal(orderCount) + getTax();
} /* this is the grand total ^ */
takeOrder('bacon', 'thin');
takeOrder('pepperoni', 'regular');
takeOrder('pesto', 'thin');
console.log(getTotal());

























































  // This will print: "Order: thin crust pizza with pepperoni"

  function multiplyByNineFifths(celsius) {
    return celsius * (9/5);
  }
  function getFahrenheit(celsius)  {
    return multiplyByNineFifths(celsius) + 32;
  }

  console.log('The temperature is ' + getFahrenheit(15) + '°F');
  // Output: The temperature is 59°F
