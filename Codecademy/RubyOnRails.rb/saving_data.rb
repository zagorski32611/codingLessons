=begin
So far we've built a Rails app containing a static page. To do this, we used a controller,
 a route, and a view. The request/response cycle summarizes how these three parts work together.

However, a Rails app with static pages looks the same for all users. How can we create apps
that save information? We do this with a database. Here's how a database fits into the
request-response cycle. Check out the diagram in the browser.

When you type http://localhost:8000/welcome, the browser makes a request for the URL /welcome.
The request hits the Rails router.
The router maps the URL to a controller action to handle the request.
The controller action recieves the request, and asks the model to fetch data from the database.
The model returns data to the controller action.
The controller action passes the data on to the view.
The view renders the page as HTML.
The controller sends the HTML back to the browser.
=end


rails new MessengerApp

bundler install







=begin
Great! You created a new Rails app named MessengerApp.

Looking at the request/response cycle, we need four parts to build a Rails app - a model, a route, a controller, and a view.

Let's start here by creating a model.
Instructions
1.
In the terminal, generate a new model named Message

rails generate model Message
2.
Open the migration file in db/migrate/ for the messages table. The name of the migration file starts with the timestamp of when it was created. Inside the change method, add this line as line 4:

t.text :content
3.
Then in the terminal, run

rake db:migrate
4.
Finally, run

rake db:seed
=end





=begin
What did we just do?

1. The rails generate model command created a new model named Message. In doing so, Rails created two files:

a model file in app/models/message.rb. The model represents a table in the database.
a migration file in db/migrate/. Migrations are a way to update the database.
2. Open the migration file in db/migrate/. The migration file contains a few things:

The change method tells Rails what change to make to the database. Here it uses the create_table method to create a new table in the database for storing messages.
Inside create_table, we added t.text :content. This will create a text column called content in the messages tables.
The final line t.timestamps is a Rails command that creates two more columns in the messages table called created_at and updated_at.
These columns are automatically set when a message is created and updated.
3. The rake db:migrate command updates the database with the new messages data model.

4. Finally the rake db:seed command seeds the database with sample data from db/seeds.rb.

1.
Now that we have a model, let's move on to the second and third parts of the request/response cycle and create a controller and a route.

Generate a controller named Messages.
2.
In the routes file, create a route that maps the URL /messages to the Messages controller's index action.
3.
Then in the Messages controller (app/controllers/messages_controller.rb), add an index action:

def index
  @messages = Message.all
end

It's supposed to look like this:
class MessagesController < ApplicationController
def index
  @messages = Message.all
end
end

=end






=begin
Nice work. We added a controller and a route to the Rails app.

Why does the Messages controller use an action named index? Check out the diagram in the browser. Rails provides seven standard controller actions for doing common operations with data. Here we want display a list of all messages, so we used the index action.

Putting it all together:

When a user visits http://localhost:8000/messages, the routes file maps this request to the Messages controller's index action.
The index action retrieves all messages from the database and stores them in variable @messages.
The @messages variable is passed on to the view. The view should display each message, so let's set it up next.

.
Open app/views/messages/index.html.erb. Under line 11, type the contents as you see here:

<% @messages.each do |message| %>
<div class="message">
  <p class="content"><%= message.content %></p>
  <p class="time"><%= message.created_at %></p>
</div>
<% end %>
2.
Visit http://localhost:8000/messages in the browser.
=end



=begin
Nice work! The app now displays a list of all messages in the database. How does this work?

The file index.html.erb is a web template. Web templates are HTML files that contain variables and control flow statements. Rather than write the same HTML over and over again for each message, we can use web templates to loop through and display data from the database.

In this case:

<% @messages.each do |message| %> iterates through each message in @messages array. We created @messages in the Messages controller's index action.
For each message, we use <%= message.content %> and <%= message.created_at %> to display its content and the time when it was created.
The default web templating language in Rails is embedded Ruby, or ERB.
1.
So far we've been loading messages from the database and displaying them in the view. How can we create new messages and save them to the database? Looking at the seven standard Rails actions, we need to use the new and create actions. Let's set them up now.

In the routes file, create a route that maps requests to messages/new to the Message controller's new action.
2.
Then in the Messages controller below the index action, add the new action:

def new
  @message = Message.new
end
3.
In the routes file, add this route to map requests to the Message controller's create action:

post 'messages' => 'messages#create'
4.
Then in the Messages controller below the new action, add a private method named message_params. Type:

private
  def message_params
    params.require(:message).permit(:content)
  end
5.
Between the new action and the private method, add the create action. Type:

def create
  @message = Message.new(message_params)
  if @message.save
    redirect_to '/messages'
  else
    render 'new'
  end
end
6.
Next, in app/views/messages/new.html.erb under line 11, type in the contents as you see here:

<%= form_for(@message) do |f| %>
  <div class="field">
    <%= f.label :message %><br>
    <%= f.text_area :content %>
  </div>
  <div class="actions">
    <%= f.submit "Create" %>
  </div>
<% end %>
7.
Finally in app/views/messages/index.html.erb below the <% @messages.each do |message| %>...<% end %> block, add

<%= link_to 'New Message', "messages/new" %>
8.
Visit http://localhost:8000/messages in the browser. Click on New Message to add a message of your own.
=end





=begin
Nicely done! The app now takes in messages through a form and saves them into the database. How does this work?
Let's use the request/response cycle as a guide to trace how a user's request flows through the app.

When you visit http://localhost:8000/messages/new to create a new message, it triggers the first turn of the request/response cycle:

The browser makes a HTTP GET request for the URL /messages/new.
The Rails router maps this URL to the Messages controller's new action. The new action creates a new Message object
@message and passes it on to the view in app/views/messages/new.html.erb.
In the view, form_for creates a form with the fields of the @message object.
Then when you fill out the form and press Create, it triggers the second turn of the request/response cycle:

The browser sends the data to the Rails app via an HTTP POST request to the URL /messages.
This time, the Rails router maps this URL to the create action.
The create action uses the message_params method to safely collect data from the form and update the database.
Here we used link_to to create a link to /messages/new. Instead of hardcoding <a> elements, we can use link_to to generate links:

the first parameter is the link text
the second parameter is the URL
=end

Congratulations! You built a messaging app that uses a database to store messages. What can we generalize so far?

A model represents a table in the database.
A migration is a way to update the database with a new table, or changes to an existing table.
Rails provides seven standard controller actions for doing common things such as display and create data
Data can be displayed in the view using ERB web templating.
Data can be saved into the database using a web form.
