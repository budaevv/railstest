$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "graph_form_sql/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "graph_form_sql"
  s.version     = GraphFormSql::VERSION
  s.authors     = ["Vadim Budaev"]
  s.email       = ["budaevv@gmail.com"]
  s.homepage    = ""
  s.summary     = "Gem creates chartjs graph from sql request"
  s.description = "Gem creates chartjs graph from sql request"
  s.description = "Gem creates chartjs graph from sql request"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"
  s.add_dependency "chart-js-rails"

  s.add_development_dependency "mysql2"
end
