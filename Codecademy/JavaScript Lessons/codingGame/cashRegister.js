//Create the object called cashRegister
//and initialize its total property
var cashRegister = {
    total: 0
};


//Using dot notation change the total property
cashRegister.total = 2.99;

// now we're going to use a method to add up each item in someone's grocery cart:

var cashRegister = {
    total:0,
    add: function(itemCost){
        this.total += itemCost;
    }
};


//call the add method for our items
cashRegister.add(0.98 + 1.23 + 4.99 + 0.45); // like eggs, bananas, milk and an onion

//Show the total bill
console.log('Your bill is '+cashRegister.total);

/*Short-Term Memory
But this method only works as long as you can remember the cost of every item
in the store. We need something like a bar code scanner where just knowing the
item name will automatically add the cost of that item to the total.
So we create a method called scan. This method takes some item parameter, and
adds the cost of this item to the total. item is a string.
We also use a switch statement. Previously, we would have probably used multiple
if-else statements. Here, things work in a similar way.
For example, if the item is "eggs" (line 8), we then call the add method,
passing through 0.98 as the itemCost. This will add 0.98 to cashRegister.total.
If instead the item is "milk" or "chocolate" or "magazine", the
relevant itemCost is added. Note no default case is needed for this switch
statement. */

var cashRegister = {
    total: 0,
    add: function(itemCost){
    this.total += itemCost;},

    scan: function (item) {
        switch (item) {
        case "eggs":
            this.add(0.98);
            break;

        case "milk":
            this.add(1.23);
            break;

       case "magazine":
           this.add(4.99);
           break;
        case "chocolate":
            this.add(0.45);
            break;

        }
        return true;
    }
    };


//Scan 2 eggs and 3 magazines
var cashRegister = {
    total: 0,
    add: function(itemCost){
    this.total += itemCost);},

    scan: function (item) {
        switch (item) {
        case "eggs":
            this.add(0.98);
            break;

        case "milk":
            this.add(1.23);
            break;

       case "magazine":
           this.add(4.99);
           break;
        case "chocolate":
            this.add(0.45);
            break;

        }
        return true;
    }
    };


//Scan 2 eggs and 3 magazines
cashRegister.scan("eggs", 4);
cashRegister.scan("eggs");
cashRegister.scan("magazine");
cashRegister.scan("magazine");
cashRegister.scan("magazine");
//Show the total bill
console.log('Your bill is '+cashRegister.total);



/* now typing out each item is pretty fuckin' annoying, so let's add a quatitiy
to each item in the case: */
var cashRegister = {
    total:0,
    add: function(itemCost){
        this.total += itemCost;
    },
    scan: function(item, quantity) {
        switch (item) {
        case "eggs": this.add(0.98 * quantity); break;
        case "milk": this.add(1.23 * quantity); break;
        case "magazine": this.add(4.99 * quantity); break;
        case "chocolate": this.add(0.45 * quantity); break;
        }
    }
};

// scan each item 4 times
cashRegister.scan("eggs", 4);
cashRegister.scan("milk", 4);
cashRegister.scan("magazine", 4);
cashRegister.scan("chocolate", 4);

//Show the total bill
console.log('Your bill is '+cashRegister.total);



// Now we need to add a void function:

var cashRegister = {
    total:0,
    //Dont forget to add your property
    add: function(itemCost) {
        this.total +=  itemCost;
        this.lastTransactionAmount = itemCost;
    },
    scan: function(item,quantity) {
        switch (item) {
        case "eggs": this.add(0.98 * quantity); break;
        case "milk": this.add(1.23 * quantity); break;
        case "magazine": this.add(4.99 * quantity); break;
        case "chocolate": this.add(0.45 * quantity); break;
        }
        return true;
    },
    //Add the voidLastTransaction Method here
    voidLastTransaction: function(item, quantity) {
      this.total -= this.lastTransactionAmount;
    },

};

cashRegister.scan('eggs',1);
cashRegister.scan('milk',1);
cashRegister.scan('magazine',1);
cashRegister.scan('chocolate',4);

//Void the last transaction and then add 3 instead
cashRegister.voidLastTransaction('chocolate', 4);
cashRegister.scan('chocolate', 3);

//Show the total bill
console.log('Your bill is '+cashRegister.total);



/* THIS IS THE FINAL PRODUCT! */


function StaffMember(name, discountPercent){
    this.name = name;
    this.discountPercent = discountPercent;
}

var sally = new StaffMember("Sally",5);
var bob = new StaffMember("Bob",10);

// Create yourself again as 'me' with a staff discount of 20%
var me = new StaffMember("me", 20);

var cashRegister = {
    total:0,
    lastTransactionAmount: 0,
    add: function(itemCost){
        this.total += (itemCost || 0);
        this.lastTransactionAmount = itemCost;
    },
    scan: function(item,quantity){
        switch (item){
        case "eggs": this.add(0.98 * quantity); break;
        case "milk": this.add(1.23 * quantity); break;
        case "magazine": this.add(4.99 * quantity); break;
        case "chocolate": this.add(0.45 * quantity); break;
        }
        return true;
    },
    voidLastTransaction : function(){
        this.total -= this.lastTransactionAmount;
        this.lastTransactionAmount = 0;
    },
    // Create a new method applyStaffDiscount here
    applyStaffDiscount : function(employee) {
        this.total -= this.total * (employee.discountPercent/ 100);
    },

};

cashRegister.scan('eggs',1);
cashRegister.scan('milk',1);
cashRegister.scan('magazine',3);
// Apply your staff discount by passing the 'me' object
// to applyStaffDiscount
cashRegister.applyStaffDiscount(me, 20);

// Show the total bill
console.log('Your bill is '+cashRegister.total.toFixed(2));
