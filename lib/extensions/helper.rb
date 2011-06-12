module Loudmouth
  module Controllers
    module Helpers
      extend ActiveSupport::Concern
      
      included do
        helper_method :render_comment_form_for
      end
      
      def render_comment_form_for(topic, user)
        unless Loudmouth.treasure_map.has_key?(topic.class.name.underscore.downcase.to_sym)
          raise "loudmouth not setup for #{topic.class.name.underscore.downcase.to_sym}"
        end

        render :partial => 'loudmouth/comments/comment_form',
                :locals => { :topic => topic, :user => user, :content => Loudmouth.new_comment_content }
      end
      
      def topic_comment_path(topic)
        send("#{topic.class.name.underscore.downcase}_comments_path", topic)
      end
      
    end
    module InternalHelpers #:nodoc:
      extend ActiveSupport::Concern
    end
  end
end
