guard :rspec, cmd: "bundle exec rspec" do
  require "guard/rspec/dsl"
  dsl = Guard::RSpec::Dsl.new(self)

  # Feel free to open issues for suggestions and improvements

  # RSpec files
  rspec = dsl.rspec
  watch(rspec.spec_helper) { rspec.spec_dir }
  watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files)
  watch(%r{^lib/(.+)_shell\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }

  # Ruby files
  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)

end

guard 'rack', :config => "bin/tic_tac_toe.ru" do
  watch('Gemfile.lock')
  watch('bin/tic_tac_toe.ru')
  watch(%r{^lib/.*})
end

guard :jasmine do
  watch(%r{spec/javascripts/spec\.js$}) { 'spec/javascripts' }
  watch(%r{spec/javascripts/.+Spec\.js$})
  watch(%r{spec/javascripts/fixtures/.+$})
  watch(%r{public/js/(.+?)\.js(?:\.\w+)*$}) { |m| "spec/javascripts/#{m[1]}Spec.js" }
end
