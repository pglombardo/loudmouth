require 'rails/generators'
require 'rails/generators/migration'     

class LoudmouthGenerator < Rails::Generators::Base
  desc "Generates the migrations and models needed for loudmouths to comment on your TOPIC_MODEL."
  include Rails::Generators::Migration
  argument :topic_model,  :type => :string, :required => true
  argument :user_model,  :type => :string, :required => true
  
  # FIXME: Put in argument validation to assure that the models are in singular form or things break.

  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end

  # Implement the required interface for Rails::Generators::Migration.
  # taken from http://github.com/rails/rails/blob/master/activerecord/lib/generators/active_record.rb
  def self.next_migration_number(dirname)
    next_migration_number = current_migration_number(dirname) + 1
    if ActiveRecord::Base.timestamped_migrations
      [Time.now.utc.strftime("%Y%m%d%H%M%S"), "%.14d" % next_migration_number].max
    else
      "%.3d" % next_migration_number
    end
  end

  def create_groups_migration_file
    migration_template 'comments_migration.rb', "db/migrate/create_#{topic_model.downcase}_comments.rb"
  end
  
  def create_model_files
    template 'comment_model.rb', "app/models/#{topic_model.downcase}_comment.rb"
  end
end
