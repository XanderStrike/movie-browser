movie-browser
=============

This is a simple rails app I built to allow my media server to make my movie library available over LAN. Essentially, it's like a personal netflix, it shares your movie, tv, and music library in an easy to use web interface with an HTML5 player.

[Here is what it looks like.](http://imgur.com/a/5GFME)

installation
-----

Plays best on Ubuntu Server 14.04, your mileage may vary.

Install apache:

    sudo apt-get install apache2
    
Install passenger for Apache (see [this guide for more info](https://rvm.io/integration/passenger)):

    gem install passenger
    passenger-install-apache2-module

Install prerequisities:

    sudo apt-get install mediainfo libtag1-dev

Clone this repository and prepare the app for production:

    git clone https://github.com/XanderStrike/movie-browser.git
    cd movie-browser
    bundle install
    RAILS_ENV=production rake db:migrate assets:precompile

Create symbolic links to your movie and tv libraries in the `/public` directory of the app. The symlinks should be named "movies" and "tv" and "music":

    cd /path/to/movie-browser/public
    ln -s /media/bigdrive/movies
    ln -s /media/bigdrive/tv
    ln -s /media/bigdrive/music

Configure apache/passenger appropriately by modifying `/etc/apache2/sites-enabled/000-default` to suit your needs, your setup will almost certainly be different, but this is my configuration for hosting the app on the `/theater` sub-uri:

    Alias /theater /home/xander/movie-browser/public
    <location /theater>
      PassengerBaseURI /theater
      PassengerAppRoot /home/xander/movie-browser
    </location>
    <Directory /home/xander/movie-browser/public>
      Allow from all
      Options -Multiviews
    </Directory> 

Once you've got the app running, visit `/settings` to populate your settings table with defaults, and you should be good to go!

usage
-----

Once you're installed and running populate your DB by running the rake scan tasks:

    rake scan:movies
    rake scan:tv
    
These will take time, but once they're done you will be able to see your library when you visit the application.

automated scanning
------------------

This app uses the 'whenever' gem, you can edit `config/schedule.rb` to determine how often you want to run scans, and simply run `whenever` in the app directory to get the lines you need to copy and paste into your cron.

contributing
------------

Please do! I'd love to see your pull requests. If you've got a feeature idea, go ahead and submit an issue.

license and attribution
-----------------------

MIT License

This product uses the TMDb API but is not endorsed or certified by [TMDb](http://www.themoviedb.org).

Icons: [Television](http://thenounproject.com/term/television/416/prev), [Film](http://thenounproject.com/term/reel-to-reel/1895/), [Music](http://thenounproject.com/term/radio/2013/)
