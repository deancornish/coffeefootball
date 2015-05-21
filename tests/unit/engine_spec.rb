require_relative './spec_helper.rb'

describe 'The game engine' do |variable|
	context 'person tests' do
		it 'can be instantiated' do
			minimal = Person.new("Sarah", "Walsh", "F", "35", 11000)
			minimal.class.to_s.should eql("Person")
		end
  end

	context 'team tests' do
		it 'can be instantiated' do
			minimal = Team.new("Melbourne Victory Women's Football Club", "MVWFC", "Melbourne", 300000, "60%", "Navy blue", "White")
			minimal.class.to_s.should eql("Team")
		end
	end

	context 'role tests' do
		it 'can be instantiated' do
			minimal = Role.new("Player", "Midfielder", "M")
			minimal.class.to_s.should eql("Role")
		end
	end
end