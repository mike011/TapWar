# -*- encoding: utf-8 -*-
# stub: calabash-cucumber 0.20.5 ruby lib

Gem::Specification.new do |s|
  s.name = "calabash-cucumber".freeze
  s.version = "0.20.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Karl Krukow".freeze]
  s.date = "2017-04-19"
  s.description = "calabash-cucumber drives tests for native iOS apps. You must link your app with calabash-ios-server framework to execute tests.".freeze
  s.email = ["karl@lesspainful.com".freeze]
  s.executables = ["calabash-ios".freeze, "frank-calabash".freeze]
  s.files = ["bin/calabash-ios".freeze, "bin/frank-calabash".freeze]
  s.homepage = "http://calaba.sh".freeze
  s.licenses = ["EPL-1.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0".freeze)
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Client for calabash-ios-server for automated functional testing on iOS".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<cucumber>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<edn>.freeze, ["< 2.0", ">= 1.0.6"])
      s.add_runtime_dependency(%q<slowhandcuke>.freeze, ["~> 0.0.3"])
      s.add_runtime_dependency(%q<geocoder>.freeze, ["< 2.0", ">= 1.1.8"])
      s.add_runtime_dependency(%q<httpclient>.freeze, ["< 3.0", ">= 2.7.1"])
      s.add_runtime_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_runtime_dependency(%q<clipboard>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<run_loop>.freeze, ["< 3.0", ">= 2.4.1"])
      s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<awesome_print>.freeze, [">= 0"])
      s.add_development_dependency(%q<yard>.freeze, ["~> 0.8"])
      s.add_development_dependency(%q<redcarpet>.freeze, ["= 3.2.0"])
      s.add_development_dependency(%q<rspec_junit_formatter>.freeze, [">= 0"])
      s.add_development_dependency(%q<luffa>.freeze, [">= 1.1.0"])
      s.add_development_dependency(%q<rake>.freeze, ["= 10.5.0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry-nav>.freeze, [">= 0"])
      s.add_development_dependency(%q<rb-readline>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard-bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<listen>.freeze, ["= 3.0.6"])
      s.add_development_dependency(%q<growl>.freeze, [">= 0"])
      s.add_development_dependency(%q<stub_env>.freeze, [">= 0"])
      s.add_development_dependency(%q<oj>.freeze, ["~> 2.0"])
    else
      s.add_dependency(%q<cucumber>.freeze, [">= 0"])
      s.add_dependency(%q<edn>.freeze, ["< 2.0", ">= 1.0.6"])
      s.add_dependency(%q<slowhandcuke>.freeze, ["~> 0.0.3"])
      s.add_dependency(%q<geocoder>.freeze, ["< 2.0", ">= 1.1.8"])
      s.add_dependency(%q<httpclient>.freeze, ["< 3.0", ">= 2.7.1"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<clipboard>.freeze, ["~> 1.0"])
      s.add_dependency(%q<run_loop>.freeze, ["< 3.0", ">= 2.4.1"])
      s.add_dependency(%q<json>.freeze, [">= 0"])
      s.add_dependency(%q<awesome_print>.freeze, [">= 0"])
      s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
      s.add_dependency(%q<redcarpet>.freeze, ["= 3.2.0"])
      s.add_dependency(%q<rspec_junit_formatter>.freeze, [">= 0"])
      s.add_dependency(%q<luffa>.freeze, [">= 1.1.0"])
      s.add_dependency(%q<rake>.freeze, ["= 10.5.0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<pry-nav>.freeze, [">= 0"])
      s.add_dependency(%q<rb-readline>.freeze, [">= 0"])
      s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
      s.add_dependency(%q<guard-bundler>.freeze, [">= 0"])
      s.add_dependency(%q<listen>.freeze, ["= 3.0.6"])
      s.add_dependency(%q<growl>.freeze, [">= 0"])
      s.add_dependency(%q<stub_env>.freeze, [">= 0"])
      s.add_dependency(%q<oj>.freeze, ["~> 2.0"])
    end
  else
    s.add_dependency(%q<cucumber>.freeze, [">= 0"])
    s.add_dependency(%q<edn>.freeze, ["< 2.0", ">= 1.0.6"])
    s.add_dependency(%q<slowhandcuke>.freeze, ["~> 0.0.3"])
    s.add_dependency(%q<geocoder>.freeze, ["< 2.0", ">= 1.1.8"])
    s.add_dependency(%q<httpclient>.freeze, ["< 3.0", ">= 2.7.1"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<clipboard>.freeze, ["~> 1.0"])
    s.add_dependency(%q<run_loop>.freeze, ["< 3.0", ">= 2.4.1"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
    s.add_dependency(%q<awesome_print>.freeze, [">= 0"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
    s.add_dependency(%q<redcarpet>.freeze, ["= 3.2.0"])
    s.add_dependency(%q<rspec_junit_formatter>.freeze, [">= 0"])
    s.add_dependency(%q<luffa>.freeze, [">= 1.1.0"])
    s.add_dependency(%q<rake>.freeze, ["= 10.5.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<pry-nav>.freeze, [">= 0"])
    s.add_dependency(%q<rb-readline>.freeze, [">= 0"])
    s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
    s.add_dependency(%q<guard-bundler>.freeze, [">= 0"])
    s.add_dependency(%q<listen>.freeze, ["= 3.0.6"])
    s.add_dependency(%q<growl>.freeze, [">= 0"])
    s.add_dependency(%q<stub_env>.freeze, [">= 0"])
    s.add_dependency(%q<oj>.freeze, ["~> 2.0"])
  end
end
