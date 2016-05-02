![Build Status](https://codeship.com/projects/b8a69c70-e9fe-0133-7681-02cde9680eda/status?branch=master)
![Code Climate](https://codeclimate.com/github/mmckv/quitcoin.png)
![Coverage Status](https://coveralls.io/repos/mmckv/quitcoin/badge.png)

QuitCoin is a fully responsive smoking cessation application that tracks users' progress financially and quantitatively while providing positive reinforcement.

[QuitCoin - Heroku Link](http://quitcoin.herokuapp.com/)

##Ruby version:
Ruby version 2.2.3

##Configuration:

Run the following (after git cloning):
 * ``bundle install``
 * ``rake db:create``
 * ``rake db:migrate``
 * ``rake db:seed``
 * ``rails s``

##Features:

* User inputs and/or updates the cost of a local pack of cigarettes
* A virtual bank tracks the financial impact of smoking each cigarette or resisting the urge to smoke
* The user's metrics are tracked per cigarette by day, week and all time
* The user's metrics for the last time they smoke a cigarette are tracked by minute(s), hour(s), day(s)

##Technologies:

* AJAX call for updating user metrics
* Authorization for users with Devise
* Styling with Foundation and custom CSS
* Feature tests with Capybara
* Model tests with Rspec
