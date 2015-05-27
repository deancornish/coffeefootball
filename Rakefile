require 'rubygems'
require 'rspec/core/rake_task'
require 'yard'

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


desc "Generate RDocs"
YARD::Rake::YardocTask.new(:rdoc) do |t|
	t.files   = ['main.rb' ]
	# t.files   = ['client_doco/example_client.rdoc', 'dev_doco/**/*.rdoc', 'client_doco/**/**.rdoc', 'application.rb' ]   # optional
	# t.options = ['--any', '--extra', '--opts'] # optional
end