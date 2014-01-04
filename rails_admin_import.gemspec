# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rails_admin_import"
  s.version = "0.1.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Steph Skardal"]
  s.date = "2012-11-08"
  s.email = "steph@endpoint.com"
  s.extra_rdoc_files = ["README.md"]
  s.files = ["app/views/rails_admin/main/import.html.erb", "config/locales/import.en.yml", "lib/rails_admin_import.rb", "lib/rails_admin_import/config.rb", "lib/rails_admin_import/config/base.rb", "lib/rails_admin_import/config/model.rb", "lib/rails_admin_import/engine.rb", "lib/rails_admin_import/import.rb", "lib/rails_admin_import/version.rb", "README.md"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Import functionality for rails admin"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
