require_relative './spec_helper.rb'

describe 'The game engine' do |variable|
	context 'person tests' do
		it 'can be instantiated' do
			minimal = Person.new("Sarah", "Walsh", "F", 35, 11000)
			minimal.should be_an_instance_of Person
			minimal.first_name.should eql "Sarah"
			minimal.last_name.should eql "Walsh"
			minimal.gender.should eql "F"
			minimal.age.should eql 35
			minimal.salary.should eql 11000
		end
  end

	context 'team tests' do
		it 'can be instantiated' do
			minimal = Team.new("Melbourne Victory Women's Football Club", "MVWFC", "Melbourne", 300000, "60%", "Navy blue", "White")
			minimal.should be_an_instance_of Team
			minimal.name.should eql "Melbourne Victory Women's Football Club"
			minimal.abbrv.should eql "MVWFC"
			minimal.home_city.should eql "Melbourne"
			minimal.salary_cap.should eql 300000
			minimal.win_loss.should eql "60%"
			minimal.home_kit.should eql "Navy blue"
			minimal.away_kit.should eql "White"
		end
	end

	context 'role tests' do
		it 'can be instantiated' do
			minimal = Role.new("Player", "Midfielder", "M")
			minimal.should be_an_instance_of Role
			minimal.title.should eql "Player"
			minimal.position.should eql "Midfielder"
			minimal.position_abbrv.should eql "M"
		end
	end
	context 'league tests' do
		it 'can be instantiated' do
			minimal = League.new("Westfield W-League", "W-League", "Australia", 9)
			minimal.should be_an_instance_of League
			minimal.name.should eql "Westfield W-League"
			minimal.abbrv.should eql "W-League"
			minimal.country.should eql "Australia"
			minimal.number_of_teams.should eql 9

		end
	end
end