/* scope is like an apartment building. I have access to the stuff in common
areas and in my own apartment, but not the stuff in other apartments.
variables defined only within fucntions cannot be called by other ones.
For example: */
var laundryRoom = 'Basement';
var mailRoom = 'Room 1A';

var myApartment = function() {
  var mailBoxNumber = 'Box 3';
  var laundryRoom = 'In-unit';
  console.log('Mail box: ' + mailBoxNumber + ', Laundry:' + laundryRoom);
};

console.log(laundryRoom);
/*this prints
myApartment(); */
