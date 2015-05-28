require 'yard'
require 'ohm'


# Construct a team of random players
# eventually add seed as a paramater

# def make_a_team_of_players
#     # a football team has 11 players
#     # it has 1 Goal Keeper (GK)
#     # it has 10 outfielders
#     #
#
#     team = Team.new("Melbourne Victory Women's Football Club", "MVWFC", "Melbourne", 300000, "60%", "Navy blue", "White")
#     coach = Person.new("Carice Van", "Houten", "F", 45, 11000,"Coach","Coach", "C")
#     assistant_coach = Person.new("Natalie", "Dormer", "F", 29, 11000,"Coach","Assistant Coach", "AC")
#
#     player01 = Person.new("Sarah", "Walsh", "F", 35, 300000,            "Player","Forward", "F")
#     player02 = Person.new("Cheryl", "Downes", "F", 29, 200000,          "Player","Midfielder", "M")
#     player03 = Person.new("Annette", "Cornish", "F", 36, 50000,         "Player","Midfielder", "M")
#     player04 = Person.new("Emily", "Mogic", "F", 30, 200000,            "Player","Midfielder", "M")
#     player05 = Person.new("Jodie", "Foster", "F", 42, 280000,           "Player","Midfielder", "M")
#     player06 = Person.new("Salma", "Hayek", "F", 43, 240000,            "Player","Forward", "F")
#     player07 = Person.new("Gillian", "Anderson", "F", 44, 230000,       "Player","Defender", "D")
#     player08 = Person.new("Deborah", "Woll", "F", 33, 60000,            "Player","Defender", "D")
#     player09 = Person.new("Anna", "Paquin", "F", 37, 75000,             "Player","Defender", "D")
#     player10 = Person.new("Sophie", "Turner", "F", 25, 45000,           "Player","Defender", "D")
#     player11 = Person.new("Gwendoline", "Christie", "F", 32, 250000,    "Player","Goal Keeper", "GK")
# end
#
#
# def make_one_team_play_the_other_return_the_winner(team1, team2)
#   # compute the winner
#   # return the winner
# end

# class Author < Ohm::Model
#     attribute :f_name
#     attribute :l_name
#     attribute :email
#     attribute :age, lambda { |x| x.to_i }
#     index :l_name
#     unique :email
#
#     collection :books, :Book
# end
#
# class Book < Ohm::Model
#     attribute :title
#     reference :author, :Author
# end
#
# author = Author.create(f_name: "John", l_name: "Smith", age: 34, email: "jjjsmith@gmail.com")
#
# book1 = Book.create(title: 'Moby Dick')
# book2 = Book.create(title: 'The Hobbit')
#
# book1.update(author: author)
# book2.update(author: author)
#
# author.books.each {|b| puts b.title}

Ohm.redis.call "FLUSHDB"

class League < Ohm::Model
  #attributes
    attribute :name
    attribute :abbrv
    attribute :country
    attribute :number_of_teams
  #constraints
    index :abbrv
    unique :name
    unique :abbrv

    collection :teams, :Team
end

class Team < Ohm::Model
  #attributes
    attribute :name
    attribute :abbrv
    attribute :home_city
    attribute :salary_cap
    attribute :win_loss
    attribute :home_kit
    attribute :away_kit
  #constraints
    index :name
    unique :name
    unique :abbrv

    reference :league, :League
    collection :persons, :Person
end

class Person < Ohm::Model
  #attributes
    attribute :first_name
    attribute :last_name
    attribute :gender
    attribute :age
    attribute :salary
    attribute :status

  #constraints
    index :first_name
    index :last_name
    index :status
    reference :team, :Team
    collection :gktraits, :GKTrait
    collection :nongktraits, :NonGKTrait
    collection :stafftraits,:StaffTrait
    collection :roles, :Role

end

class Role < Ohm::Model
  #attributes
  attribute :job_type
  attribute :position
  attribute :position_abbrv
  #constraints

  reference :person , :Person
end

class GKTrait < Ohm::Model
  #attributes

  attribute :technique #common
  attribute :aggression #common
  attribute :creativity #common
  attribute :decisions #common
  attribute :leadership #common
  attribute :positioning #common
  attribute :teamwork #common
  attribute :aerial #GK only
  attribute :agility #GK only
  attribute :communication #GK only
  attribute :handling #GK Only
  attribute :kicking #GK only
  attribute :reflexes #GK only
  attribute :throwing #GK Only
  attribute :pace #common
  attribute :stamina #common
  attribute :strength #common
  attribute :condition #common
  attribute :morale #common
  attribute :form #common
  attribute :potential
  attribute :average_rating

  #constraints

  reference :person , :Person
end
class NonGKTrait < Ohm::Model
  #attributes
  attribute :crossing #non GK only
  attribute :dribbling #non GK only
  attribute :heading #non GK only
  attribute :passing #non GK only
  attribute :shooting #non GK only
  attribute :tackling #non GK only
  attribute :technique #common
  attribute :aggression #common
  attribute :creativity #common
  attribute :decisions #common
  attribute :leadership #common
  attribute :movement #non GK only
  attribute :positioning #common
  attribute :teamwork #common
  attribute :pace #common
  attribute :stamina #common
  attribute :strength #common
  attribute :condition #common
  attribute :morale #common
  attribute :form #common
  attribute :potential
  attribute :average_rating

  #constraints

  reference :person , :Person
end

class StaffTrait < Ohm::Model
  #attributes
  #accredition levels
  attribute :fifa_license_level
  #skills
  attribute :strategy
  attribute :communication
  attribute :team_building
  attribute :skill_development
  attribute :leadership
  attribute :conflict_resolution
  attribute :sustainability
  attribute :celebrity_bias
  attribute :competitiveness
  attribute :financial_acument
  attribute :potential
  attribute :patience
  attribute :morale
  attribute :average_rating

  #constraints
  reference :person , :Person
end

league = League.create(name: "Westfield W-League", abbrv: "W-League", country: "Australia", number_of_teams: 9)
team = Team.create(name: "Melbourne Victory Women's Club", abbrv: "MVWFC", home_city: "Melbourne", salary_cap: 3000000, win_loss: "0.6", home_kit: "Navy Blue", away_kit: "White")
team.update(league: league)

# puts league.inspect
# puts team.inspect


person = Person.create(first_name: "Angela", last_name: "White", gender: "F", age: "21", salary: 100000, status: "Active")
role = Role.create(job_type: "Player", position: "Midfielder", position_abbrv: "M")
trait = NonGKTrait.create(
    crossing: 8,
    dribbling: 6,
    heading: 1,
    passing: 7,
    shooting: 7,
    tackling: 4,
    technique: 4,
    aggression:2,
    creativity: 1,
    decisions: 1,
    leadership: 4,
    movement: 4,
    positioning: 2,
    teamwork: 2,
    pace: 1,
    stamina: 5,
    strength: 6,
    condition: 5,
    morale: 9,
    form: 4,
    average_rating: 4)

trait.update(person: person)
role.update(person: person)
person.update(team: team)

person.roles.each {|b| puts b.job_type}


h = person.nongktraits.first.attributes

# puts h[:tackling]

class Array
  def sum
    inject(0.0) { |result, el| result + el }
  end

  def mean
    sum / size
  end
end


def get_rand_for_priority(array)
  result = []
  if array.size == 0
    raise ArgumentError, "require a importance value to return a number"
  else
    array.each do |value|
    case value
      when "L"
        result.push(rand(0..5))
      when "M"
        result.push(rand(0..10))
      when "H"
        result.push(rand(0..20))
      when "*"
        result.push(rand(0..20))
    else
      result.push(rand(0..10))
    end

    end
  end
  result
end


def create_a_trait(role)
  puts role.inspect
  if (role.instance_of? Role)
    # puts "Made it here"

    case role.position_abbrv
      when "M" #mid fielder
        rands = get_rand_for_priority(["M","H","L","H","M","M","H","*","H","H","M","H","H","H","M","M","M","M","M","*","*"])

        NonGKTrait.create(
            crossing:     rands[0],   # M rand(0-10)
            dribbling:    rands[1],   # H rand(0-20)
            heading:      rands[2],   # L rand(0-5)
            passing:      rands[3],   # H rand(0-20)
            shooting:     rands[4],   # M rand(0-10)
            tackling:     rands[5],   # M rand(0-10)
            technique:    rands[6],   # H rand(0-20)
            aggression:   rands[7],   # * rand(0-20)
            creativity:   rands[8],   # H rand(0-20)
            decisions:    rands[9],   # H rand(0-20)
            leadership:   rands[10],  # M rand(0-10)
            movement:     rands[11],  # H rand(0-20)
            positioning:  rands[12],  # H rand(0-20)
            teamwork:     rands[13],  # H rand(0-20)
            pace:         rands[14],  # M rand(0-10)
            stamina:      rands[15],  # M rand(0-10)
            strength:     rands[16],  # M rand(0-10)
            condition:    rands[17],  # M rand(0-10)
            morale:       rands[18],  # * rand(0-20)
            form:         rands[19],  # * rand(0-20)
            potential:    rands[20],  # * rand(0-20)
            average_rating: rands.mean)
      when "GK" #goal keeper
        rands = get_rand_for_priority(["M","H","L","M","H","H","M","*","M","H","H","H","H","M","L","L","H","H","L","*","*"])

        GKTrait.create(
            technique:        rands[0],   #     #common
            aggression:       rands[1],   #     #common
            creativity:       rands[2],   #     #common
            decisions:        rands[3],   #     #common
            leadership:       rands[4],   #     #common
            positioning:      rands[5],   #     #common
            teamwork:         rands[6],   #     #common
            aerial:           rands[7],   #     #GK only
            agility:          rands[8],   #     #GK only
            communication:    rands[9],   #     #GK only
            handling:         rands[10],  #     #GK Only
            kicking:          rands[11],  #     #GK only
            reflexes:         rands[12],  #     #GK only
            throwing:         rands[13],  #     #GK Only
            pace:             rands[14],  #     #common
            stamina:          rands[15],  #     #common
            strength:         rands[16],  #     #common
            condition:        rands[17],  #     #common
            morale:           rands[18],  #     #common
            form:             rands[19],  #     #common
            potential:        rands[20],  #
            average_rating:   rands.mean
        )
      when "F" #forward
        rands = get_rand_for_priority(["H", "M", "H", "M", "H", "L", "M", "*", "H", "M", "L", "M", "H", "M", "H", "M", "M", "M", "*", "*", "*"])

        NonGKTrait.create(
            crossing:     rands[0],   # H rand(0-20)
            dribbling:    rands[1],   # M rand(0-10)
            heading:      rands[2],   # H rand(0-20)
            passing:      rands[3],   # M rand(0-10)
            shooting:     rands[4],   # H rand(0-20)
            tackling:     rands[5],   # L rand(0-5)
            technique:    rands[6],   # M rand(0-10)
            aggression:   rands[7],   # * rand(0-20)
            creativity:   rands[8],   # H rand(0-20)
            decisions:    rands[9],   # M rand(0-10)
            leadership:   rands[10],  # L rand(0-5)
            movement:     rands[11],  # M rand(0-10)
            positioning:  rands[12],  # H rand(0-20)
            teamwork:     rands[13],  # M rand(0-10)
            pace:         rands[14],  # H rand(0-20)
            stamina:      rands[15],  # M rand(0-10)
            strength:     rands[16],  # M rand(0-10)
            condition:    rands[17],  # M rand(0-10)
            morale:       rands[18],  # * rand(0-20)
            form:         rands[19],  # * rand(0-20)
            potential:    rands[20],  # * rand(0-20)
            average_rating: rands.mean)


      when "D" #defender
        puts "defender"
      when "C" #coach
        puts "Coach"
      else
        raise ArgumentError, "Require a valid role, you gave me", role.position_abbrv
    end

  else
    raise ArgumentError, "Require object of type Role as a paramenter"
  end

  # if role is of Class type Role
  # get position abbreviation
  #case abbrev == GK
  #case abbrev == NonGk
  #case abbrev == Staff
  #default is nonGK
end
role2 = Role.create(job_type: "Player", position: "Forward", position_abbrv: "F")

result = create_a_trait(role2)
puts result.inspect


