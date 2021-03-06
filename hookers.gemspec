# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hookers/version"

Gem::Specification.new do |s|
  s.name        = "hookers"
  s.license     = "BSD"
  s.version     = Hookers::VERSION
  s.authors     = ["Ricardo Hermida Ruiz", "Flavio Henrique"]
  s.email       = ["rhruiz@gmail.com", "flavio.henrique85@gmail.com"]
  s.homepage    = ""
  s.summary     = "Git hooks and change logs"
  s.description = "Contains default hooks files to integrate git with pivotal tracker and change log generator"
  s.add_dependency "activesupport"

  s.rubyforge_project = "hookers"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "slop", "~> 2.1"
  s.add_development_dependency "rake"

  s.add_runtime_dependency "rest-client"
end
