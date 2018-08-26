# -*- encoding: utf-8 -*-
# stub: run_loop 2.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "run_loop".freeze
  s.version = "2.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Karl Krukow".freeze, "Joshua Moody".freeze]
  s.date = "2017-04-11"
  s.email = ["karl.krukow@xamarin.com".freeze, "josmoo@microsoft.com".freeze]
  s.executables = ["run-loop".freeze]
  s.files = ["bin/run-loop".freeze]
  s.homepage = "http://calaba.sh".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0".freeze)
  s.rubygems_version = "2.6.11".freeze
  s.summary = "The bridge between Calabash iOS and Xcode command-line tools like instruments and simctl.".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>.freeze, ["~> 1.8"])
      s.add_runtime_dependency(%q<awesome_print>.freeze, ["~> 1.2"])
      s.add_runtime_dependency(%q<CFPropertyList>.freeze, ["~> 2.2"])
      s.add_runtime_dependency(%q<thor>.freeze, ["< 1.0", ">= 0.18.1"])
      s.add_runtime_dependency(%q<command_runner_ng>.freeze, [">= 0.0.2"])
      s.add_runtime_dependency(%q<httpclient>.freeze, ["< 3.0", ">= 2.7.1"])
      s.add_runtime_dependency(%q<i18n>.freeze, ["< 1.0", ">= 0.7.0"])
      s.add_development_dependency(%q<rspec_junit_formatter>.freeze, ["~> 0.2"])
      s.add_development_dependency(%q<luffa>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.3"])
      s.add_development_dependency(%q<guard-rspec>.freeze, ["~> 4.3"])
      s.add_development_dependency(%q<guard-bundler>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<listen>.freeze, ["= 3.0.6"])
      s.add_development_dependency(%q<growl>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<stub_env>.freeze, ["< 2.0", ">= 1.0.1"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry-nav>.freeze, [">= 0"])
    else
      s.add_dependency(%q<json>.freeze, ["~> 1.8"])
      s.add_dependency(%q<awesome_print>.freeze, ["~> 1.2"])
      s.add_dependency(%q<CFPropertyList>.freeze, ["~> 2.2"])
      s.add_dependency(%q<thor>.freeze, ["< 1.0", ">= 0.18.1"])
      s.add_dependency(%q<command_runner_ng>.freeze, [">= 0.0.2"])
      s.add_dependency(%q<httpclient>.freeze, ["< 3.0", ">= 2.7.1"])
      s.add_dependency(%q<i18n>.freeze, ["< 1.0", ">= 0.7.0"])
      s.add_dependency(%q<rspec_junit_formatter>.freeze, ["~> 0.2"])
      s.add_dependency(%q<luffa>.freeze, ["~> 2.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.3"])
      s.add_dependency(%q<guard-rspec>.freeze, ["~> 4.3"])
      s.add_dependency(%q<guard-bundler>.freeze, ["~> 2.0"])
      s.add_dependency(%q<listen>.freeze, ["= 3.0.6"])
      s.add_dependency(%q<growl>.freeze, ["~> 1.0"])
      s.add_dependency(%q<stub_env>.freeze, ["< 2.0", ">= 1.0.1"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<pry-nav>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<json>.freeze, ["~> 1.8"])
    s.add_dependency(%q<awesome_print>.freeze, ["~> 1.2"])
    s.add_dependency(%q<CFPropertyList>.freeze, ["~> 2.2"])
    s.add_dependency(%q<thor>.freeze, ["< 1.0", ">= 0.18.1"])
    s.add_dependency(%q<command_runner_ng>.freeze, [">= 0.0.2"])
    s.add_dependency(%q<httpclient>.freeze, ["< 3.0", ">= 2.7.1"])
    s.add_dependency(%q<i18n>.freeze, ["< 1.0", ">= 0.7.0"])
    s.add_dependency(%q<rspec_junit_formatter>.freeze, ["~> 0.2"])
    s.add_dependency(%q<luffa>.freeze, ["~> 2.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.3"])
    s.add_dependency(%q<guard-rspec>.freeze, ["~> 4.3"])
    s.add_dependency(%q<guard-bundler>.freeze, ["~> 2.0"])
    s.add_dependency(%q<listen>.freeze, ["= 3.0.6"])
    s.add_dependency(%q<growl>.freeze, ["~> 1.0"])
    s.add_dependency(%q<stub_env>.freeze, ["< 2.0", ">= 1.0.1"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<pry-nav>.freeze, [">= 0"])
  end
end
