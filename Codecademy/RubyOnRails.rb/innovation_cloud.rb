Innovation Cloud want to create a Rails app to collect email signups. Here's what it looks like. At the bottom of the page, when a user enters his email, the email is saved into a database.

Using the request/response cycle as a guide, here's what we need to do for the Innovation Cloud app:

In the first turn of the request/response cycle, the signup form is displayed to the user.
When the user fills in the form with an email and submits it, it triggers the second turn of the request/response cycle, where the email data is saved into the database.
To preview your app at any point:

In the terminal, type rails s -p 4001
In the browser, visit http://localhost:4001
Mark the tasks as complete by checking them off
Setup
1.
Create a new Rails app named innovation-cloud.
2.
After you create the new app, switch to its folder. In the terminal, type:

$ cd innovation-cloud
3.
Install the gems in Gemfile.
Add a model
4.
Generate a model named Signup.
5.
Open the migration file in db/migrate/, and add a string column called email.
6.
Run a migration to update the database with the Signup model.
Add a controller and routes
7.
Generate a controller named Signups.
8.
We've prepared a controller named Pages in app/controllers/pages_controller.rb that has a action named thanks.

In the routes file, map the request for the url /thanks to Pages controller's thanks action. We'll use this route later.
9.
In the routes file, under the thanks route, add:

resources :signups
This is called a resource route. It maps URLs to the Signups controller's seven standard actions
10.
In the terminal, run

$ rake routes
to view all of the new URLs that the resource route created. Resize the terminal component to see the routes.

Which routes should we use? Looking back at the request/response cycle, we need a controller action to handle GET requests and another controller action to handle POST requests. According to the output of rake routes, we can use:

signups#new to handle GET requests by displaying the signup form.
signups#create to handle POST requests by saving an email to the database.
Add controller actions and views
11.
Set up the signups#new controller action to handle GET requests:

In the Signups controller, make an action named new.
def new @signup = Signup.new end
Inside app/views/signups/new.html.erb under line 37, create a form to gather email signups. Use form_for to create a form with the fields of the @signup object. Adapt your code from here.
In the routes file, set the new action as the root route.
Start a Rails server to preview the app in the browser. In the terminal, type:
$ rails s -p 4001
This command starts a Rails server listening on port 4001. Then visit http://localhost:4001 to see your app in the browser.
12.
Set up the signups#create controller action to handle POST requests:

In the Signups controller, write a private method named signup_params:
private def signup_params params.require(:signup).permit(:email) end
Strong parameters gives us a safe way to collect data from a form and update the Signup model. Here we require the model name signup and permit the column name email.
In the Signups controller, make an action named create. Use signup_params to safely collect data from the form and update the database. After saving to the database, redirect to thanks_url. Adapt your code from here.
Restart the Rails server and view the result by visiting http://localhost:4001/. Type in an email address and submit the form.

To restart a Rails server, in the terminal, first press Ctrl+C to shut down the server. Then type rails server to restart it.

Check the database
13.
Confirm that your email saved to the database. The Rails console is a useful tool to interact with Rails apps. We'll use it here to query the database.

In the terminal, open a new tab by clicking the
Switch into your app's folder by typing cd innovation-cloud
Start the Rails console by running
$ rails console
When you enter the Rails console, retrieve all emails in the database by running the query
> Signup.all
This query returns all emails in the database as an array. Your email should show up in the console output.

To exit the Rails console at any point, type Ctrl+D.
14.
Sign up a few more emails through the app, and use the Rails console to check that they saved to the database.
