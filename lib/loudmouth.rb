require "loudmouth"
require "rails/routes"
require "extensions/helper"

module Loudmouth
  class Engine < Rails::Engine
  end
  
  mattr_accessor :use_layout
  @@use_layout = ''
  
  mattr_accessor :new_comment_content
  @@new_comment_content = ''

  def self.setup
    yield self
  end  
end