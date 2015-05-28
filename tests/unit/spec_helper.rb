require "simplecov"
SimpleCov.start
require_relative '../../classes/Person'
require_relative '../../classes/Team'
require_relative '../../classes/League'


RSpec.configure do |config|

	config.expect_with :rspec do |c|
		c.syntax = :should
	end

	config.mock_with :rspec do |c|
		c.syntax = :should
	end

end
