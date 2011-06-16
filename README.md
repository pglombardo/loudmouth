Loudmouth
=========

Loudmouth adds comments to any model.

Installation
============
Install the gem (or add to your Gemfile & bundle install)

    gem install loudmouth
    
Run the loudmouth installer to copy an initializer file to your app.

    rails g loudmouth:install
    
Usage
=====

Assuming you want to have 'users' comment on 'articles' add the following to your routes.rb:

    comments_on :articles, :by => :users

run the generator to create the comment model (ArticleComments):

    rails generate loudmouth Article User
    
run the new migrations

    rake db:migrate
    
add the following to your Article model (app/models/article.rb)

    loudmouths_can_comment
    
and you get nested routes like these:

    /articles/:article_id/comments
    /articles/:article_id/comments/new
    /articles/:article_id/comments/:id/edit

Browse to an article and append '/comments' to the end of the URL.

If you want to render comments in-line on Articles#show

    render_comments_for(@article)
    
or to render a new comment form

    render_comment_form_for(@article)
    
Advanced Usage
==============

Customizing
-----------

To further customize loudmouth, edit the values in the installed initializer file (config/initializers/loudmouth.rb):

    # Optionally specify a layout to use for the loudmouth controller
    config.use_layout = ''

    # Default comment text for the new comment form
    config.new_comment_content = "Enter new Comment..."

Overriding the Loudmouth Controller
-----------------------------------

Any loudmouth method can be overridden.  And hey...there's a generator for that!

    rails g loudmouth:override_controller
    
This will install a loudmouth override controller into your application (into app/controllers).

To activate the override controller, make sure to update all of your comments_on calls in your routes.rb file:

    comments_on :articles, :by => :users, :controller => 'comments'

Some common functions to override:

* **after\_create\_path** - where to direct the user after successfully posting a comment
* **validate\_destroy** - validates whether the current user can delete a comment (e.g. admin or comment author)
* **after\_destroy\_path** - where to direct the user after successfully deleting a comment

See the installed override controller [source](https://github.com/pglombardo/loudmouth/blob/master/lib/generators/loudmouth/templates/comments_controller.rb) for full details.

Contributing to loudmouth
-------------------------
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Background
----------

This gem was built for [Gameface](http://g.ameface.com) to unify duplicate commenting code.

Thanks to [plataformatec/devise](https://github.com/plataformatec/devise) and [aarongough/has\_threaded\_comments](https://github.com/aarongough/has_threaded_comments) for insight into how gems work.

Copyright
---------

Copyright (c) 2011 Peter Giacomo Lombardo. See LICENSE.txt for
further details.

