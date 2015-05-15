Bandable Band Management System
===============================

For Epicodus Code Review: Friday, May 15, 2015
---------------------------------------------

Description:
------------
Allows adding of bands and venues, adding one to the other, and vice versa, deleting either, and renaming either.

By:
---
Andrew David Burt (andrew@ampletorque.com)

Setup:
------
Runs under ruby v2.0.0p481 on OS X.
You will need to create a postgres database for this app and its tests to run.
After postgres is installed, run:

    $ postgres

  Leave this running. Now create the database tables as follows:

    $ rake db:create
    $ rake db:migrate
    $ rake db:test:prepare

  Then run the app:

    $ ruby app.rb

License:
--------
MIT License. Copyright 2015 Andrew David Burt.

Bugs:
-----
None so far.

Notes:
------
None.
