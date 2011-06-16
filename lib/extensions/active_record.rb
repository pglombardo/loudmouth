module LoudmouthExtension
  def self.included(base)  
    base.send :extend, ClassMethods 
  end  
  
  module ClassMethods 
    def loudmouths_can_comment(options = {})
      has_many :comments, :class_name => "#{self.name}Comment", :dependent => :destroy
      send :include, InstanceMethods
    end   
  end  
  
  module InstanceMethods 
  end 
end

ActiveRecord::Base.send :include, LoudmouthExtension