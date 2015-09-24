CurrencyTracker
===============

CurrencyTracker allows you to track your personal collection of world currencies, by tagging the countries that you've visited along your travels.

Setup
-----

Seed the database with currencies and countries by running:

```bash
rake db:seed
```

Testing
-------

Run all test with:

```bash
bundle exec rake travis
```

Run unit tests with:

```bash
bundle exec rake test
```

Cucumber features can be run with:

```bash
bundle exec rake cucumber
```

Features
--------

* Track Visited Countries
* Track Collected Currencies
* Charts show you how far along you are!


Following is the link to Code Challenge:- 
https://github.com/panditgauresh/CurrencyTracker

Functionalities added and changed.
----------------------------------

Difficulties in Setup:-

I am using a windows machine and the code wouldnt compile or seed on it. I had to make several changes to the code to run on my environment. I worked for two hours just to get this started.

Basically what was happeneing was that the Model creation was not working properly. The primary key for both countries and currencies was being translated to an Integer while database creation and thus giving an error while seeding it into database. I tweeked the code to accept this to seed the data. I also had to make changes so that the code would work in Windows (It wasnt specified anywhere it would do so). Made several changes to the gem file to make it work in windows for a few errors.

Didnt count the hours to setup the project as a part of working forward with the challenge.


Starting the project:-

Didnt have a good idea of using sessions or logins in ruby on rails. Never worked on authentication in ROR. So started with all the idea had about how login works and how it will fit in the existing project.

I new how models are created and how they work. I made a user Model and modified the migration to hold the following columns:-

|  email  |  password_hash  |  salt  |

I implemented a similar thing in my internship last summer at Intuit and thus knew about the approach to build such a system. I went forward and created controllers for user to signup for the same. I stored the passwords and hashed them using BCrypt and the created salt for the hash too. This was to be checked when logging in again. After that functionality was done I created the controller for the login mechanism too. This was used to create a session by storing the id for the login which was verified on every subsequent resource.

The database given wasnt given in such a way that I could assign a resource to every individual, and I would have designed the database in a different way for it to be assigned a user. I would have added a table of all visits associated with the user_id of the user.

This itself took much of my time basically like 4-5 hours of work to create the whole login mechanism to create sessions and authentication.

2) API

For the api creation it was easy to translate it to an API. 
I commented the previous code to stop all authentication and redirects to login. I also added several paths to currencies and countries to add paths that return jsons the required data.

I also later went ahead and added gem for facility for pagination. having 10 entries per page. I later added a sorting functionality to the columns which sent the query to sort according to the column type. The sort functionality was added directly to the model class.

3) New Feature

I didnt get time to do this as I had completed a total of 6-7 hours till I came to this section and also the database design was not in place to fulfill the solution. The new feature in itself is not as difficult as it is nothing but the knapsack problem and have to apply dynamic programming to get the best results out of it.

I was happy to see that the problem was interesting but felt the problem asked too much from me. I later also realized there was a solution for authentication using another gem "protect_from_forgery" which was hinted in the application controller but I did not feel it would have been as straight forward. All in all I tried my best to go forward with the problem and solve it to my best capabilities in the given time.

I hereby would like to tell you I would really like to go forward and work more with these technologies. All of what I have done is in regards to what I learned at my last Internship. I just want to say that I pick things really fast and love to play with things.

Thank you.

Best,
Gauresh Pandit.