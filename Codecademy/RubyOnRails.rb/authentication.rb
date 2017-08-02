=begin
User model
Using the request/response cycle as a guide, here's how authentication fits in:

Turn one:

When a user visits the signup page, the browser makes an HTTP GET request for the URL /signup.
The Rails router maps the URL /signup to the Users controller's new action. The new action handles the request and passes it on to the view.
The view displays the signup form.
Turn two:

When the user fills in and submits the form, the browser sends the data via an HTTP POST request to the app.
The router maps the request to the Users controller's create action.
The create action saves the data to the database and redirects to the albums page. The action also creates a new session.
What is a session? A session is a connection between the user's computer and the server running the Rails app. A session starts when a user logs in, and ends when the user logs out.
1.
Looking at the request/response cycle, we need five parts to add signup machinery to the app: a model, a controller, routes, views, and logic for sessions. Let's start here by creating a model.

Generate a model named User.
2.
In app/models/user.rb, add a method named has_secure_password.
=end
class User < ActiveRecord::Base

  has_secure_password

end

#3. In the Gemfile on line 30, uncomment the bcrypt gem
# 4. Install the gems.
#______________________________________________________________________________
=begin
User migration
What did we just do?

We created a model named User.
In the model, we used the method has_secure_password. This method adds functionality to save passwords securely.
In order to save passwords securely, has_secure_password uses an algorithm called bcrypt. To use bcrypt, we added the bcrypt gem to the Gemfile.
Now that the User model is set up, let's continue by adding columns to the migration files.
Instructions
1.
Open the migration file in db/migrate/ for the users table and add:

a string column called first_name
a string column called last_name
a string column called email
a string column called password_digest
2.
Run a migration to update the database.
=end


=begin
Signup I
Nice work! You've added columns to the users table and ran a migration to update the database.

What's the password_digest column for? When a user submits her password, it's not a good idea to store that password as is in the database; if an attacker somehow gets into your database, he would be able to see all your users' passwords.

One way to defend against this is to store passwords as encrypted strings in the database. This is what the has_secure_password method helps with - it uses the bcrypt algorithm to securely hash a user's password, which then gets saved in the password_digest column.

Then when a user logs in again, has_secure_password will collect the password that was submitted, hash it with bcrypt, and check if it matches the hash in the database.
Instructions
1.
Now that the models are set up, let's move on to the rest of the request/response cycle and create the controllers, routes, and views needed for the signup machinery.

Generate a controller named Users.
2.
In the routes file, add these routes:

get 'signup'  => 'users#new'
resources :users
=end

Rails.application.routes.draw do
  root 'albums#index'
  get 'albums' => 'albums#index'
  get 'albums/new' => 'albums#new'
  get 'albums/:id' => 'albums#show', as: :album
  post 'albums' => 'albums#create'
	get 'signup' => 'users#new'
  resources :users
end

=begin
Signup II
Great! When you visit the URL /signup, the browser makes a GET request for the URL. This request hits the Users controller's new action, which returns a view displaying the signup page.
Instructions
1.
Next, let's take in data submitted through the signup form and save it to the database.

In the Users controller, add a private method user_params

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
2.
Between the new action and the private method, add the create action

def create
  @user = User.new(user_params)
  if @user.save
    session[:user_id] = @user.id
    redirect_to '/'
  else
    redirect_to '/signup'
  end
end
=end
# the users controller will look like this:

class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
  @user = User.new(user_params)
  if @user.save
    session[:user_id] = @user.id
    redirect_to '/'
  else
    redirect_to '/signup'
  end
end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end

=begin
AUTHENTICATION
Users
Nice job! Now when you fill in the signup form and submit it, the data is sent to the Rails app via a POST request. The request hits the User controller's create action. The create action saves the data, creates a new session, and redirects to the albums page.

How is a new session created? Sessions are stored as key/value pairs. In the create action, the line

session[:user_id] = @user.id
creates a new session by taking the value @user.id and assigning it to the key :user_id.
Instructions
1.
Let's check whether the data saved to the database using the Rails console. The Rails console is a useful tool to interact with Rails apps. We'll use it here to query the database.

Start the Rails console by running

rails console  (in the temrinal!)

2.
Retrieve all signed up users in the database by typing

User.all (in the terminal)
Your information should show up in the results.
3.
Visit http://localhost:8000/signup to sign up a few more users through the signup form.

Use the Rails console to retrieved all signed up users again.
4.
Exit the Rails console by typing exit.
=end
