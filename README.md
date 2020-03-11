# App Team Code Challenge

## Classic Video Game Web App
This coding challenge will test your ability to modify and add onto a small web application.  You can use any documentation: Google, Stack Overflow and any IDE.  Rails and Sqlite have already been configured with some stubbed out code.  You can use third party libraries such as ActiveRecord, JQuery, AngularJS, Ruby Gems, etc.

## How long should this take?
PLEASE TAKE YOUR TIME and pay attention to detail!  Your code will be reviewed not only for being able to complete the tasks assigned, but also for readability, dry-ness, OOP, separation of concerns and other style characteristics.  How you solve the problem is just as important as being able to solve it.  Recruiters may try to rush you to complete this code challenge, but anywhere from a couple of weeks to a couple of months is okay.  We'll still be here.  :)

### General Instructions
The application is a small web-based video game directory for classic arcade games.  There is already a sqlite database and some Rails ActiveRecord models for data access.  The entire app should be a single page application (SPA.)  You can use any js framework to accomplish this if desired.  Rails should only provide the data via json.  The initial page should load static Html/Javascript and then request additional resources via ajax to open dialogs, retrieve data, etc.  The home page is setup for this at localhost:3000/ and the template for it is at app/views/home/index.html.erb.  This is the only view that should be rendered by rails.

## Step 0: Getting Started
* Fork this repository and add your code to the forked copy to create your web application.  When you're finished, you will submit your fork as a pull request.
* Make sure you have ruby 2.6.5 or greater [installed]( https://www.ruby-lang.org/en/documentation/installation).
* [Install bundler](https://bundler.io/) using:

	```gem install bundler```

* Rails and other gems are setup in this application for you.  To install all the dependencies, simply run:

	```bundle install```

	This will install everything you need, except ruby itself.

* You should be all setup to fire up the rails application.  You can attempt to do so by using the command:

	```bundle exec rails server ```

	and then goto http://localhost:3000 in your browser.  It should simply say "Home"

## Step 1: Games Grid
* Create a tabular data grid that shows the games in the directory. The grid should show the name, year and publisher of the game.  This grid should be rendered client-side (not with rails) and make an ajax request to http://localhost:3000/games to get the data.  The file ```app/controllers/games_controller.rb``` already has the index action defined and currently returns all the games as json to get you started.  There is already a route setup in config/routes.rb.
* Modify the page above to limit the records to just games that are "active" as defined in the database active flag.
* Modify the page to sort by the game year.
* change ```app/controllers/games_controller.rb``` so that the "http://localhost:3000" in the json is NOT hardcoded the way it is now. Your code should detect the protocol and use the correct one.

## Step 2: Game Details Dialog
* When the video game name is clicked it should open a pop up or dialog. The dialog should show further details of the game including all the information above as well as the photo and description.  To get this data and display it you should make another AJAX call using JSON as the data transport to the server to get the detailed information and display it in the dialog.
* The photo should be resized on the server or client to fit in the dialog and displayed with the game details.  The photos have already been imported and associated with the data using the Paperclip gem.  You just have to get them to display. Look in ```app/controllers/games_controller.rb``` in the index action for an example of getting the image urls.
* Most games don't have images.  Use a placeholder image for those games.

## Step 3: Liking Games
* Add a link or button to the game detail dialog that says “Like” similar to how Facebook works.  When clicked, this should make an AJAX call to the server (again passing data using JSON for which game was clicked).
* store the total number of likes somewhere and increment it every time a "like" is successful.
* Update the game details dialog to show the total number of likes for this game
* When the like button is clicked, the following things should happen:
  - store the "like" in a separate table.  You might look at rails migrations for adding this table.  You will need to store the game that was liked, the date/time when it happened and the ip address of the user that liked it.
  - send an email to yourself that the game was liked.  Display the name, year and ID of the game that was liked in the email.  You might look at ActionMailer for this, but any mail framework will do.
  - return the new like count to display in the Game Details dialog.
  - prevent duplicate likes.  Change the code so that once an IP is associated with a game, the same game can't be liked again by the same IP within 5 minutes.


## Step 4: CLI
* Sometimes you want a command line way to perform the same action as the UI.  Rails includes "RAKE" for these types of commands.  Write a rake task for liking a game.  It should accept an IP and game ID.  It basically duplicates the same funtionality in the previous step for liking a game, but using the command line instead of the web interface. This includes creating the like, sending the email and checking existing validation for ip address.
* The rake task should tell the user that the like was successful and give a new total count.
* A rake file has been stubbed for you in ```lib/tasks/like.rake``` that accept the game_id and IP parameters.  You just have to make it work.


## Step 5: Testing and cleanup
* Add specs for any code you wrote for the controller and models or any other classes (ideally you do this as you go along, but everyone's different.)  You can use any ruby based testing framework you want.
* Add specs for any of the javascript you wrote.  Use any javascript testing framework you prefer. Do the amount of testing you feel is best.
* Rails is big on being DRY.  Do you have any duplicate code?  Anything that's hard to read or understand?
* Finally, submit your fork of this repository as a Pull Request in Github.
