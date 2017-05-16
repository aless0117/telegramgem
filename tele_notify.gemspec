# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tele_notify/version"

Gem::Specification.new do |s|
  s.name        = "tele_notify"
  s.version     = TeleNotify::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["ppati000", "Ryan"]
  s.email       = ["ppati000@me.com"]
  s.homepage    = "https://github.com/ppati000/tele_notify"
  s.summary     = "Rails gem to send notifications via Telegram"
  s.description = "TeleNotify by ppati000 enables your Rails app to send notifications/messages to your users via Telegram's Bot API. Forget email newsletters!

  * See installation instructions, demo app and source on https://github.com/ppati000/tele_notify. *"

  s.rubyforge_project = "acts_as_votable"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rest-client", "~> 2.0.0.rc1"

  s.add_development_dependency "sqlite3", '~> 1.3.9'
end
