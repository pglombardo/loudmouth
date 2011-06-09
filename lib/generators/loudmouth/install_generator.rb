require 'active_support/secure_random'

module Loudmouth
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.join(File.dirname(__FILE__), 'templates')

      desc "Copies a loudmouth initializer and locale files to your application."
      class_option :orm

      def copy_initializer
        template "loudmouth_initializer.rb", "config/initializers/loudmouth.rb"
      end

      def copy_locale
        #copy_file "../../../config/locales/en.yml", "config/locales/loudmouth.en.yml"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end