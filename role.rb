class Role

  attr_accessor(:title, :position, :position_abbrv)


  def initialize (title, position, position_abbrv)
    @title = title
    @position = position
    @position_abbrv = position_abbrv

  end

end