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

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   << "ttt_web"
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "tic_tac_toe_gs", "~> 0.1"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end