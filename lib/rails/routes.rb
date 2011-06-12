module ActionDispatch::Routing
  class Mapper

    def comments_on(*resources)
      options = resources.extract_options!

      unless resources.count == 1
        raise "too many arguments passed to comments_on.  Format is comments_on :articles, :by => :users"
      end
      
      unless options.has_key?(:by)
        raise "comments_on must include an :by option.  Format is comments_on :articles, :by => :users"
      end
      
      unless options.has_key?(:controller)
        options[:controller] = 'loudmouth/comments'
      end
      
      topic_model = resources.first.to_s
      user_model = options[:by].to_s
      options.delete(:by)
      
      Loudmouth.treasure_map[topic_model.singularize.downcase.to_sym] = 
                                        { :by => user_model.singularize.downcase }
      
      constraint = lambda { |req| req.env["loudmouth_map"] = { :topic_model => topic_model, 
                                                               :user_model => user_model }; true }
      Rails.application.routes.draw do
        resources topic_model do
          constraints(constraint) do
            resources "comments", options
          end
        end
      end
    end
  end
end