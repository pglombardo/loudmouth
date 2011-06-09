class <%= topic_model.camelize %>Comment < ActiveRecord::Base
  acts_as_tree :order => 'created_at'
  
  belongs_to :<%= topic_model.downcase %>
  belongs_to :author, :foreign_key => :author_<%= user_model.downcase %>_id, :class_name => "<%= user_model.camelize %>"
end