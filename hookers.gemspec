# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hookers/version"

Gem::Specification.new do |s|
  s.name        = "hookers"
  s.version     = Hookers::VERSION
  s.authors     = ["Ricardo Hermida Ruiz"]
  s.email       = ["rhruiz@gmail.com"]
  s.homepage    = ""
  s.summary     = "Git hooks and change logs"
  s.description = "Contains default hooks files to integrate git with pivotal tracker and change log generator"

  s.rubyforge_project = "hookers"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "slop", "~> 2.1"

  s.add_runtime_dependency "rest-client"
end
