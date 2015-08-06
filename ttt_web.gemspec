# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ttt_web/version'

Gem::Specification.new do |spec|
  spec.name          = "ttt_web"
  spec.version       = TttWeb::VERSION
  spec.authors       = ["Zefira Shannon"]
  spec.email         = ["zefira@hey.com"]

  spec.summary       = %q{Web interface for my TicTacToe game.}
  spec.description   = %q{A single page app for playing tictactoe on the interwebs. (Well, actually there are two pages really.)}
  spec.homepage      = "https://github.com/RadicalZephyr/ttt_web"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   << "ttt_web"
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "tic_tac_toe_gs", "~> 0.1"
  spec.add_runtime_dependency "rack", "~> 1.6"
  spec.add_runtime_dependency "mustache", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "3.2.0"
  spec.add_development_dependency "rack-test", "0.6.3"
  spec.add_development_dependency "jasmine", "2.3.0"
  spec.add_development_dependency "guard-rspec", "4.5.0"
  spec.add_development_dependency "guard-rack", "2.1.1"
  spec.add_development_dependency "guard-jasmine", "2.0.6"
end
