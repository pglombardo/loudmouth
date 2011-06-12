module Loudmouth
  module Generators
    class OverrideControllerGenerator < Rails::Generators::Base
      source_root File.join(File.dirname(__FILE__), 'templates')

      desc "Copies an override controller to your application that you can use to further customize and control loudmouth."

      def copy_override_controller
        directory "comments_controller.rb", "app/controllers/comments_controller.rb"
      end
      
      def show_readme
        readme "README.override_controller" if behavior == :invoke
      end
    end
  end
end