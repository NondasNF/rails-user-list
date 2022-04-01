# About the project

A simple project to consume api in Rails and store the data in active records, and then render the data in the view.

The API used is https://randomuser.me/api/, this gives us random user data using some endpoints.

The main data served by the api are:
    - Name
    - age
    - E-mail
    - telephone
    - Picture
    - localization

It is also part of the challenge to save the user's pictures to local storage.

### My opinion:
I found it incredibly interesting because I had never consumed any API in Rails, I liked the implementation experience, I had never used local storage before either and I was very excited to implement it with Rails, but I'm not sure if the current method is the best way to do it, so at first I was planning to do something like JavaScript, but I wasn't sure if I could do it with rails, so I decided to do it with pure rails, saving the images in the local storage folder, and then rendering the images in the display.
I would like to dedicate more time to this project and study more about local storage.

# Dependencies

Ruby v"3.0.0" 

Rails v"6.1.5"

PostgreSQL v"12.10"

# Installation

Installing Rails using RVM
~~~
\curl -L https://get.rvm.io | bash -s stable --rails
~~~
Install depencies using Bundler in the project root
~~~
$ bundle install
~~~
Also need to install postgresql and postgresql-contrib:
~~~
$ sudo apt-get install postgresql postgresql-contrib
~~~
Acess postgresql using psql:
~~~
sudo -u postgres psql
~~~
Create a role:
~~~
create role myapp with createdb login password 'password1';
~~~
Ok, back to the project root let's congifure the database
~~~
$ rails db:setup
$ rails db:create
~~~
Next step, to set migrations from the currently configured migrations directory, use:
~~~
$ rails db:migrate
~~~
Finilly to excetute the server on your browser at http://localhost:3000/, use:
~~~
$ rails s
~~~
# Configuration
Access in the browser: http://localhost:3000/, you has to import users, and then you can see the data in the view.
In the navigation bar, select "Import Users" to import the users, or just go to http://localhost:3000/import_users
wait a little when the data is imported and then you can see the data home directory or go to http://localhost:3000/users

You can change the quantity of profiles imported by changing the quantity in the user_controller.rb file, line 18.

### __Working on:__
Unit tests to improve the future development
Implement the way to import the users from the api

