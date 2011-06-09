Loudmouth
---------

Loudmouth adds comments to any model.

Installation
------------
Install the gem (or add to your Gemfile & bundle install)

    gem install loudmouth
    
Run the loudmouth installer to copy an initializer file to your app.

    rails g loudmouth:install
    
Usage
-----
Assuming you want to have 'users' comment on 'articles' add the following to your routes.rb:

    comments_on :articles, :by => :users
    
run the generator to create the comment model (ArticleComments):

    rails generate loudmouth Article User
    
and you get nested routes like these:

    /articles/:article_id/comments
    /articles/:article_id/comments/new
    /articles/:article_id/comments/:id/edit

Browse to an article and append '/comments' to the end of the URL.

Contributing to loudmouth
-------------------------
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2011 Peter Giacomo Lombardo. See LICENSE.txt for
further details.

