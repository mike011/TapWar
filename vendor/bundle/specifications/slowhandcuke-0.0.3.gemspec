# -*- encoding: utf-8 -*-
# stub: slowhandcuke 0.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "slowhandcuke".freeze
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Pete Hodgson".freeze]
  s.date = "2010-11-07"
  s.description = "Cucumber formatter which gives feedback on the currently running step".freeze
  s.email = ["public@thepete.net".freeze]
  s.homepage = "http://github.com/moredip/slowhandcuke".freeze
  s.post_install_message = "\n*****************************************************************\n* To use the slowhandcuke formatter, simple add                 *\n*   --format 'Slowhandcuke::Formatter'                          * \n* to your cucumber.yml, Rakefile, or command line call          *\n*****************************************************************\n\n".freeze
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Cucumber formatter which gives feedback on the currently running step".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<cucumber>.freeze, [">= 0"])
    else
      s.add_dependency(%q<cucumber>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<cucumber>.freeze, [">= 0"])
  end
end
