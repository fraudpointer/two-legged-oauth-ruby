# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "two-legged-oauth/version"

Gem::Specification.new do |s|
  s.name        = "two-legged-oauth"
  s.version     = TwoLeggedOAuth::VERSION
  s.authors     = ["Nikos Dimitrakopoulos"]
  s.email       = ["n.dimitrakopoulos@fraudpointer.com"]
  s.homepage    = "https://github.com/fraudpointer/two-legged-oauth-ruby"
  s.summary     = %q{Support for Google Apps 2 Legged OAuth}
  s.description = %q{Extends the normal oauth gem to support Google's custom two legged OAuth (2LO) mechanism, needed for interacting with the Google Apps APIs through the Google Apps Marketplace.}

  s.rubyforge_project = "two-legged-oauth"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_dependency("oauth", "~> 0.4.0")
  s.add_development_dependency("bundler", ">= 1.0.0")
end
