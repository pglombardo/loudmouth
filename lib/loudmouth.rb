require "loudmouth"
require "rails/routes"
require "extensions/helper"
require "extensions/active_record"

module Loudmouth
  class Engine < Rails::Engine
    config.loudmouth = Loudmouth
    
    initializer "loudmouth.helpers" do
      Loudmouth.include_helpers()
    end
  end
  
  mattr_accessor :use_layout
  @@use_layout = ''
  
  mattr_accessor :new_comment_content
  @@new_comment_content = ''

  mattr_accessor :treasure_map
  @@treasure_map = {}

  def self.setup
    yield self
  end
  
  def self.include_helpers
    # ActiveSupport.on_load(:action_controller) do
    #   include Loudmouth::Controllers::Helpers
    # end

    ActiveSupport.on_load(:action_view) do
      include Loudmouth::Controllers::Helpers
    end
  end
end
