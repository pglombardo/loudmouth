module LoudmouthExtension
  def self.included(base)  
    base.send :extend, ClassMethods 
  end  
  
  module ClassMethods
    def loudmouths_can_comment(options = {})
      has_many :comments, :class_name => "#{self.name}Comment", :include => [ :author ], 
                    :dependent => :destroy, :order => 'created_at DESC'
      send :include, InstanceMethods
    end   
  end  
  
  module InstanceMethods 
  end 
end

ActiveRecord::Base.send :include, LoudmouthExtension