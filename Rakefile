require 'rubygems'
require 'rspec/core/rake_task'

task :default => :unit

desc "run rack unit tests"
RSpec::Core::RakeTask.new(:unit) do |t| 
	t.pattern = "tests/unit/**/*_spec.rb"
	t.rspec_opts = %w{--colour --format progress --backtrace}

end


desc "run rack unit tests with details"
RSpec::Core::RakeTask.new(:unit_detailed) do |t| 
	t.pattern = "tests/unit/**/*_spec.rb"
	t.rspec_opts = %w{--colour --format documentation}

end
