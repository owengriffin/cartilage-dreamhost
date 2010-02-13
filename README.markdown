# Cartilage-Dreamhost

http://github.com/owengriffin/cartilage-dreamhost

This is a Monk skeleton, forked from "cartilage", configured to deploy to Dreamhost.

## Terse Instructions

1. Install [Monk](http://monkrb.com) and [Capistrano](http://capify.org)
2. Add this project as a skelton

        monk add cartilage-dreamhost git://github.com/owengriffin/cartilage-dreamhost.git

3. Create a new project based on this skeleton

        monk init --skeleton=cartilage-dreamhost

4. Modify config/deploy.rb and enter the name of your application, and modify the domain names.
5. Run 

        cap deploy:setup
    
6. Now you are ready to deploy your application

        cap deploy

## Adding a new dependency

I've modified this skeleton to use bundler. If you need to add a dependency you need to add it to the Gemfile, and follow the instructions on the bundler wiki.

First install the required Gems

    bundle install

Then lock the gems into the project

    bundle lock
    
Now ensure that the gems are kept within the project

    bundle pack    
    

## Original README

I called this cartilage because cute names are important in the ruby world. (see lazybones)

Cartilage = (Monk) skeleton on DataMapper (cartography?) Or something. Gimme a break.

Unlike the main monk skeleton, I didn't commit the contents of the vendor directory.

Instead, after you check out the skeleton, be sure to use the dep tool to build them.

dep vendor --all


Also, open config/settings.yml and change the SQLite3 database name(s) to reflect your set-up or switch to MySQL, Postgres, etc.

TODO, requests for help - stuff I would like to add:

1. A task to do some env/variable injection/interpolation. For example, a tool to inject an app name into the settings.yml file.
2. Support for memcached out of the box to cache the results of DataMapper lookups.


