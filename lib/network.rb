class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end
  def add_show(shows)
    @shows << shows
  end
  def highest_paid_actor
    characters = @shows.map do |show|
         show.characters
    end.compact.flatten
    characters.max_by do |character|
        character.salary
    end
  end
end
