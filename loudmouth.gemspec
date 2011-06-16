# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{loudmouth}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Peter Giacomo Lombardo}]
  s.date = %q{2011-06-16}
  s.description = %q{Loudmouth adds commenting to one or many of your models.}
  s.email = %q{pglombardo@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "app/controllers/loudmouth/comments_controller.rb",
    "app/helpers/comments_helper.rb",
    "app/views/loudmouth/comments/_comment.html.haml",
    "app/views/loudmouth/comments/_comment_form.html.haml",
    "app/views/loudmouth/comments/index.html.haml",
    "lib/extensions/active_record.rb",
    "lib/extensions/helper.rb",
    "lib/generators/loudmouth/install_generator.rb",
    "lib/generators/loudmouth/loudmouth_generator.rb",
    "lib/generators/loudmouth/orm_helpers.rb",
    "lib/generators/loudmouth/override_controller_generator.rb",
    "lib/generators/loudmouth/templates/README",
    "lib/generators/loudmouth/templates/README.override_controller",
    "lib/generators/loudmouth/templates/comment_model.rb",
    "lib/generators/loudmouth/templates/comments_controller.rb",
    "lib/generators/loudmouth/templates/comments_migration.rb",
    "lib/generators/loudmouth/templates/loudmouth_initializer.rb",
    "lib/generators/loudmouth/views_generator.rb",
    "lib/loudmouth.rb",
    "lib/rails/routes.rb",
    "loudmouth.gemspec",
    "test/helper.rb",
    "test/test_loudmouth.rb"
  ]
  s.homepage = %q{http://github.com/pglombardo/loudmouth}
  s.licenses = [%q{MIT}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.1}
  s.summary = %q{Comments for one or many models.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<acts_as_tree>, [">= 0"])
      s.add_runtime_dependency(%q<haml>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.0"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<acts_as_tree>, [">= 0"])
      s.add_dependency(%q<haml>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.0"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<acts_as_tree>, [">= 0"])
    s.add_dependency(%q<haml>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.0"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

