module Loudmouth
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.join(File.dirname(__FILE__), '../../../app/views')

      desc "Copies loudmouth views to your application."

      def copy_views
        directory "loudmouth/comments", "app/views/loudmouth/comments"
      end
    end
  end
end