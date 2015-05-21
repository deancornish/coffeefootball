require "simplecov"
SimpleCov.start
require_relative '../../Person'
require_relative '../../Team'
require_relative '../../Role'
require_relative '../../League'


RSpec.configure do |config|

	config.expect_with :rspec do |c|
		c.syntax = :should
	end

	config.mock_with :rspec do |c|
		c.syntax = :should
	end

end
