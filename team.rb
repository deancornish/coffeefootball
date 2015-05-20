class Team

  attr_accessor(:name, :abbrv, :home_city, :salary_cap, :win_loss, :home_kit, :away_kit)


  def initialize (name, abbrv, home_city, salary_cap, win_loss, home_kit, away_kit)
    @name = name
    @abbrv = abbrv
    @home_city = home_city
    @salary_cap = salary_cap
    @win_loss = win_loss
    @home_kit = home_kit
    @away_kit = away_kit
  end

end